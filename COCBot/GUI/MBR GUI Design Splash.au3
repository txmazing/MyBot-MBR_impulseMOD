; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Splash
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: mikemikemikecoc (2016)
; Modified ......: cosote (2016-Aug), CodeSlinger69 (2017), MonkeyHunter (05-2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once
#include <Sound.au3>

; Splash Variables
Global $g_hSplash = 0, $g_hSplashProgress, $g_lSplashStatus, $g_lSplashPic, $g_lSplashTitle
Global $g_iSplashTotalSteps = Default
Global $g_iSplashCurrentStep = 0
Global $g_hSplashTimer = 0
Global $g_hSplashMutex = 0

#include "MBR GUI Control Splash.au3"

#Region Splash
Func CreateSplashScreen($iSteps = Default)

	Local $iGuiState = @SW_SHOWNOACTIVATE
	Local $bDisableSplash = $g_bDisableSplash

	If $iSteps = Default Then
		$g_iSplashTotalSteps = 10
	Else
		$iGuiState = @SW_SHOW
		$bDisableSplash = False
		$g_iSplashTotalSteps = $iSteps
		$g_iSplashCurrentStep = 0
		$g_hSplashTimer = 0
	EndIf

	Local $sSplashImg = $g_sLogoPath
	Local $hImage, $iX, $iY
	Local $iT = 0 ; Top of logo (additional space) was 20 White On Top Of Colorfull image does not look good. EDITED By IM MOD
	Local $iB = 10 ; Bottom of logo (additional space)

	Switch $g_iGuiMode ; in Mini GIU or GUI less mode we have less steps
		Case 0 ; No GUI
			$g_iSplashTotalSteps = 3
		Case 2 ; Mini GUI
			$g_iSplashTotalSteps = 4
	EndSwitch

	; Launch only one bot at a time... it simply consumes too much CPU
	$g_hSplashMutex = AcquireMutexTicket("Launching", 1, Default, False)

	If $bDisableSplash = False Then

		Local $hSplashImg = _GDIPlus_BitmapCreateFromFile($sSplashImg)
		; Determine dimensions of splash image
		$iX = _GDIPlus_ImageGetWidth($hSplashImg)
		$iY = _GDIPlus_ImageGetHeight($hSplashImg)

		Local $iHeight = $iY + $iT + $iB + 60 ; size = image+Top space+Bottom space+60
		Local $iCenterX = @DesktopWidth / 2 ; find center of main display
		Local $iCenterY = @DesktopHeight / 2
		If $g_bMyBotDance Then
			Local $iTop = @DesktopHeight - 50 - $iHeight ; position splash UI near task bar
		Else
			Local $iTop = $iCenterY - $iHeight / 2
		EndIf
		Local $iLeft = $iCenterX - $iX / 2 ; position splash UI centered on width

		; Create Splash container
		$g_hSplash = GUICreate("", $iX, $iHeight, $iLeft, $iTop, BitOR($WS_POPUP, $WS_BORDER), BitOR($WS_EX_TOPMOST, $WS_EX_WINDOWEDGE, $WS_EX_TOOLWINDOW))
		GUISetBkColor($COLOR_WHITE, $g_hSplash)
		$g_lSplashPic = _GUICtrlCreatePic($hSplashImg, 0, $iT) ; Splash Image
		GUICtrlSetOnEvent(-1, "MoveSplashScreen")
		$g_lSplashTitle = GUICtrlCreateLabel($g_sBotTitle, 15, $iY + $iT + $iB + 3, $iX - 30, 15, $SS_CENTER) ; Splash Title
		GUICtrlSetOnEvent(-1, "MoveSplashScreen")
		$g_hSplashProgress = GUICtrlCreateProgress(15, $iY + $iT + $iB + 20, $iX - 30, 10, $PBS_SMOOTH, BitOR($WS_EX_TOPMOST, $WS_EX_WINDOWEDGE, $WS_EX_TOOLWINDOW)) ; Splash Progress
		$g_lSplashStatus = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design - Loading", "SplashStep_Loading", "Loading..."), 15, $iY + $iT + $iB + 38, $iX - 30, 15, $SS_CENTER) ; Splash Title
		GUICtrlSetOnEvent(-1, "MoveSplashScreen")

		; Cleanup GDI resources
		_GDIPlus_BitmapDispose($hSplashImg)

		; Show Splash
		GUISetState($iGuiState, $g_hSplash)

		If $g_bDebugSetlog Then SetDebugLog("Splash created: $g_hSplash=" & $g_hSplash & ", $g_lSplashPic=" & $g_lSplashPic & ", $g_lSplashTitle=" & $g_lSplashTitle & ", $g_hSplashProgress=" & $g_hSplashProgress & ", $g_lSplashStatus=" & $g_lSplashStatus)

		$g_hSplashTimer = __TimerInit()
	EndIf

EndFunc   ;==>CreateSplashScreen
#EndRegion Splash