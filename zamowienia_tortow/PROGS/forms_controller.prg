FUNCTION ContainersController (ContainerParam, checkedElement)
**LPARAMETERS ContainerParam
	&& change state of check checkbox
	checkedElement.Checked = !checkedElement.Checked
	
	&& Loop through container elements
	FOR EACH oElement IN ContainerParam.Controls
		
		&& Check if the type of the element if Container
		IF(oElement.Class = "Container")
			
			&& Check if the container is the sub element of
			&& Checked element
			IF(RIGHT(oElement.Name, 1) = RIGHT(checkedElement.Name, 1))
				
				&& If checked element is checked
				&& Set its containers visible to TRUE
				&& Else make it unvisible
				IF(checkedElement.checked)
					oElement.Visible = .T.
					SET CURSOR ON	&& Turn on the cursor
									&& for case if container has textbox
				ELSE
					oElement.Visible = .F.
				ENDIF
			ELSE
				oElement.Visible = .F. && Set all other containers invisible
				SET CURSOR OFF		   && Turn of cursor for case if container has textbox
				
				&& Uncheck all checkboxes of other containers
				FOR EACH oContainerElement IN oElement.Controls
					
					&& Check if the element of container is checkbox
					IF(oContainerElement.Class = checkedElement.Class)
						oContainerElement.Checked = .F.
					ENDIF
				ENDFOR
			ENDIF
		ENDIF
		
		&& uncheck all other checkboxes
		IF(oElement.Class = checkedElement.Class)
			IF(oElement.Name != checkedElement.Name)
				oElement.Checked = .F.
			ENDIF
		ENDIF
	ENDFOR
	
ENDFUNC	


FUNCTION ChangeElementsPosition (ContainerElement, checkedElement)
	
	***************************************************************
	* Because of some bug, needed to position to left last element*
	***************************************************************
	* 						TODO: FIX IT						  *
	***************************************************************

	&& ContainerElement.Checkbox5.Left = 0
	&& ContainerElement.Label5.Left = 40
	&& ContainerElement.Container5.Left = 40

	IF(RIGHT(checkedElement.Name, 1) = "4")

		IF(checkedElement.Checked)
			ContainerElement.Checkbox5.Top = 280
			ContainerElement.Label5.Top = 280
			ContainerElement.Container5.Top = 310
			
			ContainerElement.Checkbox6.Top = 320
			ContainerElement.Label6.Top = 320
			ContainerElement.Container6.Top = 350
		ELSE
			ContainerElement.Checkbox5.Top = 200
			ContainerElement.Label5.Top = 200
			ContainerElement.Container5.Top = 230
			
			ContainerElement.Checkbox6.Top = 240
			ContainerElement.Label6.Top = 240
			ContainerElement.Container6.Top = 270
		ENDIF
	ELSE
		IF(RIGHT(checkedElement.Name, 1) = "5")
			ContainerElement.Checkbox5.Top = 200
			ContainerElement.Label5.Top = 200
			ContainerElement.Container5.Top = 230

			IF checkedElement.Checked
				ContainerElement.Checkbox6.Top = 320
				ContainerElement.Label6.Top = 320
				ContainerElement.Container6.Top = 350
			ELSE
				ContainerElement.Checkbox6.Top = 240
				ContainerElement.Label6.Top = 240
				ContainerElement.Container6.Top = 270
			ENDIF
		ELSE
			ContainerElement.Checkbox6.Top = 240
			ContainerElement.Label6.Top = 240
			ContainerElement.Container6.Top = 270
		
			ContainerElement.Checkbox3.Top = 120
			ContainerElement.Label3.Top = 120

			ContainerElement.Checkbox4.Top = 160
			ContainerElement.Label4.Top = 160
			ContainerElement.Container4.Top = 190

			ContainerElement.Checkbox5.Top = 200
			ContainerElement.Label5.Top = 200
			ContainerElement.Container5.Top = 230
		ENDIF
	ENDIF
ENDFUNC

*****************************************************************************
FUNCTION ChangeContainer2ElementsPosition (ContainerElement, checkedElement)
*****************************************************************************

	***************************************************************
	* Because of some bug, needed to position to left last element*
	***************************************************************
	* 						TODO: FIX IT						  *
	***************************************************************
*!*		ContainerElement.Checkbox7.Left = 0
*!*		ContainerElement.Label7.Left = 60
*!*		ContainerElement.Container7.Left = 40
	
	
	IF(RIGHT(checkedElement.Name, 1) = "1")
		IF(checkedElement.Checked)
		
			&& Set checkboxes to the lower position
			ContainerElement.Checkbox2.Top = checkedElement.Top + 70
			ContainerElement.Checkbox3.Top = ContainerElement.Checkbox2.Top + 40
			ContainerElement.Checkbox4.Top = ContainerElement.Checkbox3.Top + 40
			ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 40
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set checkboxes to the higher Position
			ContainerElement.Label2.Top = ContainerElement.Label1.Top + 70
			ContainerElement.Label3.Top = ContainerElement.Label2.Top + 40
			ContainerElement.Label4.Top = ContainerElement.Label3.Top + 40
			ContainerElement.Label5.Top = ContainerElement.Label4.Top + 40
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40
			
			&& set the container to an appropriate position
			ContainerElement.Container1.Top = checkedElement.Top + 30
		ELSE
		
			&& Set checkboxes to the higher position
			ContainerElement.Checkbox2.Top = checkedElement.Top + 40
			ContainerElement.Checkbox3.Top = ContainerElement.Checkbox2.Top + 40
			ContainerElement.Checkbox4.Top = ContainerElement.Checkbox3.Top + 40
			ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 40
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set labels to the higher position
			ContainerElement.Label2.Top = ContainerElement.Label1.Top + 40
			ContainerElement.Label3.Top = ContainerElement.Label2.Top + 40
			ContainerElement.Label4.Top = ContainerElement.Label3.Top + 40
			ContainerElement.Label5.Top = ContainerElement.Label4.Top + 40
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40
		ENDIF
	ENDIF
	
	IF(RIGHT(checkedElement.Name, 1) = "2")
		IF(checkedElement.Checked)
		
			&& Set checkboxes position
			ContainerElement.Checkbox2.Top = ContainerElement.Checkbox1.Top + 40
			ContainerElement.Checkbox3.Top = ContainerElement.Checkbox2.Top + 110
			ContainerElement.Checkbox4.Top = ContainerElement.Checkbox3.Top + 40
			ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 40
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set labels position
			ContainerElement.Label2.Top = ContainerElement.Label1.Top + 40
			ContainerElement.Label3.Top = ContainerElement.Label2.Top + 110
			ContainerElement.Label4.Top = ContainerElement.Label3.Top + 40
			ContainerElement.Label5.Top = ContainerElement.Label4.Top + 40
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40
			

			&& set the container of this checkbox to an appropriate position
			ContainerElement.Container2.Top = checkedElement.Top + 30
		ELSE
		
			&& Set checkboxes position higher
			ContainerElement.Checkbox2.Top = ContainerElement.Checkbox1.Top + 40
			ContainerElement.Checkbox3.Top = ContainerElement.Checkbox2.Top + 40
			ContainerElement.Checkbox4.Top = ContainerElement.Checkbox3.Top + 40
			ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 40
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set labels position higher
			ContainerElement.Label2.Top = ContainerElement.Label1.Top + 40
			ContainerElement.Label3.Top = ContainerElement.Label2.Top + 40
			ContainerElement.Label4.Top = ContainerElement.Label3.Top + 40
			ContainerElement.Label5.Top = ContainerElement.Label4.Top + 40
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40
		ENDIF
	ENDIF
	
	IF(RIGHT(checkedElement.Name, 1) = "3")
		IF(checkedElement.Checked)
		
			&& Set checkboxes position
			ContainerElement.Checkbox2.Top = ContainerElement.Checkbox1.Top + 40
			ContainerElement.Checkbox3.Top = ContainerElement.Checkbox2.Top + 40
			ContainerElement.Checkbox4.Top = ContainerElement.Checkbox3.Top + 70
			ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 40
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set labels position
			ContainerElement.Label2.Top = ContainerElement.Label1.Top + 40
			ContainerElement.Label3.Top = ContainerElement.Label2.Top + 40
			ContainerElement.Label4.Top = ContainerElement.Label3.Top + 70
			ContainerElement.Label5.Top = ContainerElement.Label4.Top + 40
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40

			&& set the container to an appropriate position
			ContainerElement.Container3.Top = checkedElement.Top + 30
		ELSE
		
			&& Set checkboxes position higher
			ContainerElement.Checkbox4.Top = ContainerElement.Checkbox3.Top + 40
			ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 40
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set labels position higher
			ContainerElement.Label4.Top = ContainerElement.Label3.Top + 40
			ContainerElement.Label5.Top = ContainerElement.Label4.Top + 40
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40
		ENDIF
	ENDIF
	
	IF(RIGHT(checkedElement.Name, 1) = "4")
		IF(checkedElement.Checked)
		
			&& Set checkboxes position
			ContainerElement.Checkbox2.Top = ContainerElement.Checkbox1.Top + 40
			ContainerElement.Checkbox3.Top = ContainerElement.Checkbox2.Top + 40
			ContainerElement.Checkbox4.Top = ContainerElement.Checkbox3.Top + 40
			ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 110
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set labels position
			ContainerElement.Label2.Top = ContainerElement.Label1.Top + 40
			ContainerElement.Label3.Top = ContainerElement.Label2.Top + 40
			ContainerElement.Label4.Top = ContainerElement.Label3.Top + 40
			ContainerElement.Label5.Top = ContainerElement.Label4.Top + 110
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40

			&& set the container to an appropriate position
			ContainerElement.Container4.Top = checkedElement.Top + 30
		ELSE
		
			&& Set checkboxes position higher
			ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 40
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set labels position higher
			ContainerElement.Label5.Top = ContainerElement.Label4.Top + 40
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40
		ENDIF
	ENDIF
	
	IF(RIGHT(checkedElement.Name, 1) = "5")
		IF(checkedElement.Checked)
		
			&& Set checkboxes position
			ContainerElement.Checkbox2.Top = ContainerElement.Checkbox1.Top + 40
			ContainerElement.Checkbox3.Top = ContainerElement.Checkbox2.Top + 40
			ContainerElement.Checkbox4.Top = ContainerElement.Checkbox3.Top + 40
			ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 40
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 70
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set labels position
			ContainerElement.Label2.Top = ContainerElement.Label1.Top + 40
			ContainerElement.Label3.Top = ContainerElement.Label2.Top + 40
			ContainerElement.Label4.Top = ContainerElement.Label3.Top + 40
			ContainerElement.Label5.Top = ContainerElement.Label4.Top + 40
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 70
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40

			&& set the container to an appropriate position
			ContainerElement.Container5.Top = checkedElement.Top + 30
		ELSE
		
			&& Set checkboxes position higher
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set labels position higher
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40
		ENDIF
	ENDIF
	
	IF(RIGHT(checkedElement.Name, 1) = "6")
		IF(checkedElement.Checked)
		
			&& Set checkboxes position
			ContainerElement.Checkbox2.Top = ContainerElement.Checkbox1.Top + 40
			ContainerElement.Checkbox3.Top = ContainerElement.Checkbox2.Top + 40
			ContainerElement.Checkbox4.Top = ContainerElement.Checkbox3.Top + 40
			ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 40
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 110
			
			&& Set labels position
			ContainerElement.Label2.Top = ContainerElement.Label1.Top + 40
			ContainerElement.Label3.Top = ContainerElement.Label2.Top + 40
			ContainerElement.Label4.Top = ContainerElement.Label3.Top + 40
			ContainerElement.Label5.Top = ContainerElement.Label4.Top + 40
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 110

			&& set the container to an appropriate position
			ContainerElement.Container6.Top = checkedElement.Top + 30
		ELSE
		
			&& Set checkboxes position higher
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set labels position higher
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40
		ENDIF
	ENDIF
	
	IF(RIGHT(checkedElement.Name, 1) = "7")
		IF(checkedElement.Checked)
		
			&& Set checkboxes position
			ContainerElement.Checkbox2.Top = ContainerElement.Checkbox1.Top + 40
			ContainerElement.Checkbox3.Top = ContainerElement.Checkbox2.Top + 40
			ContainerElement.Checkbox4.Top = ContainerElement.Checkbox3.Top + 40
			ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 40
			ContainerElement.Checkbox6.Top = ContainerElement.Checkbox5.Top + 40
			ContainerElement.Checkbox7.Top = ContainerElement.Checkbox6.Top + 40
			
			&& Set labels position
			ContainerElement.Label2.Top = ContainerElement.Label1.Top + 40
			ContainerElement.Label3.Top = ContainerElement.Label2.Top + 40
			ContainerElement.Label4.Top = ContainerElement.Label3.Top + 40
			ContainerElement.Label5.Top = ContainerElement.Label4.Top + 40
			ContainerElement.Label6.Top = ContainerElement.Label5.Top + 40
			ContainerElement.Label7.Top = ContainerElement.Label6.Top + 40

			&& set the container to an appropriate position
			ContainerElement.Container7.Top = checkedElement.Top + 30
			
		ENDIF
	ENDIF
ENDFUNC


&& Setting up elements in container to an appropriate position
FUNCTION InitializeComponenets (ContainerElement)
	lnPositionCounter = 0
	
	FOR EACH oElement IN ContainerElement.Controls
		MESSAGEBOX(oElement.Name)
		IF(oElement.Class = "Checkbox_image")
			lnPositionCounter = oElement.Top
		ELSE
			IF(oElement.Class = "Container")
				IF (oElement.ControlCount = 6)
					lnPositionCounter = lnPositionCounter + 125
				ELSE
					IF(oElement.ControlCount = 4)
						lnPositionCounter = lnPositionCounter + 95
					ENDIF
				ENDIF
			ENDIF
		ENDIF
		
		oElement.Top = lnPositionCounter
	ENDFOR
ENDFUNC

*****************************************************************************
FUNCTION SetObjectProperty (oTort, oText, propertyName)
*****************************************************************************
	DO CASE
		CASE propertyName = "Ksztalt"
			oTort.Ksztalt = oText
		CASE propertyName = "Waga"
			oTort.Waga = oText
		CASE propertyName = "SmakChild"
			oTort.Smak = oText
		CASE propertyName = "Napis"
			oTort.Napis = oText
	ENDCASE
ENDFUNC

*****************************************************************************
FUNCTION SetObjectChildProperty (oTort, oText, propertyName)
*****************************************************************************
		DO CASE
		CASE propertyName = "KsztaltChild"
			oTort.KsztaltChild = " [" + oText + "]"
		CASE propertyName = "WagaChild"
			oTort.WagaChild = " [" + oText + "]"
		CASE propertyName = "SmakChild"
			oTort.SmakChild = " [" + oText + "]"
		CASE propertyName = "NapisChld"
			oTort.NapisChild = " [" + oText + "]"
	ENDCASE
ENDFUNC


***********************************************
FUNCTION GetContainerValue (oContainer)
***********************************************

	LOCAL ln_ReturnValue AS String, oCheckedElement AS Checkbox
	ln_ReturnValue = ""

	FOR EACH oElement IN oContainer.Controls
		IF(oElement.Class = "Checkbox_image")
			IF(oElement.Checked)
				oCheckedElement = RIGHT(oElement.Name, 1)
			ENDIF
		ENDIF
	ENDFOR

	FOR EACH oElement IN oContainer.Controls
		IF(oElement.Class = "Label")
			IF(RIGHT(oElement.Name, 1) = oCheckedElement)
				ln_ReturnValue = ln_ReturnValue + oElement.Caption
			ENDIF
		ENDIF
	ENDFOR
	
	FOR EACH oElement IN oContainer.Controls
		IF(oElement.Class = "Container")
			IF(RIGHT(oElement.Name,1) = oCheckedElement)
				ln_ReturnValue = ln_ReturnValue + " [" + GetContainerValue(oElement) + "]"
			ENDIF
		ENDIF
	ENDFOR


	RETURN ln_ReturnValue
ENDFUNC

***********************************************
FUNCTION GetContainerValue1 (oContainer)
***********************************************

	LOCAL ln_ReturnValue AS String, oCheckedElement AS Checkbox
	ln_ReturnValue = ""

	FOR EACH oElement IN oContainer.Controls
		IF(oElement.Class = "Checkbox_image")
			IF(oElement.Checked)
				oCheckedElement = RIGHT(oElement.Name, 1)
			ENDIF
		ENDIF
	ENDFOR

	FOR EACH oElement IN oContainer.Controls
		IF(oElement.Class = "Label")
			IF(SUBSTR(oElement.Name, 6, 1) = oCheckedElement)
				IF(RIGHT(oElement.Name, 1) = "1")
					ln_ReturnValue = ln_ReturnValue + " [" + GetContainerValue(oElement) + "]"
				ENDIF
			ENDIF
		ENDIF
	ENDFOR

	RETURN ln_ReturnValue
ENDFUNC






























