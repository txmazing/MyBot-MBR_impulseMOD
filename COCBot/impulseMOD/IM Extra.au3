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

Func XPStyleToggle($OnOff = 1)
    If Not StringInStr(@OSTYPE, "WIN32_NT") Then Return 0
    If $OnOff Then
        $XS_n = DllCall("uxtheme.dll", "int", "GetThemeAppProperties")
        DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", 0)
        Return 1
    ElseIf IsArray($XS_n) Then
        DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", $XS_n[0])
        $XS_n = ""
        Return 1
    EndIf
    Return 0
EndFunc