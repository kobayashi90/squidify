; Installer script for Squidify Windows app

!define APP_NAME "Squidify"
!define APP_VERSION "1.0"
!define APP_DIR "Squidify"
!define INSTALLER_ICON "icon.ico" ; Optional: path to your icon file

OutFile "SquidifyInstaller.exe"
InstallDir "$PROGRAMFILES64\${APP_NAME}"
ShowInstDetails show
ShowUninstDetails show

; Request application privileges for Windows Vista and later
RequestExecutionLevel admin

Section "Install"
  SetOutPath "$INSTDIR"
  
  ; Copy all files from the Nativefier output folder
  File /r "output/Squidify-win32-x64\*"

  ; Create shortcuts
  CreateShortcut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\${APP_NAME}.exe"
  CreateShortcut "$SMPROGRAMS\${APP_NAME}\${APP_NAME}.lnk" "$INSTDIR\${APP_NAME}.exe"

SectionEnd

Section "Uninstall"
  ; Remove installed files
  Delete "$INSTDIR\*.*"
  RMDir /r "$INSTDIR"

  ; Remove shortcuts
  Delete "$DESKTOP\${APP_NAME}.lnk"
  Delete "$SMPROGRAMS\${APP_NAME}\${APP_NAME}.lnk"
  RMDir "$SMPROGRAMS\${APP_NAME}"
SectionEnd
