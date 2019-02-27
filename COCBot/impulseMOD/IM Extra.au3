; #FUNCTION# ====================================================================================================================
; Name ..........: SM MOD Extra
; Description ...:
; Syntax ........:
; Parameters ....: ---
; Return values .: ---
; Author ........: RK
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......: ---
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: ---
; ===============================================================================================================================


Func _StringRemoveBlanksFromSplit(ByRef $strMsg) ;Remove empty string pipes from string e.g |Test||Hey all| becomes Test|Hey all (Using in Chat to avoid empty messages)
	Local $strArray = StringSplit($strMsg, "|", 2)
	$strMsg = ""

	For $i = 0 To (UBound($strArray) - 1)
		If $strArray[$i] <> "" Then
			$strMsg = $strMsg & $strArray[$i] & "|"
		EndIf
	Next
	If ($strMsg <> "") Then $strMsg = StringTrimRight($strMsg, 1) ;Remove last extra pipe from string

EndFunc   ;==>_StringRemoveBlanksFromSplit