; #FUNCTION# ====================================================================================================================
; Name ..........: IMMOD Debug GUI Control
; Description ...: This file is used for IMMOD Debug GUI functions of debug will be here.
; Author ........: Fahid.Mahmood
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func btnTestGlobalChatBot()
	SetLog("Test Global Chat Bot Started", $COLOR_DEBUG)

	Local $wasRunState = $g_bRunState
	Local $wasChkChatGlobal = $g_bChatGlobal
	Local $wasChkChatClan = $g_bChatClan
	;For Debug Purpose set these values temporarily
	$g_bRunState = True
	$g_bChatGlobal = True
	$g_bChatClan = False

	ChatbotMessage()

	;Reset to orignal state
	$g_bRunState = $wasRunState
	$g_bChatGlobal = $wasChkChatGlobal
	$g_bChatClan = $wasChkChatClan

	SetLog("Test Global Chat Bot Ended", $COLOR_DEBUG)

EndFunc   ;==>btnTestGlobalChatBot

Func btnTestClanChatBot()
	SetLog("Test Global Chat Bot Started", $COLOR_DEBUG)

	Local $wasRunState = $g_bRunState
	Local $wasChkChatGlobal = $g_bChatGlobal
	Local $wasChkChatClan = $g_bChatClan
	Local $wasClanAlwaysMsg = $g_bClanAlwaysMsg
	;For Debug Purpose set these values temporarily
	$g_bRunState = True
	$g_bChatGlobal = False
	$g_bChatClan = True
	$g_bClanAlwaysMsg = True

	ChatbotMessage()

	;Reset to orignal state
	$g_bClanAlwaysMsg = $wasClanAlwaysMsg
	$g_bRunState = $wasRunState
	$g_bChatGlobal = $wasChkChatGlobal
	$g_bChatClan = $wasChkChatClan

	SetLog("Test Global Chat Bot Ended", $COLOR_DEBUG)

EndFunc   ;==>btnTestClanChatBot

Func btnTestBotHumanization()
	SetLog("Test Bot Humanization Started", $COLOR_DEBUG)

	Local $wasRunState = $g_bRunState
	Local $wasUseBotHumanization = $g_bUseBotHumanization
	;For Debug Purpose set run state to true temporarily
	$g_bRunState = True
	$g_bUseBotHumanization = True

	BotHumanization()

	;Reset to orignal state
	$g_bRunState = $wasRunState
	$g_bUseBotHumanization = $wasUseBotHumanization

	SetLog("Test Bot Humanization Ended", $COLOR_DEBUG)

EndFunc   ;==>btnTestBotHumanization

Func btnTestGTFO()
	SetLog("Test GTFO Started", $COLOR_DEBUG)

	Local $wasRunState = $g_bRunState
	Local $wasUseGTFO = $g_bChkUseGTFO
	;For Debug Purpose set run state to true temporarily
	$g_bRunState = True
	$g_bChkUseGTFO = True

	MainGTFO()

	;Reset to orignal state
	$g_bChkUseGTFO = $wasUseGTFO
	$g_bRunState = $wasRunState

	SetLog("Test GTFO Ended", $COLOR_DEBUG)

EndFunc   ;==>btnTestGTFO

Func btnForceStopBot()
	SetLog("Going to force stop the bot.", $COLOR_DEBUG)
	If $g_bRunState Then
		SetLog("Sucessfully Stopped The BOT", $COLOR_SUCCESS)
		; always invoked in MyBot.run.au3!ø
		$g_bRunState = False ; Exit BotStart()
	Else
		SetLog("Sorry, BOT is already Stopped", $COLOR_ERROR)
	EndIf
	$g_iBotAction = $eBotStop
EndFunc   ;==>btnForceStopBot