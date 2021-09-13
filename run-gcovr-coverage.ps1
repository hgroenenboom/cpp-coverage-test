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

Write-Host "--- Executing program to obtain coverage information"
if($IsLinux -or $IsMacOS)
{
    ./a.out
}
else 
{
    ./a.exe
}

gcovr -r . --output coverage.txt
gcovr -r . --json-summary --output coverage.json
gcovr -r . --coveralls 

$json = Get-Content coverage.json | ConvertFrom-Json
ConvertTo-Json -depth 100 $json | Out-File coverage.json

Write-Host "`n`nCoverage: $($json.line_percent)%"
