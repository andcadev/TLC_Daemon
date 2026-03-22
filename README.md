# TLC_Daemon

**Asynchronous Lifecycle & Task Engine for LabVIEW**

---

## Overview

**TLC_Daemon** is a lightweight LabVIEW toolkit for launching, controlling, and stopping asynchronous background tasks in a clean, object-oriented way.
The name is inspired by the Unix/Linux concept of a daemon: a process running silently in the background, independently from the caller. Unlike system daemons, TLC_Daemon tasks have a well-defined lifecycle and are designed to be started and stopped on demand.

TLC_Daemon encapsulates the recurring pattern of asynchronous task management in LabVIEW (launching a VI asynchronously, controlling its lifecycle, handling cooperative stop, and retrieving the final result) into a clean, reusable, and extensible structure. It defines a systematic way to pass data to these tasks and stop them cleanly.


TLC_Daemon provides a minimal but powerful abstraction to manage:

- Asynchronous execution
- Task lifecycle (start, stop, completion)
- Cooperative soft-stop mechanisms
- Final result retrieval

The goal is a **simple and consistent framework** without unnecessary complexity or heavy infrastructure.

## Core Concept

In TLC_Daemon, a **task** is an asynchronous VI that runs independently, controlled through a `TaskController`, with a well-defined lifecycle and a cooperative stop mechanism. The `TaskController` is responsible for orchestrating the full lifecycle of a task, from startup to completion.

Each task:

- Runs asynchronously
- Receives its configuration via an `ITask` object
- Can be stopped via a soft-stop mechanism
- Returns its final state as an output object


## Architecture

The system is built around three main components. Each component has a single responsibility and interacts through well-defined interfaces.

```mermaid
classDiagram
    class ITask {
        <<interface>>
        +getTaskReference() VIRefnum
        +getStopMechanism() ITaskStopMechanism
    }
    class ITaskStopMechanism {
        <<interface>>
        +requestStop() void
    }
    class TaskController {
        -task : ITask
        -stopMechanism : ITaskStopMechanism
        -taskRef : VIRefnum
        -cachedResult : ITask
        +new(task : ITask) TaskController
        +start() void
        +stop(timeout : int) void
        +isRunning() bool
        +destroy(timeout : int) ITask
    }
    class ConcreteTask {
        -config
        -stopMechanism : ITaskStopMechanism
        +getTaskReference() VIRefnum
        +getStopMechanism() ITaskStopMechanism
    }
    class NotifierStopMechanism {
        -notifierRef : NotifierRef
        +requestStop() void
        +getNotifierRef() NotifierRef
    }
    class QueueStopMechanism {
        -queueRef : QueueRef
        +requestStop() void
        +getQueueRef() QueueRef
    }
    class UserEventStopMechanism {
        -userEvent : UserEvent
        +requestStop() void
        +getUserEvent() UserEvent
    }
    ITask <|.. ConcreteTask : implements
    ITaskStopMechanism <|.. NotifierStopMechanism : implements
    ITaskStopMechanism <|.. QueueStopMechanism : implements
    ITaskStopMechanism <|.. UserEventStopMechanism : implements
    TaskController ..> ITask : uses
    TaskController ..> ITaskStopMechanism : uses
```

### `ITask` (Interface)

Defines the contract for any task.

| Method | Returns |
|---|---|
| `getTaskReference()` | `VIRefnum` |
| `getStopMechanism()` | `ITaskStopMechanism` |

### `ITaskStopMechanism` (Interface)

Encapsulates how a task is requested to stop. 

| Method | Description |
|---|---|
| `requestStop()` | Signals the task to stop |

The `TaskController` does not need to know *how* the stop works, only that it can trigger it.

TLC_Daemon ships with three ready-to-use stop mechanism implementations covering the most common LabVIEW patterns: `NotifierStopMechanism` for boolean notifier-based stop, `UserEventStopMechanism` for event-driven stop, and `QueueStopMechanism` for message-based stop. Custom mechanisms can be added by implementing ITaskStopMechanism.

`ITaskStopMechanism` intentionally exposes only `requestStop()` and not a dual `checkStop()` method. Reading the stop signal is always done directly by the task VI, which, after casting to the concrete type, has direct access to the underlying primitive. This avoids unnecessary dynamic dispatch overhead in the task loop and, more importantly, makes the pattern compatible with LabVIEW Event Structures: a user event must be handled inside an Event Structure in the task VI itself, and cannot be encapsulated behind a method call.

### `TaskController`

Central component responsible for managing the task lifecycle.

| Method | Description |
|---|---|
| `new(task)` | Creates a new controller and associates the task |
| `start()` | Launches the task asynchronously. Single use |
| `stop(timeout)` | Requests stop and waits for completion |
| `isRunning()` | Checks actual execution state; collects result if already finished |
| `destroy(timeout)` | Calls `Stop` if the task is still running, then returns `ITask out` |


## Execution Flow

### New + Start

1. `TaskController.New(task)` is called — the task is associated with the controller
2. `TaskController.Start()` is called
3. Controller retrieves the VI reference via `ITask.GetTaskReference()`
4. VI is launched asynchronously
5. Async call reference is stored internally

### Stop

1. `TaskController.Stop(timeout)` is called
2. Controller calls `RequestStop()` on the stop mechanism
3. Controller waits via `Wait on Asynchronous Call`
4. `ITask out` is retrieved and cached internally

### Destroy

1. `TaskController.Destroy(timeout)` is called
2. If the task is still running, `Stop` is called internally
3. The cached `ITask out` is returned to the caller

### Passive Completion

If a task stops on its own, the `TaskController` detects it the next time `IsRunning()` or `Stop()` is called. The result is retrieved and cached at that point.


## Task VI Contract

Every task must follow a standard connector pane:

| Terminal | Direction |
|---|---|
| `ITask in` | Input |
| `error in` | Input |
| `ITask out` | Output |
| `error out` | Output |

LabVIEW enforces connector pane compatibility natively when the VI is launched asynchronously. No additional validation is needed.


## Implementing a Task

### 1. Create a class that implements `ITask`

Store configuration data in the class private data, and implement:

- `getTaskReference()` — returns the VI reference for this task
- `getStopMechanism()` — returns the appropriate stop mechanism

### 2. Write the task VI

```
Inputs:  ITask in, error in
Outputs: ITask out, error out

Logic:
  Cast ITask in → ConcreteTask
  Loop:
    Execute task logic
    Check stop signal
  On stop:
    Cleanup
    Return updated task as ITask out
```

> **Note:** The cast is the responsibility of the task implementer. The controller does not validate class/VI compatibility. A mismatch between the task class and the VI will result in a runtime error.

## Example

### `DataLoggingTask`

```
Class: DataLoggingTask implements ITask

Private Data:
  - file path      : Path
  - queue ref      : Queue Ref
  - stop notifier  : Notifier Ref

getTaskReference()  → DataLoggingTask.vi
getStopMechanism()  → NotifierStopMechanism
```

### `DataLoggingTask.vi` behavior

```
Cast ITask → DataLoggingTask
Loop:
  Acquire data
  Write to file
  Check notifier (stop signal)
On stop:
  Flush and close file
  Return updated DataLoggingTask as ITask out
```


## Stop Mechanism Design

Stop is always **cooperative (soft stop)**. The controller triggers the stop; the task owns the shutdown.

Supported patterns:

- Boolean notifier
- Message queue (e.g. "Stop" command)
- User Events

No forced abort is used. Tasks must regularly check the stop condition and exit cleanly.


## State Handling

The `TaskController` uses a **lazy synchronization model** (it does not actively monitor tasks).

State is updated only when `IsRunning()` or `Stop()` is called. Internally, the controller tracks:

- Async call reference validity
- Whether the result has been collected
- Cached `ITask out`

The async result is collected **only once** and then cached. `Stop()` is safe to call even after the task has already completed (it returns the cached result without error).
This approach keeps the controller lightweight while ensuring consistency when interacting with completed tasks.


## Design Goals

- Simplicity first
- Minimal boilerplate
- Strong separation of concerns
- Extensibility without complexity
- LabVIEW-native patterns


## When to Use TLC_Daemon

Use it when you need:

- Background tasks with a defined lifecycle
- Controlled startup and shutdown
- Pluggable stop mechanisms
- Reusable async execution patterns

TLC_Daemon is intentionally minimal. Task orchestration, messaging, and more complex patterns can be built on top of it. This toolkit may provide the foundation, not the full solution.

## Requirements

- LabVIEW 2023 or later

## Source Code

The full source code for this package is available on GitHub:
https://github.com/andcadev/TLC_Daemon

## License

This project is licensed under the MIT License.
See [LICENSE](LICENSE) file for details.

## Author

**Andrea Cadei**  
Creator of *The LabVIEW Corner*

GitHub: https://github.com/andcadev  
Website: https://thelabviewcorner.com  
LinkedIn: https://www.linkedin.com/in/andrea-cadei/
