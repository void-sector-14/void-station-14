@echo off
set PDIR=%~dp0
cd %PDIR%
dotnet run --project Content.Server
set PDIR=
pause


