Declare Integer ShellExecute In shell32 Integer hWindow, String lpOperation, String lpFile, String lpParameters, String lpDirectory, Integer nShowCmd
Declare Integer ShowWindow In user32 Integer hWindow, Integer nCmdShow
DECLARE integer Wow64DisableWow64FsRedirection IN kernel32 Long @
DECLARE integer Wow64RevertWow64FsRedirection IN kernel32 Long @

Public ofrm
ofrm = Createobject("MyForm")
ofrm.Show()

Define Class MyForm As Form
	hwndosk = -1
	ADD OBJECT txt1 as textbox
	ADD OBJECT cm1 as commandbutton WITH top = 50
	ADD OBJECT txt2 as textbox WITH top = 100
	ADD OBJECT cm2 as commandbutton WITH top = 150
	PROCEDURE Load
		LOCAL lnVal
		IF LEN(GETENV("ProgramFiles(x86)"))>1
			xxx=Wow64DisableWow64FsRedirection(lnVal)
		ENDIF
		ThisForm.hwndosk = ShellExecute(0, "open", "osk.exe", "", "", 1)
		IF LEN(GETENV("ProgramFiles(x86)"))>1
			xxx=Wow64RevertWow64FsRedirection(lnVal)
		ENDIF
	ENDPROC
ENDDEFINE 