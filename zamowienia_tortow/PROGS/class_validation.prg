**********************************************
FUNCTION ContainerValidation(containerElement)
**********************************************
&& LPARAMETERS containerElement
		IF(containerElement.Class = "Container")
			FOR EACH oElement IN containerElement.Controls
				IF(oElement.Class = "Checkbox_image")	
					IF(oElement.Checked)
						
						&& If there is checked checkbox, then check if it is
						&& has a sub container
						isParent = IsParentElement(containerElement, oElement)
						
						&& IF it is a parent element
						IF(isParent)
							childContainer = GetChildContainer(ContainerElement, oElement)    && Get sub container of selected element
							isChildValid = ContainerValidation(childContainer)				  && Should return .T. or .F.
							
							&& If the sub container is invalid return .F.
							IF(!isChildValid)
								RETURN .F.
							ENDIF
						ENDIF
						
						containerElement.ErrorLabel.Visible = .F. && Hide error star
						RETURN .T.	&& Valid container
					ENDIF
				ELSE
					IF(oElement.Class = "Textbox_class_app")
						IF(TextboxValidation(oElement))
							RETURN .T.
						ENDIF
					ELSE
						IF(oElement.Class = "Textbox")
							RETURN .T.
						ENDIF
					ENDIF
				ENDIF
			ENDFOR
		ENDIF
		
	containerElement.ErrorLabel.Visible = .T. && Show error star
RETURN .F.	&& Invalid container

&& If there is sub container of checked checkbox
&& return subcontainer object, if not
&& return null
**********************************************************
FUNCTION IsParentElement(containerElement, checkedElement)
**********************************************************
	FOR EACH oElement IN containerElement.Controls
		
		&& Check if element is a container
		IF(oElement.Class = "Container")
			&& Check if it is a sub container of selected checkbox
			IF(RIGHT(oElement.Name, 1) = RIGHT(checkedElement.Name, 1))
				RETURN .T.
			ENDIF
		ENDIF
	ENDFOR

	RETURN .F.
ENDFUNC

&& Return child element of selected checkbox in container
*******************************************************
FUNCTION GetChildContainer(oContainer, oCheckedElement)
*******************************************************
	FOR EACH oElement IN oContainer.Controls
		
		&& Check if element is a container
		IF(oElement.Class = "Container")
			&& Check if it is a sub container of selected checkbox
			IF(RIGHT(oElement.Name, 1) = RIGHT(oCheckedElement.Name, 1))
				RETURN oElement
			ENDIF
		ENDIF
	ENDFOR
RETURN

&& Textbox validation
************************************
FUNCTION TextboxValidation(oTextbox)
************************************

	IF(EMPTY(oTextbox.Text))
		oTextbox.BackColor = RGB(255,0,0)
		oTextbox.Value = "Prosze, wpisac wpisy"
		RETURN .F.
	ELSE
		IF(oTextbox.Text = "Prosze, wpisac wpisy")
			oTextbox.BackColor = RGB(255,0,0)
			RETURN .F.
		ENDIF
	ENDIF
	
	oTextbox.BackColor = RGB(255,255,255)
RETURN .T.
