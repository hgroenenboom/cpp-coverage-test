# Supported platforms:
# - Windows
#
# Prerequisites:
# - g++ (MinGW on windows, with g++ and gcov added to PATH)
# - powershell (core)
# - cmake
# - gcovr
# 	https://gcovr.com/en/stable/guide.html#the-gcovr-command
# 	`pip install gcovr`
# 	Windows: Add '<ApplicationData>/Python/Python37/Scripts' to path

Set-Location $PSScriptRoot
git clean -dXf

New-Item -Type Directory $PSScriptRoot/build -Force | Out-Null
Set-Location $PSScriptRoot/build
cmake ../ -G "Unix Makefiles"
make

if($IsLinux -or $IsMacOS)
{
    ./GcovTest
}
else 
{
    ./GcovTest.exe
}

Set-Location ..

gcovr -r . --output coverage.txt
gcovr -r . --json-summary --output coverage.json

$json = Get-Content coverage.json | ConvertFrom-Json
ConvertTo-Json -depth 100 $json | Out-File coverage.json

Write-Host "Coverage: $($json.line_percent)%"
