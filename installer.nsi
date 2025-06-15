!define APP_NAME "Squidify"
!define APP_EXE "Squidify.exe"
!define INSTALL_DIR "$PROGRAMFILES\${APP_NAME}"

SetCompressor lzma

Name "${APP_NAME} Installer"
OutFile "SquidifyInstaller.exe"
InstallDir "${INSTALL_DIR}"

Page directory
Page instfiles

Section "Install"
    SetOutPath "$INSTDIR"
    File /r "output/${APP_NAME}-win32-x64/*"
    CreateShortCut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\${APP_EXE}"
SectionEnd

Section "Uninstall"
    Delete "$DESKTOP\${APP_NAME}.lnk"
    RMDir /r "$INSTDIR"
SectionEnd
