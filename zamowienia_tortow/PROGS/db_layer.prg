**********************************************
 FUNCTION _STRTOCURSOR(cBufor,cAlias,lTable)
**********************************************
 LOCAL ARRAY xFil[1]
 LOCAL cStr,nLen,nSta,nRec,nLeR,xVal,nSko
       nLeR = VAL(STREXTRACT(cBufor,"<LEN>","</LEN>"))
       nRec = VAL(STREXTRACT(cBufor,"<REC>","</REC>"))
       cDat = STREXTRACT(cBufor,"<DATA>","</DATA>")
IF !USED(cAlias)
 IF PCOUNT() == 3 .AND. lTable
       cStr = "CREATE TABLE ('"+cAlias+".dbf') FREE ("+STREXTRACT(cBufor,"<STR>","</STR>")+")"
 ELSE
       cStr = "CREATE CURSOR "+cAlias+" ("+STREXTRACT(cBufor,"<STR>","</STR>")+")"
 ENDIF
      &cStr
ELSE
       SELECT (cAlias)
       ZAP IN (cAlias)
ENDIF


       nLen = AFIELDS(xFil,cAlias)
     cBufor = ""

IF nRec > 0
  LOCAL rLen,lnAdd
      m.rLen = LEN(m.cDat)
     m.lnAdd = GlobalAlloc(0,m.rLen)
             = Sys(2600,m.lnAdd,m.rLen,m.cDat)
 TRY
                 DIMENSION xDat[nRec,nLen]
     FOR nSta = 1 TO nRec
       &&cPom = LEFT(cDat,m.nLeR)
         cPom = Sys(2600,(m.lnAdd+((nSta*m.nLeR)-(m.nLeR-1)))-1,m.nLeR)
              FOR xSta = 1 TO nLen
                  nSko = xFil[xSta,3]
			       DO CASE
			          CASE xFil[xSta,2] == "I"
			               xDat[nSta,xSta] = VAL(LEFT(cPom,11))
			               nSko = 11
			          CASE xFil[xSta,2] == "N"
			               xDat[nSta,xSta] = VAL(LEFT(cPom,xFil[xSta,3]))
			          CASE xFil[xSta,2] == "Y"
			               xDat[nSta,xSta] = VAL(LEFT(cPom,14))
			               nSko = 14
			          CASE xFil[xSta,2] == "D"
			               xDat[nSta,xSta] = CTOD(LEFT(cPom,10))
			               nSko = 10
			          CASE xFil[xSta,2] == "C"
			               xDat[nSta,xSta] = LEFT(cPom,xFil[xSta,3])
			          CASE xFil[xSta,2] == "T"
			               xDat[nSta,xSta] = CTOT(LEFT(cPom,19))
			               nSko = 19
			          CASE xFil[xSta,2] == "M"
			               xDat[nSta,xSta] = LEFT(cPom,xFil[xSta,1024])
			               nSko = 1024
			       ENDCASE
			               cPom = SUBSTR(cPom,nSko+1)
              NEXT
         &&cDat = SUBSTR(cDat,nLeR+1)
     NEXT
 CATCH
 ENDTRY
 &&Free memeory !!!
     GlobalFree(m.lnAdd)
                    INSERT INTO (cAlias) FROM ARRAY xDat
ENDIF
RETURN IIF(USED(cAlias).AND.RECCOUNT(cAlias)==nRec,.T.,.F.)


**********************************************
 FUNCTION _CURSORTOSTR(cAlias)
**********************************************
 LOCAL ARRAY xFil[1]
 LOCAL cStr,nLen,nSta,nRec,nLeR,xVal
       nLen = AFIELDS(xFil,cAlias)
       nRec = RECCOUNT(cAlias)
       cStr = ""
       cStr = cStr + "<REC>"+TRANSFORM(nRec)+"</REC>"
       cStr = cStr + "<STR>"
       nLeR = 0
   FOR nSta = 1 TO nLen
               cStr = cStr + xFil[nSta,1] + " " + xFil[nSta,2] + "("+ TRANSFORM(xFil[nSta,3]) + ","+ TRANSFORM(xFil[nSta,4])+"),"
       DO CASE
          CASE xFil[nSta,2] == "C"
               nLeR = nLeR + xFil[nSta,3]
          CASE xFil[nSta,2] == "N"
               nLeR = nLeR + xFil[nSta,3]
          CASE xFil[nSta,2] == "I"
               nLeR = nLeR + 11
          CASE xFil[nSta,2] == "Y"
               nLeR = nLeR + 14
          CASE xFil[nSta,2] == "T"
               nLeR = nLeR + 19
          CASE xFil[nSta,2] == "D"
               nLeR = nLeR + 10
          CASE xFil[nSta,2] == "M"
               nLeR = nLeR + 1024
       ENDCASE
   NEXT
               cStr = LEFT(cStr,LEN(cStr)-1)+"</STR><LEN>"+TRANSFORM(nLeR)+"</LEN><DATA>"
   SELECT (cAlias)
   SCAN
           FOR nSta = 1 TO nLen
               xVal = eval(xFil[nSta,1])
		       DO CASE
		          CASE xFil[nSta,2] == "I"
		                cStr = cStr + STR(m.xVal,11)
		          CASE xFil[nSta,2] == "N"
		                cStr = cStr + STR(m.xVal,xFil[nSta,3],xFil[nSta,4])
		          CASE xFil[nSta,2] == "Y"
		                cStr = cStr + STR(m.xVal,14,4)
		          CASE xFil[nSta,2] == "D"
		                cStr = cStr + DTOC(m.xVal)
		          CASE xFil[nSta,2] == "C"
		                cStr = cStr + m.xVal
		          CASE xFil[nSta,2] == "T"
		                cStr = cStr + TTOC(m.xVal,3)
		          CASE xFil[nSta,2] == "M"
		                cStr = cStr + PADR(m.xVal,1024)
		       ENDCASE
           NEXT
   ENDSCAN
       cStr = cStr + "</DATA>"
RETURN cStr