<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="23008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Errors" Type="Folder">
			<Item Name="errors.txt" Type="Document" URL="../Errors/errors.txt"/>
		</Item>
		<Item Name="Examples" Type="Folder">
			<Property Name="NI.SortType" Type="Int">0</Property>
			<Item Name="Example_Bool_Notifier_StopMech" Type="Folder">
				<Item Name="Task_BoolStopNotifier" Type="Folder">
					<Item Name="Task_BoolStopNotifier.lvclass" Type="LVClass" URL="../Examples/Example_Bool_Notifier_StopMech/Task_BoolStopNotifier/Task_BoolStopNotifier.lvclass"/>
				</Item>
				<Item Name="Example_Bool_Stop_Mechanism.lvproj" Type="Document" URL="../Examples/Example_Bool_Notifier_StopMech/Example_Bool_Stop_Mechanism.lvproj"/>
				<Item Name="example_multipleRun_stopNotifier.vi" Type="VI" URL="../Examples/Example_Bool_Notifier_StopMech/example_multipleRun_stopNotifier.vi"/>
				<Item Name="example_singleRun_stopNotifier.vi" Type="VI" URL="../Examples/Example_Bool_Notifier_StopMech/example_singleRun_stopNotifier.vi"/>
			</Item>
			<Item Name="Example_Bool_User_Event_StopMech" Type="Folder">
				<Item Name="Task_BoolUserEventStopMech" Type="Folder">
					<Item Name="Task_BoolUserEventStopMech.lvclass" Type="LVClass" URL="../Examples/Example_Bool_User_Event_StopMech/Task_BoolUserEventStopMech/Task_BoolUserEventStopMech.lvclass"/>
				</Item>
				<Item Name="Example_Bool_User_Event_Stop_Mechanism.lvproj" Type="Document" URL="../Examples/Example_Bool_User_Event_StopMech/Example_Bool_User_Event_Stop_Mechanism.lvproj"/>
				<Item Name="example_boolUserEventStopMechanism.vi" Type="VI" URL="../Examples/Example_Bool_User_Event_StopMech/example_boolUserEventStopMechanism.vi"/>
			</Item>
			<Item Name="Example_Msg_User_Event_StopMech" Type="Folder">
				<Item Name="Task_MsgUserEventStopMech" Type="Folder">
					<Item Name="Task_MsgUserEventStopMech.lvclass" Type="LVClass" URL="../Examples/Example_Msg_User_Event_StopMech/Task_MsgUserEventStopMech/Task_MsgUserEventStopMech.lvclass"/>
				</Item>
				<Item Name="Example_Message_UserEvent_Stop_Mechanism.lvproj" Type="Document" URL="../Examples/Example_Msg_User_Event_StopMech/Example_Message_UserEvent_Stop_Mechanism.lvproj"/>
				<Item Name="example_msgUserEventStopMechanism.vi" Type="VI" URL="../Examples/Example_Msg_User_Event_StopMech/example_msgUserEventStopMechanism.vi"/>
			</Item>
		</Item>
		<Item Name="Templates" Type="Folder">
			<Item Name="taskPrototype.vi" Type="VI" URL="../Templates/taskPrototype.vi"/>
		</Item>
		<Item Name="Tests" Type="Folder">
			<Item Name="readme.txt" Type="Document" URL="../../tests/readme.txt"/>
			<Item Name="TLC_Daemon_Tests.lvproj" Type="Document" URL="../../tests/TLC_Daemon_Tests.lvproj"/>
		</Item>
		<Item Name="TLC_Daemon.lvlib" Type="Library" URL="../TLC_Daemon.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Random Number (Range) DBL.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) DBL.vi"/>
				<Item Name="Random Number (Range) I64.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) I64.vi"/>
				<Item Name="Random Number (Range) U64.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) U64.vi"/>
				<Item Name="Random Number (Range).vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range).vi"/>
				<Item Name="sub_Random U32.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/sub_Random U32.vi"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
