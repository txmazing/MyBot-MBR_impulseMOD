; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the "MOD" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: rulesss 2018
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once
; ================================================== IM Debug ================================================== ;
Global $g_hBtnTestBuilderTimeOCR = 0, $g_hBtnTestGlobalChatBot = 0, $g_hBtnTestClanChatBot = 0, $g_hBtnTestTNRQT = 0
Global $g_hBtnTestGoblinXP = 0, $g_hBtnForceStopBot = 0, $g_hBtnTestWardenMode = 0, $g_hBtnTestBotHumanization = 0, $g_hBtnDragNDropQueue = 0, $g_hBtnTestLabUpgrade = 0
Global $g_hBtnTestBuilderBaseAtk = 0, $g_hBtnTestBuilderBaseObs = 0, $g_hBtnTestGTFO = 0, $g_hBtnTestStopForWar = 0

; ================================================== Humanization PART ================================================== ;

Global $g_hChkUseBotHumanization = 0, $g_hChkUseAltRClick = 0, $g_acmbPriority = 0, $g_hChallengeMessage = 0, $g_ahumanMessage
Global $g_hLabel1 = 0, $g_hLabel2 = 0, $g_hLabel3 = 0, $g_hLabel4 = 0
Global $g_hLabel5 = 0, $g_hLabel6 = 0, $g_hLabel7 = 0, $g_hLabel8 = 0
Global $g_hLabel9 = 0, $g_hLabel10 = 0, $g_hLabel11 = 0, $g_hLabel12 = 0
Global $g_hLabel14 = 0, $g_hLabel15 = 0, $g_hLabel16 = 0, $g_hLabel13 = 0
Global $g_hLabel17 = 0, $g_hLabel18 = 0, $g_hLabel20 = 0
Global $g_hChkCollectAchievements = 0, $g_hChkLookAtRedNotifications = 0, $g_hCmbMaxActionsNumber = 0
Global $g_acmbPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_acmbMaxSpeed[2] = [0, 0]
Global $g_acmbPause[2] = [0, 0]
Global $g_ahumanMessage[2] = ["", ""]

; ================================================== ChatBOT PART ================================================== ;

Global $g_hCmblang = 0, $g_hChkDelayTime = 0, $g_hTxtDelayTime = 0
Global $g_hChkGlobalChat = 0, $g_hChkGlobalScramble = 0, $g_hChkSwitchLang = 0, $g_hChkClanChat = 0, $g_hChkCleverbot = 0
Global $g_hChkUseResponses = 0, $g_hChkUseGeneric = 0, $g_hChkChatNotify = 0, $g_hChkPbSendNewChats = 0, $g_hChkRusLang = 0
Global $g_hTxtEditGlobalMessages1 = "", $g_hTxtEditGlobalMessages2 = ""
Global $g_hTxtEditResponses = 0, $g_hTxtEditGeneric = 0, $ChatbotQueuedChats[0], $ChatbotReadQueued = False, $ChatbotReadInterval = 0, $ChatbotIsOnInterval = False, $TmpResp
Global $g_alblAinGlobal, $g_alblSGchats, $g_alblSwitchlang, $g_alblChatclan, $g_alblUsecustomresp, $g_alblUsegenchats, $g_alblNotifyclanchat, $g_alblSwitchlang, $g_alblUseremotechat

; Switch Profiles
Global $g_hChkGoldSwitchMax = 0, $g_hCmbGoldMaxProfile = 0, $g_hTxtMaxGoldAmount = 0, $g_hChkGoldSwitchMin = 0, $g_hCmbGoldMinProfile = 0, $g_hTxtMinGoldAmount = 0, _
		$g_hChkElixirSwitchMax = 0, $g_hCmbElixirMaxProfile = 0, $g_hTxtMaxElixirAmount = 0, $g_hChkElixirSwitchMin = 0, $g_hCmbElixirMinProfile = 0, $g_hTxtMinElixirAmount = 0, _
		$g_hChkDESwitchMax = 0, $g_hCmbDEMaxProfile = 0, $g_hTxtMaxDEAmount = 0, $g_hChkDESwitchMin = 0, $g_hCmbDEMinProfile = 0, $g_hTxtMinDEAmount = 0, _
		$g_hChkTrophySwitchMax = 0, $g_hCmbTrophyMaxProfile = 0, $g_hTxtMaxTrophyAmount = 0, $g_hChkTrophySwitchMin = 0, $g_hCmbTrophyMinProfile = 0, $g_hTxtMinTrophyAmount = 0

; Profiles

Global $g_hGUI_MOD = 0


Global $g_hGUI_MOD_TAB = 0, $g_hGUI_MOD_TAB_HUMANIZATION = 0, $g_hGUI_MOD_TAB_CHATBOT = 0, $g_hGUI_MOD_TAB_IM_DEBUG = 0

Func CreateMODTab()

	$g_hGUI_MOD = _GUICreate("", $g_iSizeWGrpTab1, $g_iSizeHGrpTab1, $_GUI_CHILD_LEFT, $_GUI_CHILD_TOP, BitOR($WS_CHILD, $WS_TABSTOP), -1, $g_hFrmBotEx)

	GUISwitch($g_hGUI_MOD)
	$g_hGUI_MOD_TAB = GUICtrlCreateTab(0, 0, $g_iSizeWGrpTab1, $g_iSizeHGrpTab1, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))
	$g_hGUI_MOD_TAB_HUMANIZATION = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_01", "Humanization"))
	TabHumanizationGUI()
	$g_hGUI_MOD_TAB_CHATBOT = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_02", "ChatBot"))
	TabChatBotGUI()
	$g_hGUI_MOD_TAB_IM_DEBUG = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_08", "IM Debug"))
	TabIMDebugGUI()

	GUICtrlCreateTabItem("")

EndFunc   ;==>CreateMODTab

Func TabHumanizationGUI()
	Local $x = 25, $y = 45
	GUICtrlCreateGroup(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Group_01", "Settings"), $x - 20, $y, $g_iSizeWGrpTab2, $g_iSizeHGrpTab3)

	$y += 17
	$g_hChkUseBotHumanization = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseBotHumanization", "Enable Bot Humanization"), 20, $y, 137, 17)
	GUICtrlSetOnEvent(-1, "chkUseBotHumanization")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$g_hChkUseAltRClick = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseAltRClick", "Make ALL BOT clicks random"), 274, $y, 162, 17)
	GUICtrlSetOnEvent(-1, "chkUseAltRClick")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$x -= 15
	$y += 30
	GUICtrlCreateIcon($g_sLibIconPath, $eIcnChat, $x, $y + 5, 32, 32)
	$g_hLabel1 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_01", "Read the Clan Chat"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[0] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel2 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_02", "Read the Global Chat"), $x + 240, $y + 5, 110, 17)
	$g_acmbPriority[1] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel4 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_04", "Say..."), $x + 40, $y + 30, 31, 17)
	$g_ahumanMessage[0] = GUICtrlCreateInput("Hello !", $x + 75, $y + 25, 121, 21)
	$g_hLabel3 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_03", "Or"), $x + 205, $y + 30, 15, 17)
	$g_ahumanMessage[1] = GUICtrlCreateInput("Re !", $x + 225, $y + 25, 121, 21)
	$g_acmbPriority[2] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel20 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_20", "Launch Challenges with message"), $x + 40, $y + 55, 170, 17)
	$g_hChallengeMessage = GUICtrlCreateInput("Can you beat my village?", $x + 205, $y + 50, 141, 21)
	$g_acmbPriority[12] = GUICtrlCreateCombo("", $x + 355, $y + 50, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 81

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnRepeat, $x, $y + 5, 32, 32)
	$g_hLabel5 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_05", "Watch Defenses"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[3] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	GUICtrlSetOnEvent(-1, "cmbStandardReplay")
	$g_hLabel6 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_06", "Watch Attacks"), $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[4] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	GUICtrlSetOnEvent(-1, "cmbStandardReplay")
	$g_hLabel7 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_07", "Max Replay Speed"), $x + 240, $y + 5, 110, 17)
	$g_acmbMaxSpeed[0] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sReplayChain, "2")
	$g_hLabel8 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_08", "Pause Replay"), $x + 240, $y + 30, 110, 17)
	$g_acmbPause[0] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 56

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnClan, $x, $y + 5, 32, 32)
	$g_hLabel9 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_09", "Look at War log"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[5] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel10 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_10", "Visit Clanmates"), $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[6] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel11 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_11", "Look at Best Players"), $x + 240, $y + 5, 110, 17)
	$g_acmbPriority[7] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel12 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_12", "Look at Best Clans"), $x + 240, $y + 30, 110, 17)
	$g_acmbPriority[8] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 56

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnTarget, $x, $y + 5, 32, 32)
	$g_hLabel14 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_14", "Look at Current War"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[9] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel16 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_16", "Watch Replays"), $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[10] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	GUICtrlSetOnEvent(-1, "cmbWarReplay")
	$g_hLabel13 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_13", "Max Replay Speed"), $x + 240, $y + 5, 110, 17)
	$g_acmbMaxSpeed[1] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sReplayChain, "2")
	$g_hLabel15 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_15", "Pause Replay"), $x + 240, $y + 30, 110, 17)
	$g_acmbPause[1] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 56

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnSettings, $x, $y + 5, 32, 32)
	$g_hLabel17 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_17", "Do nothing"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[11] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel18 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_18", "Max Actions by Loop"), $x + 240, $y + 5, 103, 17)
	$g_hCmbMaxActionsNumber = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "1|2|3|4|5", "2")

	$y += 25

	$g_hChkCollectAchievements = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkCollectAchievements", "Collect achievements automatically"), $x + 40, $y, 182, 17)
	GUICtrlSetOnEvent(-1, "chkCollectAchievements")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$g_hChkLookAtRedNotifications = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkLookAtRedNotifications", "Look at red/purple flags on buttons"), $x + 240, $y, 187, 17)
	GUICtrlSetOnEvent(-1, "chkLookAtRedNotifications")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	For $i = $g_hLabel1 To $g_hChkLookAtRedNotifications
		GUICtrlSetState($i, $GUI_DISABLE)
	Next

	chkUseBotHumanization()

EndFunc   ;==>TabHumanizationGUI

Func TabChatBotGUI()
	ChatbotReadSettings()
	Local $x = 10, $y = 45

	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "Group_01", "Global Chat"), 16 - $x, $y, 438, 185) ;30
	$y += 17
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnNEWChat1, $x + 7, $y, 40, 40) ;55
	$g_hChkGlobalChat = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkGlobalChat_01", "Advertise in global"), 80 - $x, $y, 155, 17) ;54
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkGlobalChat_02", "Use global chat to send messages"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkGlobalChat")

	$g_hChkSwitchLang = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkSwitchLang_01", "Switch languages"), 270 - $x, $y, 115, 17) ;54
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkSwitchLang_02", "Switch languages after spamming for a new global chatroom"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkSwitchLang")
	;======kychera===========
	$g_hCmblang = GUICtrlCreateCombo("", 390 - $x, $y, 50, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL)) ;54
	GUICtrlSetData(-1, "EN|FR|DE|ES|IT|NL|NO|PR|TR|RU", "RU")
	GUICtrlSetState(-1, $GUI_INDETERMINATE)
	;==========================
	$y += 17
	$g_hChkGlobalScramble = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkGlobalScramble_01", "Scramble global chats"), 80 - $x, $y, 170, 17) ;75
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkGlobalScramble_02", "Scramble the message pieces defined in the textboxes below to be in a random order"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkGlobalScramble")

	$g_hChkRusLang = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkRusLang_01", "Russian"), $x + 250, $y, 115, 17) ;75
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkRusLang_02", "On. Russian send text. Note: The input language in the Android emulator must be RUSSIAN."))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkRusLang")

	$y += 17
	$g_hChkDelayTime = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "ChkDelayTime_01", "Delay Time"), 80 - $x, $y, -1, -1) ;95
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkDelayTime")
	$g_hTxtDelayTime = GUICtrlCreateInput("10", 160 - $x, $y + 2, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER)) ;96
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetLimit(-1, 2)
	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "Label_15", "min"), 190 - $x, $y + 3, -1, -1) ;98

	$y += 25
	$g_hTxtEditGlobalMessages1 = GUICtrlCreateEdit(_ArrayToString($g_iChkGlobalMessages1, @CRLF), 24 - $x, $y, 420, 49) ;131
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "editGlobalMessages1_01", "Take one item randomly from this list (one per line) and add it to create a message to send to global"))
	GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
	$y += 51
	$g_hTxtEditGlobalMessages2 = GUICtrlCreateEdit(_ArrayToString($g_iChkGlobalMessages2, @CRLF), 24 - $x, $y, 420, 49) ;182
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "editGlobalMessages2_01", "Take one item randomly from this list (one per line) and add it to create a message to send to global"))
	GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")

	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 60
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "Group_02", "Clan Chat"), 16 - $x, $y, 438, 190) ;240
	$y += 17
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnNEWChat, $x + 5, $y, 40, 40) ;270
	$g_hChkClanChat = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkClanChat_01", "Chat in clan chat"), 70 - $x, $y, 97, 17) ;260
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkClanChat_02", "Use clan chat to send messages"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkClanChat")

	$g_hTxtEditResponses = GUICtrlCreateEdit(_ArrayToString($g_iChkClanResponses, ":", -1, -1, @CRLF), 220 - $x, $y - 5, 217, 81) ;250
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "editResponses_01", "Look for the specified keywords in clan messages and respond with the responses. One item per line, in the format keyword:response"))
	GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
	$y += 17
	$g_hChkUseResponses = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkUseResponses_01", "Use custom responses"), 70 - $x, $y, 135, 17) ;280
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkUseResponses_02", "Use the keywords and responses defined below"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkUseResponses")
	$y += 17
	$g_hChkUseGeneric = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkUseGeneric_01", "Use generic chats"), 70 - $x, $y, 97, 17) ;300
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkUseGeneric_02", "Use generic chats if reading the latest chat failed or there are no new chats"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkUseGeneric")
	$y += 17
	$g_hChkCleverbot = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkCleverbot_01", "Cleverbot"), 70 - $x, $y, 97, 17) ;320
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkCleverbot_02", "Enabele on this function to communicate Cleverbot with your clan"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkCleverbot")
	$y += 35
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnTelegram, $x + 7, $y, 32, 32)
	$g_hChkChatNotify = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkChatNotify_01", "Use remote for chatting"), 70 - $x, $y, 126, 17) ;350
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkChatNotify_02", "Send and recieve chats via pushbullet or telegram." & @CRLF & "Use BOT <myvillage> GETCHATS <interval|NOW|STOP> to get the latest clan" & @CRLF & "chat as an image, and BOT <myvillage> SENDCHAT <chat message> to send a chat to your clan"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkChatNotify")

	$g_hTxtEditGeneric = GUICtrlCreateEdit(_ArrayToString($g_iChkClanMessages, @CRLF), 220 - $x, $y - 5, 217, 81) ;340
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "editGeneric_01", "Generic messages to send, one per line"))
	GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
	$y += 17
	$g_hChkPbSendNewChats = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkPbSendNewChats_01", "Notify me new chat clan"), 70 - $x, $y, 150, 17) ;370
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkPbSendNewChats_02", "Will send an image of your clan chat via pushbullet & telegram when a new chat is detected. Not guaranteed to be 100% accurate."))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkPbSendNewChats")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

EndFunc   ;==>TabChatBotGUI

Func TabIMDebugGUI()
	Local $x = 5, $y = 45 ;For Border
	Local $yNext = 30
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design MOD - SM Debug", "Group_01", "IM Debug"), $x, $y, $g_iSizeWGrpTab2, $g_iSizeHGrpTab2)
	$x = 300
	$y += 17
;	$g_hBtnTestBuilderTimeOCR = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestBuilderTimeOCR", "Check Builder Time OCR"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestBuilderTimeOCR")
	$y += $yNext
;	$g_hBtnTestWardenMode = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestWardenMode", "Check Warden Mode"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestWardenMode")
	$y += $yNext
	$g_hBtnTestGlobalChatBot = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestGlobalChatBot", "Test Global Chat Bot"), $x, $y, 140, 25)
	GUICtrlSetOnEvent(-1, "btnTestGlobalChatBot")
	$y += $yNext
	$g_hBtnTestClanChatBot = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestClanChatBot", "Test Clan Chat Bot"), $x, $y, 140, 25)
	GUICtrlSetOnEvent(-1, "btnTestClanChatBot")
	$y += $yNext
;	$g_hBtnTestTNRQT = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestTNRQT", "Test TNRQT"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestTNRQT")
	$y += $yNext
;	$g_hBtnTestClanChatBot = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestCheckOneGem", "Test Check Gem Boost"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestCheckOneGem")
	$y += $yNext
;	$g_hBtnTestGoblinXP = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestGoblinXP", "Test Goblin XP"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestGoblinXP")
	$y += $yNext
	$g_hBtnTestBotHumanization = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestBotHumanization", "Test Bot Humanization"), $x, $y, 140, 25)
	GUICtrlSetOnEvent(-1, "btnTestBotHumanization")
	$y += $yNext
;	$g_hBtnDragNDropQueue = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnDragNDropQueue", "Test DragNDropQueue"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnDragNDropQueue")
	$y += $yNext
;	$g_hBtnTestLabUpgrade = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestLabUpgrade", "Test Lab Upgrade"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestLabUpgrade")
	$y += $yNext
;	$g_hBtnTestGTFO = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestGTFO", "Test GTFO"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestGTFO")
	$y += $yNext
;	$g_hBtnTestBuilderBaseAtk = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestBuilderBaseAtk", "Test BB Attack Now"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestBuilderBaseAtk")

	$x -= 145
	$y = 62

;	$g_hBtnTestBuilderBaseObs = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestBuilderBaseObs", "Test BB Remove Obstacles"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestBuilderBaseObs")
	$y += $yNext
;	$g_hBtnTestStopForWar = 0 = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestStopForWar", "Test Stop For War"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestStopForWar")

	;$x = 145
	;$y = 13 * $yNext
	;$g_hBtnForceStopBot = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnForceStopBot", "Force Stop BOT"), $x - 135, $y + 10, 140, 25)
	;GUICtrlSetOnEvent(-1, "btnForceStopBot")

EndFunc   ;==>TabIMDebugGUI
