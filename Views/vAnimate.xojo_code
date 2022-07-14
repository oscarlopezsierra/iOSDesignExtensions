#tag MobileScreen
Begin MobileScreen vAnimate
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   Device = 1
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   Orientation = 0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c00000000
   Title           =   "Animations"
   Top             =   0
   Begin MobileButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   Button1, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   Button1, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 4, 1, 30, , True
      Caption         =   "P"
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   20
      LockedInPosition=   False
      Scope           =   2
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   73
      Visible         =   True
      Width           =   30
   End
   Begin MobileImageViewer ImageViewer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ImageViewer1, 8, , 0, False, +1.00, 4, 1, 160, img_height, True
      AutoLayout      =   ImageViewer1, 1, Button1, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 3, Button1, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   ImageViewer1, 7, , 0, False, +1.00, 4, 1, 160, , True
      ControlCount    =   0
      DisplayMode     =   1
      Enabled         =   True
      Height          =   160
      Image           =   0
      Left            =   20
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   111
      Visible         =   True
      Width           =   160
   End
   Begin MobileButton Button2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button2, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   Button2, 7, , 0, False, +1.00, 4, 1, 104, , True
      AutoLayout      =   Button2, 3, ImageViewer1, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Button2, 8, , 0, False, +1.00, 4, 1, 30, , True
      Caption         =   "Change height"
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   196
      LockedInPosition=   False
      Scope           =   2
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   111
      Visible         =   True
      Width           =   104
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub UpdateButton()
		  if buttonValue then
		    
		    button1.SetImageXC(Picture.SystemImage("stop.circle", 0))
		    
		  else
		    
		    Button1.SetImageXC(Picture.SystemImage("play.circle", 0))
		    
		  end if
		  
		  self.LayoutIfNeededXC
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateImageHeight()
		  if self.Constraint("img_height").Offset = 30 then
		    
		    self.Constraint("img_height").Offset = 160
		    
		  else
		    
		    self.Constraint("img_height").Offset = 30
		  end if
		  
		  self.LayoutIfNeededXC
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private buttonValue As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Pressed()
		  buttonValue = not buttonValue
		  
		  //Animate the change
		  Dim options As Integer = Ctype(ViewExtensionsXC.UIViewAnimationOptions.UIViewAnimationOptionTransitionFlipFromBottom, Integer)
		  
		  Dim duration As Double = 0.2
		  
		  ViewExtensionsXC.TransitionWithViewDurationOptionsXC(me, duration, _
		  options, _
		  new iOSBlock(AddressOf UpdateButton))
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Caption = ""
		  me.SetImageXC(Picture.SystemImage("play.circle", 0))
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ImageViewer1
	#tag Event
		Sub Opening()
		  me.Image = Picture.SystemImage("photo.fill", 160)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button2
	#tag Event
		Sub Pressed()
		  
		  
		  ViewExtensionsXC.AnimateWithDurationXC(1.0, new iosblock(AddressOf UpdateImageHeight))
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
