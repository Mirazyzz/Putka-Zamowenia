
	****************
	* Main Program *
	****************															


&& Set initial properties

SET TALK OFF && Turn of service messages
SET DATE TO ANSI && Set format to yyyy.mm.dd
SET CENTURY ON && Turn on the full year display (current year is: 2020,
			   && to be clear full year is required). Can be next year

SET PATH TO PROGS, LIBS, PRG, MENUS, DATA, REPORTS, GRAPHICS, FORMS && Set project's folders path
SET PROCEDURE TO "C:\zamowienia_tortow\PROGS\class_validation.prg" ADDITIVE

DO FORM glowna_forma && start the main form
READ events
