LOCAL oForm
oForm = CREATEOBJECT('TestForm')
oForm.Show(1)
RETURN

DEFINE CLASS TestForm as Form
AutoCenter = .T.
PROCEDURE Init
This.AddProperty('tbrKeyboard',CREATEOBJECT('KeyboardToolbar'))
This.tbrKeyboard.Show()
ENDPROC
ADD OBJECT Text1 as Textbox WITH ;
Left = 20, Top = 20, Value = ""

ENDDEFINE

DEFINE CLASS KeyboardToolbar as Toolbar
ADD OBJECT cntKeyboard as Keyboard
ENDDEFINE

DEFINE CLASS Keyboard as Container
Width = 150
Height = 50
BorderWidth = 0
ADD OBJECT cmdQ as KeyButton WITH ;
Left = 0, Top = 0, Caption = "Q"
ADD OBJECT cmdW as KeyButton WITH ;
Left = 22, Top = 0, Caption = "W"
ADD OBJECT cmdE as KeyButton WITH ;
Left = 44, Top = 0, Caption = "E"
ADD OBJECT cmdR as KeyButton WITH ;
Left = 66, Top = 0, Caption = "R"

ADD OBJECT cmdA as KeyButton WITH ;
Left = 6, Top = 22, Caption = "A"
ADD OBJECT cmdS as KeyButton WITH ;
Left = 28, Top = 22, Caption = "S"
ADD OBJECT cmdD as KeyButton WITH ;
Left = 50, Top = 22, Caption = "D"
ADD OBJECT cmdF as KeyButton WITH ;
Left = 72, Top = 22, Caption = "F"

ENDDEFINE

DEFINE CLASS KeyButton as CommandButton
Width = 20
PROCEDURE Click
KEYBOARD (This.Caption)
ENDPROC

ENDDEFINE