Declare Integer ShellExecute In shell32 Integer hWindow, String lpOperation, String lpFile, String lpParameters, String lpDirectory, Integer nShowCmd
Declare Integer SetParent In User32 Integer HWnd, Integer ParenthWnd
Declare Integer FindWindow In user32 String lpClassName, String lpWindowName
Declare Integer GetWindowLong In user32 Integer HWnd, Integer nIndex
Declare Integer SetWindowLong In user32 Integer HWnd, Integer nIndex, Integer dwNewLong
Declare Integer SetFocus In user32 Integer
Declare Integer SetWindowPos In user32 INTEGER HWnd, INTEGER hWndInsertAfter, INTEGER x, INTEGER Y, INTEGER cx, INTEGER cy, INTEGER uFlags
Declare Integer GetWindowThreadProcessId in Win32API Integer hWnd, Integer @lpdwProcessId
Declare Integer OpenProcess in Win32API Integer dwDesiredAccess, Integer bInheritHandle, Integer dwProcessID
Declare Integer TerminateProcess in Win32API Integer hProcess, Integer uExitCode

Clear
Public ofrm
ofrm = Createobject("MyForm")
ofrm.Show()

Define Class MyForm As Form
	Width = 900
	Height=430
	hOsk = 0
	nOskHeight = 200
	ShowWindow = 2
	Desktop = .T.
	AutoCenter = .T.
	Add Object txt1 As TextBox
	Add Object cmd1 As CommandButton With Top = 50 , Caption = "\<Click"
	Add Object txt2 As TextBox WITH top = 100
	Add Object cmd2 As CommandButton With Top = 150 , Caption = "\<Click"
	Add Object tmr As Timer With Interval = 300,Enabled = .F.
	
	PROCEDURE Init
		BINDEVENT(This.txt1,'GotFocus',This,'MyGotFocus')
		BINDEVENT(This.txt2,'GotFocus',This,'MyGotFocus')
		BINDEVENT(This.txt1,'LostFocus',This,'MyLostFocus')
		BINDEVENT(This.txt2,'LostFocus',This,'MyLostFocus')
	PROCEDURE Mygotfocus
		IF ThisForm.hosk = 0
			ThisForm.tmr.Enabled = .T.
		ELSE
			SetWindowPos(ThisForm.hOsk, 0, 0, SYSMETRIC(2)-ThisForm.nOskHeight,SYSMETRIC(1), ThisForm.nOskHeight,  0x0010+0x0040) && move to the bottom of the form and show
		ENDIF
	ENDPROC
	PROCEDURE Mylostfocus
		SetWindowPos(ThisForm.hOsk, 0, 0, SYSMETRIC(2)-ThisForm.nOskHeight,SYSMETRIC(1), ThisForm.nOskHeight,  0x0010+0x0080) && move to the bottom of the form and show
	ENDPROC
	Procedure Load
		= ShellExecute(0, "open", "C:\Program Files (x86)\FreeVK\freevk.exe", "", "", 1) &&& the path can be generalised
	ENDPROC
	
	Procedure tmr.Timer
		LOCAL nStyle
		ThisForm.hOsk = FindWindow (.Null., "Free Virtual Keyboard (www.FreeVirtualKeyboard.com)")
		nStyle = GetWindowLong (ThisForm.hOsk, -16)
		**************************************************************************************************************
		* If you want the keyboard to be embeded in your form
		* uncomment the following 4 lines
		* and in all SetWindowPos() change SYSMETRIC(2) with Thisform.height and SYSMETRIC(1) with Thisform.width
		**************************************************************************************************************
*!*			SetWindowLong (ThisForm.hOsk, -16, Bitset(m.nStyle,30)) && set child
*!*			SetWindowLong (ThisForm.hOsk, -16, Bitclear(m.nStyle,31)) && remove popup
*!*			SetParent(ThisForm.hOsk, Thisform.HWnd) && change parent
*!*			SetWindowLong (ThisForm.hOsk, -16, BITAND(m.nStyle,2^32-1-0xCF0000)) && remove the title bar
		SetWindowPos(ThisForm.hOsk, 0, 0, SYSMETRIC(2)-ThisForm.nOskHeight,SYSMETRIC(1), ThisForm.nOskHeight,  0x0010+0x0040) && move to the bottom of the form and show

		This.Enabled = .F.
	ENDPROC
	PROCEDURE destroy
		LOCAL lnProcessID
		UNBINDEVENTS(This)
		lnProcessID = 0
		GetWindowThreadProcessId(ThisForm.hOsk, @lnProcessID)
		TerminateProcess(OpenProcess(1, 1, m.lnProcessID) , 0)
	ENDPROC
Enddefine 