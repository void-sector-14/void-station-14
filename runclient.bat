@echo off
set PDIR=%~dp0
cd %PDIR%
dotnet run --project Content.Client
set PDIR=
pause
