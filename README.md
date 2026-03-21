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

In TLC_Daemon, a **task** is an asynchronous VI that runs independently, controlled through a `TaskController`, with a well-defined lifecycle and a cooperative stop mechanism.

Each task:

- Runs asynchronously
- Receives its configuration via an `ITask` object
- Can be stopped via a soft-stop mechanism
- Returns its final state as an output object


## Architecture

The system is built around three main components.

### `ITask` (Interface)

Defines the contract for any task.

| Method | Returns |
|---|---|
| `GetTaskReference()` | `VI Ref` |
| `GetStopMechanism()` | `ITaskStopMechanism` |

### `ITaskStopMechanism` (Interface)

Encapsulates how a task is requested to stop.

| Method | Description |
|---|---|
| `RequestStop()` | Signals the task to stop |

Typical implementations: Boolean notifier, queue-based messaging, user events.

The `TaskController` does not need to know *how* the stop works, only that it can trigger it.

### `TaskController`

Central component responsible for managing the task lifecycle.

| Method | Description |
|---|---|
| `Start(task)` | Launches the task asynchronously |
| `Stop(timeout)` | Requests stop, waits for completion, returns `ITask out` |
| `IsRunning()` | Checks actual execution state; collects result if already finished |


## Execution Flow

### Start

1. `TaskController.Start(task)` is called
2. Controller retrieves the VI reference via `ITask.GetTaskReference()`
3. VI is launched asynchronously
4. Async call reference is stored internally

### Stop

1. `TaskController.Stop(timeout)` is called
2. Controller calls `RequestStop()` on the stop mechanism
3. Controller waits via `Wait on Asynchronous Call`
4. On completion, `ITask out` is retrieved and returned to the caller

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

- `GetTaskReference()` — returns the VI reference for this task
- `GetStopMechanism()` — returns the appropriate stop mechanism

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

> **Note:** The cast is the responsibility of the task implementer. The controller does not validate class/VI compatibility.


## Example

### `DataLoggingTask`

```
Class: DataLoggingTask implements ITask

Private Data:
  - file path      : Path
  - queue ref      : Queue Ref
  - stop notifier  : Notifier Ref

GetTaskReference()  → DataLoggingTask.vi
GetStopMechanism()  → NotifierStopMechanism
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

Stop is always **cooperative (soft stop)**. The controller triggers the stop; the task decides how and when to exit cleanly.

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

TLC_Daemon is intentionally minimal. Task orchestration, messaging, and more complex patterns can be built on top of it. This toolkit may provide the foundation, not the full building.

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
