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
				ELSE
					oElement.Visible = .F.
				ENDIF
			ELSE
				oElement.Visible = .F. && Set all other containers invisible
				
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
	IF(RIGHT(checkedElement.Name, 1) = "3")
		IF(checkedElement.Checked)
			ContainerElement.Checkbox4.Top = 265
			ContainerElement.Label4.Top = 265
			ContainerElement.Container5.Top = 325
			
			ContainerElement.Checkbox5.Top = 300
			ContainerElement.Label5.Top = 300
			ContainerElement.Container5.Top = 325
		ELSE
			ContainerElement.Checkbox4.Top = 145
			ContainerElement.Label4.Top = 145
			ContainerElement.Container4.Top = 170
			
			ContainerElement.Checkbox5.Top = 180
			ContainerElement.Label5.Top = 180
			ContainerElement.Container5.Top = 205
		ENDIF
	ELSE
		IF(RIGHT(checkedElement.Name, 1) = "4")
			
			ContainerElement.Checkbox4.Top = 145
			ContainerElement.Label4.Top = 145
			ContainerElement.Container4.Top = 170
			
			ContainerElement.Checkbox5.Top = 180
			ContainerElement.Label5.Top = 180
			ContainerElement.Container5.Top = 205
			
			IF checkedElement.Checked
				ContainerElement.Checkbox5.Top = 250
				ContainerElement.Label5.Top = 250
				ContainerElement.Container5.Top = 275
			ELSE
				ContainerElement.Checkbox5.Top = 180
				ContainerElement.Label5.Top = 180
				ContainerElement.Container5.Top = 205
			ENDIF
		ELSE
				ContainerElement.Checkbox4.Top = 145
				ContainerElement.Label4.Top = 145
				ContainerElement.Container4.Top = 170
				
				ContainerElement.Checkbox5.Top = 180
				ContainerElement.Label5.Top = 180
				ContainerElement.Container5.Top = 205
		ENDIF
	ENDIF
ENDFUNC


&& Setting up elements in container to an appropriate position
FUNCTION InitializeComponenets (ContainerElement)
	lnPositionCounter = 0
	
	FOR EACH oElement IN ContainerElement.Controls
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