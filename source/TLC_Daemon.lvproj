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
			<Item Name="tlc_daemon_errors.txt" Type="Document" URL="../Errors/tlc_daemon_errors.txt"/>
		</Item>
		<Item Name="Examples" Type="Folder">
			<Property Name="NI.SortType" Type="Int">0</Property>
			<Item Name="Example_Bool_Notifier_StopMech" Type="Folder">
				<Item Name="Example_Bool_Stop_Mechanism.lvproj" Type="Document" URL="../Examples/Example_Bool_Notifier_StopMech/Example_Bool_Stop_Mechanism.lvproj"/>
				<Item Name="example_multipleRun_stopNotifier.vi" Type="VI" URL="../Examples/Example_Bool_Notifier_StopMech/example_multipleRun_stopNotifier.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="example_singleRun_stopNotifier.vi" Type="VI" URL="../Examples/Example_Bool_Notifier_StopMech/example_singleRun_stopNotifier.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Task_BoolStopNotifier.lvclass" Type="LVClass" URL="../Examples/Example_Bool_Notifier_StopMech/Task_BoolStopNotifier/Task_BoolStopNotifier.lvclass"/>
			</Item>
			<Item Name="Example_Bool_User_Event_StopMech" Type="Folder">
				<Item Name="Example_Bool_User_Event_Stop_Mechanism.lvproj" Type="Document" URL="../Examples/Example_Bool_User_Event_StopMech/Example_Bool_User_Event_Stop_Mechanism.lvproj"/>
				<Item Name="example_boolUserEventStopMechanism.vi" Type="VI" URL="../Examples/Example_Bool_User_Event_StopMech/example_boolUserEventStopMechanism.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Task_BoolUserEventStopMech.lvclass" Type="LVClass" URL="../Examples/Example_Bool_User_Event_StopMech/Task_BoolUserEventStopMech/Task_BoolUserEventStopMech.lvclass"/>
			</Item>
			<Item Name="Example_Msg_User_Event_StopMech" Type="Folder">
				<Item Name="Example_Message_UserEvent_Stop_Mechanism.lvproj" Type="Document" URL="../Examples/Example_Msg_User_Event_StopMech/Example_Message_UserEvent_Stop_Mechanism.lvproj"/>
				<Item Name="example_msgUserEventStopMechanism.vi" Type="VI" URL="../Examples/Example_Msg_User_Event_StopMech/example_msgUserEventStopMechanism.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Task_MsgUserEventStopMech.lvclass" Type="LVClass" URL="../Examples/Example_Msg_User_Event_StopMech/Task_MsgUserEventStopMech/Task_MsgUserEventStopMech.lvclass"/>
			</Item>
		</Item>
		<Item Name="Providers" Type="Folder">
			<Item Name="Support" Type="Folder">
				<Item Name="addClassToProject.vi" Type="VI" URL="../Provider/Support/addClassToProject.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="buildClassIcon.vi" Type="VI" URL="../Provider/Support/buildClassIcon.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="buildITaskMethodPath.vi" Type="VI" URL="../Provider/Support/buildITaskMethodPath.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="getITaskClassPath.vi" Type="VI" URL="../Provider/Support/getITaskClassPath.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="getITaskClassTemplatePath.vi" Type="VI" URL="../Provider/Support/getITaskClassTemplatePath.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="getPackageFolder.vi" Type="VI" URL="../Provider/Support/getPackageFolder.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="getRandomColor.vi" Type="VI" URL="../Provider/Support/getRandomColor.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="ITaskClass_create.vi" Type="VI" URL="../Provider/Support/ITaskClass_create.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="newITaskClass.vi" Type="VI" URL="../Provider/Support/newITaskClass.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
			</Item>
		</Item>
		<Item Name="Resource" Type="Folder"/>
		<Item Name="Templates" Type="Folder">
			<Item Name="booleanNotifierStopMechanism.vi" Type="VI" URL="../Templates/booleanNotifierStopMechanism.vi">
				<Property Name="marked" Type="Int">0</Property>
			</Item>
			<Item Name="booleanUserEventStopMechanism.vi" Type="VI" URL="../Templates/booleanUserEventStopMechanism.vi">
				<Property Name="marked" Type="Int">0</Property>
			</Item>
			<Item Name="messageUserEventStopMechanism.vi" Type="VI" URL="../Templates/messageUserEventStopMechanism.vi">
				<Property Name="marked" Type="Int">0</Property>
			</Item>
			<Item Name="taskControllerExample.vi" Type="VI" URL="../Templates/taskControllerExample.vi">
				<Property Name="marked" Type="Int">0</Property>
			</Item>
			<Item Name="taskPrototype.vi" Type="VI" URL="../Templates/taskPrototype.vi">
				<Property Name="marked" Type="Int">0</Property>
			</Item>
		</Item>
		<Item Name="Tests" Type="Folder">
			<Item Name="readme.txt" Type="Document" URL="../../tests/readme.txt"/>
			<Item Name="TLC_Daemon_Tests.lvproj" Type="Document" URL="../../tests/TLC_Daemon_Tests.lvproj"/>
		</Item>
		<Item Name="TLC_Daemon.lvlib" Type="Library" URL="../TLC_Daemon.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Alignment.ctl" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Controls/Alignment.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Bit-array To Byte-array.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Bit-array To Byte-array.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="BodyText.ctl" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Controls/BodyText.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="BodyTextPosition.ctl" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Controls/BodyTextPosition.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Coerce Bad Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Coerce Bad Rect.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Color to RGB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/Color to RGB.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Compare Two Paths.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Compare Two Paths.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Create Mask.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Create Mask.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Dflt Data Dir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Dflt Data Dir.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Draw 1-Bit Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw 1-Bit Pixmap.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Draw 4-Bit Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw 4-Bit Pixmap.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Draw 8-Bit Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw 8-Bit Pixmap.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Draw Flattened Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Flattened Pixmap.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Draw Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Rect.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Draw Text at Point.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Text at Point.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Draw Text in Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Text in Rect.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Draw True-Color Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw True-Color Pixmap.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Draw Unflattened Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Unflattened Pixmap.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Empty Picture" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Empty Picture">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="FixBadRect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/FixBadRect.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Flatten Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pixmap.llb/Flatten Pixmap.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Font.ctl" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Controls/Font.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Get Image Subset.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Get Image Subset.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Graphic.ctl" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Controls/Graphic.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Icon Framework.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Classes/Icon Framework/Icon Framework.lvclass"/>
				<Item Name="Icon.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Classes/Icon/Icon.lvclass"/>
				<Item Name="IEColor.ctl" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Controls/IEColor.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="LabVIEW Icon API.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Icon API/LabVIEW Icon API.lvlib"/>
				<Item Name="LabVIEW Icon Stored Information.ctl" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Controls/LabVIEW Icon Stored Information.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Layer.ctl" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Controls/Layer.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Layer.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Classes/Layer/Layer.lvclass"/>
				<Item Name="LayerType.ctl" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Controls/LayerType.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Load &amp; Unload.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Classes/Load_Unload/Load &amp; Unload.lvclass"/>
				<Item Name="lv_icon.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/lv_icon.lvlib"/>
				<Item Name="LVPoint32TypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPoint32TypeDef.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="LVPointTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPointTypeDef.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Pathes.ctl" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Icon API/lv_icon/Controls/Pathes.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="PCT Pad String.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/PCT Pad String.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Picture to Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Picture to Pixmap.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Random Number (Range) DBL.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) DBL.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Random Number (Range) I64.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) I64.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Random Number (Range) U64.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) U64.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Random Number (Range).vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range).vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="RGB to Color.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/RGB to Color.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Set Pen State.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Set Pen State.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="sub_Random U32.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/sub_Random U32.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Unflatten Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pixmap.llb/Unflatten Pixmap.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
