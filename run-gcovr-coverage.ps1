# Supported platforms:
# - Windows
#
# Prerequisites:
# - g++ (MinGW on windows, with g++ and gcov added to PATH)
# - powershell (core)
# - gcovr
# 	https://gcovr.com/en/stable/guide.html#the-gcovr-command
# 	`pip install gcovr`
# 	Windows: Add '<ApplicationData>/Python/Python37/Scripts' to path

Set-Location $PSScriptRoot
git clean -dXf

g++ main.cpp helper.cpp --coverage -g -O0

./a.exe

gcovr -r . --output coverage.txt
gcovr -r . --json-summary --output coverage.json
gcovr -r . --coveralls 

gcov main.cpp helper.cpp helper.h -m

$json = Get-Content coverage.json | ConvertFrom-Json
ConvertTo-Json -depth 100 $json | Out-File coverage.json

Write-Host "Coverage: $($json.line_percent)%"
