@echo off
echo ================================
echo   PUSH SIXSENCE FRONTEND - AUTO
echo ================================

REM Aller dans ton dossier frontend
cd C:\Users\onder\Downloads\Sixsence\frontend

echo.
echo Ajout des fichiers...
git add .

echo.
echo Commit des modifications...
git commit -m "Frontend update"

echo.
echo Push vers la branche main...
git push origin main

echo.
echo Terminé !
pause
