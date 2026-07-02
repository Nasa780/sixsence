@echo off
echo ================================
echo   PUSH SIXSENCE BACKEND - AUTO
echo ================================

REM Aller dans ton dossier backend
cd C:\Users\onder\Downloads\Sixsence\backend

echo.
echo Ajout des fichiers...
git add .

echo.
echo Commit des modifications...
git commit -m "Backend update: timers, models, services, fixes"

echo.
echo Push vers la branche main...
git push origin main

echo.
echo Terminé !
pause
