@echo off
cd /d %~dp0
powershell -NoProfile -ExecutionPolicy Unrestricted .\translate.ps1
