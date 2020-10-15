x = CREATEOBJECT('KeyboardToolbar')

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
Width = 760
Height = 280
BorderWidth = 0

ADD OBJECT cmdGrave as KeyButton WITH ;
Left = 0, Top = 45, Caption = "`"
ADD OBJECT cmd1 as KeyButton WITH ;
Left = 50, Top = 45, Caption = "1"
ADD OBJECT cmd2 as KeyButton WITH ;
Left = 100, Top = 45, Caption = "2"
ADD OBJECT cmd3 as KeyButton WITH ;
Left = 150, Top = 45, Caption = "3"
ADD OBJECT cmd4 as KeyButton WITH ;
Left = 200, Top = 45, Caption = "4"
ADD OBJECT cmd5 as KeyButton WITH ;
Left = 250, Top = 45, Caption = "5"
ADD OBJECT cmd6 as KeyButton WITH ;
Left = 300, Top = 45, Caption = "6"
ADD OBJECT cmd7 as KeyButton WITH ;
Left = 350, Top = 45, Caption = "7"
ADD OBJECT cmd8 as KeyButton WITH ;
Left = 400, Top = 45, Caption = "8"
ADD OBJECT cmd9 as KeyButton WITH ;
Left = 450, Top = 45, Caption = "9"
ADD OBJECT cmd0 as KeyButton WITH ;
Left = 500, Top = 45, Caption = "0"
ADD OBJECT cmdMinus as KeyButton WITH ;
Left = 550, Top = 45, Caption = "-"
ADD OBJECT cmdPlus as KeyButton WITH ;
Left = 600, Top = 45, Caption = "="
ADD OBJECT cmdBack as KeyButton WITH ;
Left = 650, Top = 45, Caption = "Backspace", ;
Width = 110, Height = 40

ADD OBJECT cmdTab as KeyButton WITH ;
Left = 0, Top = 90, Caption = "Tab", ;
Width = 58, Height = 40
ADD OBJECT cmdQ as KeyButton WITH ;
Left = 60, Top = 90, Caption = "Q"
ADD OBJECT cmdW as KeyButton WITH ;
Left = 110, Top = 90, Caption = "W"
ADD OBJECT cmdE as KeyButton WITH ;
Left = 160, Top = 90, Caption = "E"
ADD OBJECT cmdR as KeyButton WITH ;
Left = 210, Top = 90, Caption = "R"
ADD OBJECT cmdY as KeyButton WITH ;
Left = 260, Top = 90, Caption = "T"
ADD OBJECT cmdT as KeyButton WITH ;
Left = 310, Top = 90, Caption = "Y"
ADD OBJECT cmdU as KeyButton WITH ;
Left = 360, Top = 90, Caption = "U"
ADD OBJECT cmdI as KeyButton WITH ;
Left = 410, Top = 90, Caption = "I"
ADD OBJECT cmdO as KeyButton WITH ;
Left = 460, Top = 90, Caption = "O"
ADD OBJECT cmdP as KeyButton WITH ;
Left = 510, Top = 90, Caption = "P"
ADD OBJECT cmdSquareBracketOpen as KeyButton WITH ;
Left = 560, Top = 90, Caption = "["
ADD OBJECT cmdSquareBracketClose as KeyButton WITH ;
Left = 610, Top = 90, Caption = "]"
ADD OBJECT cmdBackSlash as KeyButton WITH ;
Left = 660, Top = 90, Caption = "\"
ADD OBJECT cmdDel as KeyButton WITH ;
Left = 710, Top = 90, Caption = "Del"

ADD OBJECT cmdTab1 as KeyButton WITH ;
Left = 0, Top = 135, Caption = "Tab", ;
Width = 83, Height = 40
ADD OBJECT cmdA as KeyButton WITH ;
Left = 85, Top = 135, Caption = "A"
ADD OBJECT cmdS as KeyButton WITH ;
Left = 135, Top = 135, Caption = "S"
ADD OBJECT cmdD as KeyButton WITH ;
Left = 185, Top = 135, Caption = "D"
ADD OBJECT cmdF as KeyButton WITH ;
Left = 235, Top = 135, Caption = "F"
ADD OBJECT cmdG as KeyButton WITH ;
Left = 285, Top = 135, Caption = "G"
ADD OBJECT cmdH as KeyButton WITH ;
Left = 335, Top = 135, Caption = "H"
ADD OBJECT cmdJ as KeyButton WITH ;
Left = 385, Top = 135, Caption = "J"
ADD OBJECT cmdK as KeyButton WITH ;
Left = 435, Top = 135, Caption = "K"
ADD OBJECT cmdL as KeyButton WITH ;
Left = 485, Top = 135, Caption = "L"
ADD OBJECT cmdDoubleDot as KeyButton WITH ;
Left = 535, Top = 135, Caption = ";"
ADD OBJECT cmdQuote as KeyButton WITH ;
Left = 585, Top = 135, Caption = "'"
ADD OBJECT cmdEnter as KeyButton WITH ;
Left = 635, Top = 135, Caption = "Enter", ;
Width = 125, Height = 40

ADD OBJECT cmdShift as KeyButton WITH ;
Left = 0, Top = 180, Caption = "Shift", ;
Width = 108, Height = 40
ADD OBJECT cmdZ as KeyButton WITH ;
Left = 110, Top = 180, Caption = "Z"
ADD OBJECT cmdX as KeyButton WITH ;
Left = 160, Top = 180, Caption = "X"
ADD OBJECT cmdC as KeyButton WITH ;
Left = 210, Top = 180, Caption = "C"
ADD OBJECT cmdV as KeyButton WITH ;
Left = 260, Top = 180, Caption = "V"
ADD OBJECT cmdB as KeyButton WITH ;
Left = 310, Top = 180, Caption = "B"
ADD OBJECT cmdN as KeyButton WITH ;
Left = 360, Top = 180, Caption = "N"
ADD OBJECT cmdM as KeyButton WITH ;
Left = 410, Top = 180, Caption = "M"
ADD OBJECT cmdComma as KeyButton WITH ;
Left = 460, Top = 180, Caption = ","
ADD OBJECT cmdDot as KeyButton WITH ;
Left = 510, Top = 180, Caption = "."
ADD OBJECT cmdSlash as KeyButton WITH ;
Left = 560, Top = 180, Caption = "/"
ADD OBJECT cmdUp as KeyButton WITH ;
Left = 610, Top = 180, Caption = "^"
ADD OBJECT cmdShift1 as KeyButton WITH ;
Left = 660, Top = 180, Caption = "Shift", ;
Width = 100, Height = 40

ADD OBJECT cmdFn as KeyButton WITH ;
Left = 0, Top = 225, Caption = "Fn"
ADD OBJECT cmdCtrl as KeyButton WITH ;
Left = 50, Top = 225, Caption = "Ctrl"
ADD OBJECT cmdWindows as KeyButton WITH ;
Left = 100, Top = 225, Caption = " "
ADD OBJECT cmdAlt as KeyButton WITH ;
Left = 150, Top = 225, Caption = "Alt"
ADD OBJECT cmdSpace as KeyButton WITH ;
Left = 200, Top = 225, Caption = "Space", ;
Width = 208, Height = 40
ADD OBJECT cmdAltGr as KeyButton WITH ;
Left = 410, Top = 225, Caption = "Alt Gr"
ADD OBJECT cmdPrt as KeyButton WITH ;
Left = 460, Top = 225, Caption = "PrtSc"
ADD OBJECT cmdCtrl1 as KeyButton WITH ;
Left = 510, Top = 225, Caption = "Ctrl"
ADD OBJECT cmdLeft as KeyButton WITH ;
Left = 560, Top = 225, Caption = "<"
ADD OBJECT cmdDown as KeyButton WITH ;
Left = 610, Top = 225, Caption = " "
ADD OBJECT cmdRight as KeyButton WITH ;
Left = 660, Top = 225, Caption = ">"
ADD OBJECT cmdKey as KeyButton WITH ;
Left = 710, Top = 225, Caption = " "

ENDDEFINE

DEFINE CLASS KeyButton as CommandButton
Width = 48
Height = 40
PROCEDURE Click
KEYBOARD (This.Caption)
ENDPROC

ENDDEFINE