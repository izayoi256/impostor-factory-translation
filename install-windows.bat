@echo off
cd /d %~dp0
powershell -NoProfile -ExecutionPolicy Unrestricted .\resources\install-windows.ps1
pause
