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
					IF(oContainerElement.Class = "Check_shape")
						oContainerElement.Checked = .F.
					ENDIF
				ENDFOR
			ENDIF
		ENDIF
		
		&& uncheck all other checkboxes
		IF(oElement.Class = "Check_shape")
			IF(oElement.Name != checkedElement.Name)
				oElement.Checked = .F.
			ENDIF
		ENDIF
	ENDFOR
	
ENDFUNC	


FUNCTION ChangeElementsPosition (checkedElement, ContainerElement)
	
	***************************************************************
	* Because of some bug, needed to position to left last element*
	***************************************************************
	* 						TODO: FIX IT						  *
	***************************************************************

	&& ContainerElement.Checkbox5.Left = 0
	&& ContainerElement.Label5.Left = 40
	&& ContainerElement.Container5.Left = 40

	IF(RIGHT(checkedElement.Name, 1) = "3")
		IF(checkedElement.Checked)
			ContainerElement.Checkbox4.Top = 300
			ContainerElement.Label4.Top = 300
			ContainerElement.Container5.Top = 330
			
			ContainerElement.Checkbox5.Top = 340
			ContainerElement.Label5.Top = 340
			ContainerElement.Container5.Top = 370
		ELSE
			ContainerElement.Checkbox4.Top = 160
			ContainerElement.Label4.Top = 160
			ContainerElement.Container4.Top = 190
			
			ContainerElement.Checkbox5.Top = 200
			ContainerElement.Label5.Top = 200
			ContainerElement.Container5.Top = 220
		ENDIF
	ELSE
		IF(RIGHT(checkedElement.Name, 1) = "4")
			
			ContainerElement.Checkbox4.Top = 160
			ContainerElement.Label4.Top = 160
			ContainerElement.Container4.Top = 190
			
			IF checkedElement.Checked
				ContainerElement.Checkbox5.Top = ContainerElement.Checkbox4.Top + 130
				ContainerElement.Label5.Top = ContainerElement.Label4.Top + 130
				ContainerElement.Container5.Top = ContainerElement.Checkbox5.Top + 30
			ELSE
				ContainerElement.Checkbox5.Top = 200
				ContainerElement.Label5.Top = 200
				ContainerElement.Container5.Top = 230
			ENDIF
		ELSE
			ContainerElement.Checkbox3.Top = 120
			ContainerElement.Checkbox4.Top = 160
			ContainerElement.Checkbox5.Top = 200
			
			ContainerElement.Label3.Top = 120
			ContainerElement.Label4.Top = 160
			ContainerElement.Label5.Top = 200
			ContainerElement.Container5.Top = 230
		ENDIF
	ENDIF
ENDFUNC

FUNCTION ChangeContainer2ElementsPosition (ContainerElement, checkedElement)
	***************************************************************
	* Because of some bug, needed to position to left last element*
	***************************************************************
	* 						TODO: FIX IT						  *
	***************************************************************
	ContainerElement.Checkbox7.Left = 0
	ContainerElement.Label7.Left = 60
	ContainerElement.Container7.Left = 40
	
	
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
			

			&& set the container to an appropriate position
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
		IF(oElement.Class = "Check_Shape")
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