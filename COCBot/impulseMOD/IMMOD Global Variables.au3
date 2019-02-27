; #FUNCTION# ====================================================================================================================
; Name ..........: IMMOD Global Variables
; Description ...: This file Includes several files in the current script and all Declared variables, constant, or create an array.
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: by IMMOD
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......: ---
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: ---
; ===============================================================================================================================

Global $g_sLastModversion = "" ;latest version from GIT
Global $g_sLastModmessage = "" ;message for last version
Global $g_sOldModversmessage = "" ;warning message for old bot

; ================================================ Bot Humanization - Added by IMMOD ======================================== ;

Global $g_iacmbPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_iacmbMaxSpeed[2] = [1, 1]
Global $g_iacmbPause[2] = [0, 0]
Global $g_iahumanMessage[2] = ["Hello !", "Hello !"]
Global $g_iTxtChallengeMessage = "Can you beat my village?"

Global $g_iMinimumPriority, $g_iMaxActionsNumber, $g_iActionToDo
Global $g_aSetActionPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

Global $g_sFrequenceChain = "Never|Sometimes|Frequently|Often|Very Often"
Global $g_sReplayChain = "1|2|4"
Global $g_bUseBotHumanization = False, $g_bUseAltRClick = False, $g_iCmbMaxActionsNumber = 1, $g_bCollectAchievements = False, $g_bLookAtRedNotifications = False

Global $g_aReplayDuration[2] = [0, 0] ; An array, [0] = Minute | [1] = Seconds
Global $g_bOnReplayWindow, $g_iReplayToPause

Global $g_iLastLayout = 0

; ================================================ ChatBot - Added by IMMOD ======================================== ;
; ScreenCoordinates - first 2 values store the region [x,y] that can click; values 3,4,5,6 is the color check pixel x,y,color,tolerance level for confirm the button exist if needed.

Global Const $g_aButtonChatWindowOpen[6] = [8, 355, 16, 400, 0xC55115, 20] ; main page, clan chat Button Open Chat Window
Global Const $g_aButtonChatWindowClose[6] = [321, 355, 330, 400, 0xC55115, 20] ; main page, clan chat Button Close Chat Window
Global Const $g_aButtonChatSelectTabGlobal[6] = [74, 23, 20, 10, 0x79755B, 20] ; color med gray Select Global Chat Tab
Global Const $g_aButtonChatSelectTabClan[6] = [222, 27, 170, 10, 0x79755B, 20] ; color med gray Select Clan Chat Tab
Global Const $g_aButtonChatSelectTextBox[6] = [277, 706, 100, 700, 0xFFFFFF, 20] ; color white Select Chat Textbox
Global Const $g_aButtonChatSendButton[6] = [840, 693, 840, 693, 0xFFFFFF, 20] ; color white Select Chat Textbox
Global Const $g_aButtonChatSelectTextBoxBottomNav[6] = [277, 706, 100, 690, 0xFFFFFF, 20] ; color white Select Chat Textbox Position is different when nav is set to bottom
Global Const $g_aButtonChatJoinClan[4] = [157, 510, 0x6CBB1F, 20] ; Green Join Button on Chat Tab when you are not in a Clan
Global Const $g_aButtonChatRules[6]   	    = [  155, 500, 70, 483, 0xDDF585, 20] ; "I Understand" Button

Global Const $g_aButtonLangSetting[6] = [820, 585, 810, 584, 0xF5F5E0, 20] ; Main Screen Button
Global Const $g_aButtonLangSettingClose[6] = [777, 113, 777, 113, 0xFF8D8D, 20] ; On Setting screen close button
Global Const $g_aButtonLangSettingSelectLang[2] = [210, 420] ; On Setting screen select language button
Global Const $g_aButtonLangSettingBackLang[6] = [127, 121, 116, 117, 0xFFFFFF, 20] ; On Setting screen language screen back button
Global Const $g_aButtonLangSettingOk[6] = [513, 426, 460, 408, 0xE2F98A, 20] ; Language Selection Dialog Ok button

Global Const $g_aButtonLanguageEN[2] = [165, 180] ;English
Global Const $g_aButtonLanguageFRA[2] = [163, 230] ;Franch
Global Const $g_aButtonLanguageRU[2] = [173, 607] ;Russian
Global Const $g_aButtonLanguageDE[2] = [163, 273] ;DEUTSCH
Global Const $g_aButtonLanguageES[2] = [163, 325] ;Ispanol
Global Const $g_aButtonLanguageITA[2] = [163, 375] ;ITALYA
Global Const $g_aButtonLanguageNL[2] = [163, 425] ;Nederlands
Global Const $g_aButtonLanguageNO[2] = [163, 475] ;NORSK
Global Const $g_aButtonLanguagePR[2] = [163, 525] ;PORTUGAL
Global Const $g_aButtonLanguageTR[2] = [163, 575] ;TURK

Global $g_bChatGlobal = False
Global $g_bScrambleGlobal = False
Global $g_bSwitchLang = False
Global $g_bChatClan = False
Global $g_bClanUseResponses = False
Global $g_bClanAlwaysMsg = False
Global $g_bUseNotify = False
Global $g_bPbSendNew = False
Global $g_bRusLang = False
Global $g_iCmbLang = 9
Global $g_bCleverbot = False
Global $g_bDelayTime = False
Global $g_iTxtDelayTime = 10
Global $g_iChkClanMessages = ""
Global $g_iChkClanResponses = ""
Global $g_iChkClanResponses0
Global $g_iChkGlobalMessages1 = ""
Global $g_iChkGlobalMessages2 = ""
Global $g_sGlobalChatLastMsgSentTime = ""
Global $glb1
Global $glb2
Global $cResp
Global $cGeneric
Global $ChatbotStartTime
Global $g_sMessage = ""
