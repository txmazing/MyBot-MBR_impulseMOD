; #FUNCTION# ====================================================================================================================
; Name ..........: IM Config
; Description ...: This file Read/Save/Apply IMMODs settings
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: by IMMOD
; Modified ......:
; RemaSMs .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......: ---
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: ---
; ===============================================================================================================================

Func ReadConfig_IMMod()

	; ================================================== Super XP - Added by IMMOD ==================================== ;
	IniReadS($g_bEnableSuperXP, $g_sProfileConfigPath, "SM GoblinXP", "EnableSuperXP", $g_bEnableSuperXP, "Bool")
	IniReadS($g_bSkipZoomOutXP, $g_sProfileConfigPath, "SM GoblinXP", "SkipZoomOutXP", $g_bSkipZoomOutXP, "Bool")
	IniReadS($g_bFastGoblinXP, $g_sProfileConfigPath, "SM GoblinXP", "FastGoblinXP", $g_bFastGoblinXP, "Bool")
	IniReadS($g_bSkipDragToEndXP, $g_sProfileConfigPath, "SM GoblinXP", "SkipDragToEndXP", $g_bSkipDragToEndXP, "Bool")
	IniReadS($g_irbSXTraining, $g_sProfileConfigPath, "SM GoblinXP", "SXTraining", $g_irbSXTraining, "int")
	IniReadS($g_iTxtMaxXPtoGain, $g_sProfileConfigPath, "SM GoblinXP", "MaxXptoGain", $g_iTxtMaxXPtoGain, "int")
	IniReadS($g_bSXBK, $g_sProfileConfigPath, "SM GoblinXP", "SXBK", $eHeroNone)
	IniReadS($g_bSXAQ, $g_sProfileConfigPath, "SM GoblinXP", "SXAQ", $eHeroNone)
	IniReadS($g_bSXGW, $g_sProfileConfigPath, "SM GoblinXP", "SXGW", $eHeroNone)
	
	;================================================== Bot Humanization - Added by IMMOD ==================== ;
	IniReadS($g_bUseBotHumanization, $g_sProfileConfigPath, "Bot Humanization", "chkUseBotHumanization", $g_bUseBotHumanization, "Bool")
	IniReadS($g_bUseAltRClick, $g_sProfileConfigPath, "Bot Humanization", "chkUseAltRClick", $g_bUseAltRClick, "Bool")
	IniReadS($g_bCollectAchievements, $g_sProfileConfigPath, "Bot Humanization", "chkCollectAchievements", $g_bCollectAchievements, "Bool")
	IniReadS($g_bLookAtRedNotifications, $g_sProfileConfigPath, "Bot Humanization", "chkLookAtRedNotifications", $g_bLookAtRedNotifications, "Bool")
	For $i = 0 To 12
		IniReadS($g_iacmbPriority[$i], $g_sProfileConfigPath, "Bot Humanization", "cmbPriority[" & $i & "]", $g_iacmbPriority[$i], "int")
	Next
	For $i = 0 To 1
		IniReadS($g_iacmbMaxSpeed[$i], $g_sProfileConfigPath, "Bot Humanization", "cmbMaxSpeed[" & $i & "]", $g_iacmbMaxSpeed[$i], "int")
	Next
	For $i = 0 To 1
		IniReadS($g_iacmbPause[$i], $g_sProfileConfigPath, "Bot Humanization", "cmbPause[" & $i & "]", $g_iacmbPause[$i], "int")
	Next
	For $i = 0 To 1
		IniReadS($g_iahumanMessage[$i], $g_sProfileConfigPath, "Bot Humanization", "humanMessage[" & $i & "]", $g_iahumanMessage[$i])
	Next
	IniReadS($g_iCmbMaxActionsNumber, $g_sProfileConfigPath, "Bot Humanization", "cmbMaxActionsNumber", $g_iCmbMaxActionsNumber, "int")
	IniReadS($g_iTxtChallengeMessage, $g_sProfileConfigPath, "Bot Humanization", "challengeMessage", $g_iTxtChallengeMessage)
	
	; ================================================== ChatBot - by IMMOD ================================= ;
	IniReadS($g_bChatGlobal, $g_sProfileConfigPath, "Chatbot", "ChkChatGlobal", False, "Bool")
	IniReadS($g_bScrambleGlobal, $g_sProfileConfigPath, "Chatbot", "ChkScrambleGlobal", False, "Bool")
	IniReadS($g_bDelayTime, $g_sProfileConfigPath, "Chatbot", "ChkDelayTime", False, "Bool")
	IniReadS($g_iTxtDelayTime, $g_sProfileConfigPath, "Chatbot", "TxtDelayTime", $g_iTxtDelayTime)
	IniReadS($g_bSwitchLang, $g_sProfileConfigPath, "Chatbot", "ChkSwitchLang", False, "Bool")
	IniReadS($g_iCmbLang, $g_sProfileConfigPath, "Chatbot", "CmbLang", $g_iCmbLang, "int")
	IniReadS($g_bRusLang, $g_sProfileConfigPath, "Chatbot", "ChkRusLang", False, "Bool")
	IniReadS($g_bChatClan, $g_sProfileConfigPath, "Chatbot", "ChkChatClan", False, "Bool")
	IniReadS($g_bClanUseResponses, $g_sProfileConfigPath, "Chatbot", "ChkUseResponses", False, "Bool")
	IniReadS($g_bClanAlwaysMsg, $g_sProfileConfigPath, "Chatbot", "ChkUseGeneric", False, "Bool")
	IniReadS($g_bCleverbot, $g_sProfileConfigPath, "Chatbot", "ChkCleverbot", False, "Bool")
	IniReadS($g_bUseNotify, $g_sProfileConfigPath, "Chatbot", "ChkChatNotify", False, "Bool")
	IniReadS($g_bPbSendNew, $g_sProfileConfigPath, "Chatbot", "ChkPbSendNewChats", False, "Bool")

	; ==================================================  Upgrade Management - Added by IMMOD ==================== ;
	IniReadS($g_ibUpdateNewUpgradesOnly, $g_sProfileConfigPath, "upgrade", "UpdateNewUpgradesOnly", $g_ibUpdateNewUpgradesOnly, "int")
	IniReadS($g_bSmartSwitchUpgrade, $g_sProfileConfigPath, "upgrade", "SmartSwitchUpgrade", $g_bSmartSwitchUpgrade, "Bool")
	
EndFunc   ;==>ReadConfig_IMMod

Func SaveConfig_IMMod() ; due to mini mode no guitCtrols Reads in this function
	ApplyConfig_IMMod(GetApplyConfigSaveAction())

	; ================================================== Super XP - Added by IMMOD ================================ ;
	_Ini_Add("SM GoblinXP", "EnableSuperXP", $g_bEnableSuperXP ? True : False)
	_Ini_Add("SM GoblinXP", "SkipZoomOutXP", $g_bSkipZoomOutXP ? True : False)
	_Ini_Add("SM GoblinXP", "FastGoblinXP", $g_bFastGoblinXP ? True : False)
	_Ini_Add("SM GoblinXP", "SkipDragToEndXP", $g_bSkipDragToEndXP ? True : False)
	_Ini_Add("SM GoblinXP", "SXTraining", $g_irbSXTraining)
	_Ini_Add("SM GoblinXP", "SXBK", $g_bSXBK)
	_Ini_Add("SM GoblinXP", "SXAQ", $g_bSXAQ)
	_Ini_Add("SM GoblinXP", "SXGW", $g_bSXGW)
	_Ini_Add("SM GoblinXP", "MaxXptoGain", GUICtrlRead($g_hTxtMaxXPtoGain))
	
	;================================================== Bot Humanization - Added by IMMOD ==================== ;
	_Ini_Add("Bot Humanization", "chkUseBotHumanization", $g_bUseBotHumanization ? True : False)
	_Ini_Add("Bot Humanization", "chkUseAltRClick", $g_bUseAltRClick ? True : False)
	_Ini_Add("Bot Humanization", "chkCollectAchievements", $g_bCollectAchievements ? True : False)
	_Ini_Add("Bot Humanization", "chkLookAtRedNotifications", $g_bLookAtRedNotifications ? True : False)
	For $i = 0 To 12
		_Ini_Add("Bot Humanization", "cmbPriority[" & $i & "]", _GUICtrlComboBox_GetCurSel($g_acmbPriority[$i]))
	Next
	For $i = 0 To 1
		_Ini_Add("Bot Humanization", "cmbMaxSpeed[" & $i & "]", _GUICtrlComboBox_GetCurSel($g_acmbMaxSpeed[$i]))
	Next
	For $i = 0 To 1
		_Ini_Add("Bot Humanization", "cmbPause[" & $i & "]", _GUICtrlComboBox_GetCurSel($g_acmbPause[$i]))
	Next
	For $i = 0 To 1
		_Ini_Add("Bot Humanization", "humanMessage[" & $i & "]", GUICtrlRead($g_ahumanMessage[$i]))
	Next
	_Ini_Add("Bot Humanization", "cmbMaxActionsNumber", _GUICtrlComboBox_GetCurSel($g_hCmbMaxActionsNumber))
	_Ini_Add("Bot Humanization", "challengeMessage", GUICtrlRead($g_hChallengeMessage))
	
	; ================================================== ChatBot - by IMMOD ================================= ;
	_Ini_Add("Chatbot", "ChkChatGlobal", $g_bChatGlobal ? True : False)
	_Ini_Add("Chatbot", "ChkScrambleGlobal", $g_bScrambleGlobal ? True : False)
	_Ini_Add("Chatbot", "ChkDelayTime", $g_bDelayTime ? True : False)
	_Ini_Add("Chatbot", "TxtDelayTime", $g_iTxtDelayTime)
	_Ini_Add("Chatbot", "ChkSwitchLang", $g_bSwitchLang ? True : False)
	_Ini_Add("Chatbot", "CmbLang", _GUICtrlComboBox_GetCurSel($g_hCmbLang))
	_Ini_Add("Chatbot", "ChkRusLang", $g_bRusLang ? True : False)
	_Ini_Add("Chatbot", "ChkChatClan", $g_bChatClan ? True : False)

	_Ini_Add("Chatbot", "ChkUseResponses", $g_bClanUseResponses ? True : False)
	_Ini_Add("Chatbot", "ChkUseGeneric", $g_bClanAlwaysMsg ? True : False)
	_Ini_Add("Chatbot", "ChkCleverbot", $g_bCleverbot ? True : False)
	_Ini_Add("Chatbot", "ChkChatNotify", $g_bUseNotify ? True : False)
	_Ini_Add("Chatbot", "ChkPbSendNewChats", $g_bPbSendNew ? True : False)

	_Ini_Add("Chatbot", "globalMsg1", $glb1)
	_Ini_Add("Chatbot", "globalMsg2", $glb2)
	_Ini_Add("Chatbot", "genericMsgClan", $cGeneric)
	_Ini_Add("Chatbot", "responseMsgClan", $cResp)
	
	; ================================================== Upgrade Management - Added by IMMOD ================================== ;

	_Ini_Add("upgrade", "UpdateNewUpgradesOnly", $g_ibUpdateNewUpgradesOnly ? 1 : 0)
	_Ini_Add("upgrade", "SmartSwitchUpgrade", $g_bSmartSwitchUpgrade ? True : False)

EndFunc   ;==>SaveConfig_IMMod

Func ApplyConfig_IMMod($TypeReadSave)

	Switch $TypeReadSave

		Case "Save"

			; ================================================== Super XP - Added by IMMOD ========================== ;
			$g_bEnableSuperXP = (GUICtrlRead($g_hChkEnableSuperXP) = $GUI_CHECKED)
			$g_bSkipZoomOutXP = (GUICtrlRead($g_hChkSkipZoomOutXP) = $GUI_CHECKED)
			$g_bFastGoblinXP = (GUICtrlRead($g_hChkFastGoblinXP) = $GUI_CHECKED)
			$g_bSkipDragToEndXP = (GUICtrlRead($g_hChkSkipDragToEndXP) = $GUI_CHECKED)
			$g_irbSXTraining = GUICtrlRead($rbSXTraining) = $GUI_CHECKED ? 1 : 2
			$g_bSXBK = (GUICtrlRead($g_hChkSXBK) = $GUI_CHECKED) ? $eHeroKing : $eHeroNone
			$g_bSXAQ = (GUICtrlRead($g_hChkSXAQ) = $GUI_CHECKED) ? $eHeroQueen : $eHeroNone
			$g_bSXGW = (GUICtrlRead($g_hChkSXGW) = $GUI_CHECKED) ? $eHeroWarden : $eHeroNone
			$g_iTxtMaxXPtoGain = GUICtrlRead($g_hTxtMaxXPtoGain)
			
			;==================================================  Bot Humanization - Added by IMMOD ==================== ;
			$g_bUseBotHumanization = (GUICtrlRead($g_hChkUseBotHumanization) = $GUI_CHECKED)
			$g_bUseAltRClick = (GUICtrlRead($g_hChkUseAltRClick) = $GUI_CHECKED)
			$g_bCollectAchievements = (GUICtrlRead($g_hChkCollectAchievements) = $GUI_CHECKED)
			$g_bLookAtRedNotifications = (GUICtrlRead($g_hChkLookAtRedNotifications) = $GUI_CHECKED)
			For $i = 0 To 12
				$g_iacmbPriority[$i] = _GUICtrlComboBox_GetCurSel($g_acmbPriority[$i])
			Next
			For $i = 0 To 1
				$g_iacmbMaxSpeed[$i] = _GUICtrlComboBox_GetCurSel($g_acmbMaxSpeed[$i])
			Next
			For $i = 0 To 1
				$g_iacmbPause[$i] = _GUICtrlComboBox_GetCurSel($g_acmbPause[$i])
			Next
			For $i = 0 To 1
				$g_iahumanMessage[$i] = GUICtrlRead($g_ahumanMessage[$i])
			Next
			$g_iCmbMaxActionsNumber = _GUICtrlComboBox_GetCurSel($g_iCmbMaxActionsNumber)
			$g_iTxtChallengeMessage = GUICtrlRead($g_hChallengeMessage)
			
			; ================================================== ChatBot - by IMMOD ================================= ;
			$g_bChatGlobal = (GUICtrlRead($g_hChkGlobalChat) = $GUI_CHECKED)
			$g_bScrambleGlobal = (GUICtrlRead($g_hChkGlobalScramble) = $GUI_CHECKED)
			$g_bDelayTime = (GUICtrlRead($g_hChkDelayTime) = $GUI_CHECKED)
			$g_iTxtDelayTime = GUICtrlRead($g_hTxtDelayTime)
			$g_bSwitchLang = (GUICtrlRead($g_hChkSwitchLang) = $GUI_CHECKED)
			$g_iCmbLang = _GUICtrlComboBox_GetCurSel($g_hCmbLang)
			$g_bRusLang = (GUICtrlRead($g_hChkRusLang) = $GUI_CHECKED)
			$g_bChatClan = (GUICtrlRead($g_hChkClanChat) = $GUI_CHECKED)
			$g_bClanUseResponses = (GUICtrlRead($g_hChkUseResponses) = $GUI_CHECKED)
			$g_bClanAlwaysMsg = (GUICtrlRead($g_hChkUseGeneric) = $GUI_CHECKED)
			$g_bCleverbot = (GUICtrlRead($g_hChkCleverbot) = $GUI_CHECKED)
			$g_bUseNotify = (GUICtrlRead($g_hChkChatNotify) = $GUI_CHECKED)
			$g_bPbSendNew = (GUICtrlRead($g_hChkPbSendNewChats) = $GUI_CHECKED)
			
			; ================================================== Upgrade Management - Added by IMMOD ============================= ;

			$g_ibUpdateNewUpgradesOnly = GUICtrlRead($g_hChkUpdateNewUpgradesOnly) = $GUI_CHECKED ? 1 : 0
			$g_bSmartSwitchUpgrade = (GUICtrlRead($g_hChkSmartSwitchUpgrade) = $GUI_CHECKED)

		Case "Read"

			; ================================================== Super XP - Added by IMMOD ============================== ;
			GUICtrlSetState($g_hChkEnableSuperXP, $g_bEnableSuperXP ? $GUI_CHECKED : $GUI_UNCHECKED)
			chkEnableSuperXP()
			GUICtrlSetState($g_hChkSkipZoomOutXP, $g_bSkipZoomOutXP ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkFastGoblinXP, $g_bFastGoblinXP ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkSkipDragToEndXP, $g_bSkipDragToEndXP ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($rbSXTraining, ($g_irbSXTraining = 1) ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($rbSXIAttacking, ($g_irbSXTraining = 2) ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetData($g_hTxtMaxXPtoGain, $g_iTxtMaxXPtoGain)
			GUICtrlSetState($g_hChkSXBK, $g_bSXBK = $eHeroKing ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkSXAQ, $g_bSXAQ = $eHeroQueen ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkSXGW, $g_bSXGW = $eHeroWarden ? $GUI_CHECKED : $GUI_UNCHECKED)
			
			;================================================== Bot Humanization - Added by IMMOD ==================== ;
			GUICtrlSetState($g_hChkUseBotHumanization, $g_bUseBotHumanization ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkUseAltRClick, $g_bUseAltRClick ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkCollectAchievements, $g_bCollectAchievements ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkLookAtRedNotifications, $g_bLookAtRedNotifications ? $GUI_CHECKED : $GUI_UNCHECKED)
			chkUseBotHumanization()
			For $i = 0 To 12
				_GUICtrlComboBox_SetCurSel($g_acmbPriority[$i], $g_iacmbPriority[$i])
			Next
			For $i = 0 To 1
				_GUICtrlComboBox_SetCurSel($g_acmbMaxSpeed[$i], $g_iacmbMaxSpeed[$i])
			Next
			For $i = 0 To 1
				_GUICtrlComboBox_SetCurSel($g_acmbPause[$i], $g_iacmbPause[$i])
			Next
			For $i = 0 To 1
				GUICtrlSetData($g_ahumanMessage[$i], $g_iahumanMessage[$i])
			Next
			_GUICtrlComboBox_SetCurSel($g_hCmbMaxActionsNumber, $g_iCmbMaxActionsNumber)
			GUICtrlSetData($g_hChallengeMessage, $g_iTxtChallengeMessage)
			cmbStandardReplay()
			cmbWarReplay()
			
			; ================================================== ChatBot - by IMMOD ======================================== ;
			GUICtrlSetState($g_hChkGlobalChat, $g_bChatGlobal ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkGlobalScramble, $g_bScrambleGlobal ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkDelayTime, $g_bDelayTime ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetData($g_hTxtDelayTime, $g_iTxtDelayTime)
			GUICtrlSetState($g_hChkSwitchLang, $g_bSwitchLang ? $GUI_CHECKED : $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($g_hCmbLang, $g_iCmbLang)
			GUICtrlSetState($g_hChkRusLang, $g_bRusLang ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkClanChat, $g_bChatClan ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkUseResponses, $g_bClanUseResponses ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkUseGeneric, $g_bClanAlwaysMsg ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkCleverbot, $g_bCleverbot ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkChatNotify, $g_bUseNotify ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkPbSendNewChats, $g_bPbSendNew ? $GUI_CHECKED : $GUI_UNCHECKED)
			chkRusLang()
			chkGlobalChat()
			chkGlobalScramble()
			chkCleverbot()
			chkSwitchLang()
			chkClanChat()
			chkUseResponses()
			chkUseGeneric()
			chkChatNotify()
			chkPbSendNewChats()
			ChatGuiEditUpdate()
			chkDelayTime()

			; ==================================================  Upgrade Management - Added by IMMOD ======================================== ;

			GUICtrlSetState($g_hChkUpdateNewUpgradesOnly, $g_ibUpdateNewUpgradesOnly = 1 ? $GUI_CHECKED : $GUI_UNCHECKED)
			chkUpdateNewUpgradesOnly()
			GUICtrlSetState($g_hChkSmartSwitchUpgrade, $g_bSmartSwitchUpgrade = True ? $GUI_CHECKED : $GUI_UNCHECKED)
			chkSmartSwitchUpgrade()

	EndSwitch

EndFunc   ;==>ApplyConfig_IMMod
