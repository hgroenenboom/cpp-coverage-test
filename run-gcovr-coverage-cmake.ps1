# https://gcovr.com/en/stable/guide.html#the-gcovr-command
# pip install gcovr
# Add 'C:\Users\harol.DESKTOP-P3APK3S\AppData\Roaming\Python\Python37\Scripts' to path

cd $PSScriptRoot
git clean -dXf

New-Item -Type Directory $PSScriptRoot/build -Force | Out-Null
cd $PSScriptRoot/build
cmake ../ -G "Unix Makefiles"
make

./GcovTest.exe

cd ..

gcovr -r . --output coverage.txt
gcovr -r . --json-summary --output coverage.json

$json = Get-Content coverage.json | ConvertFrom-Json
ConvertTo-Json -depth 100 $json | Out-File coverage.json

Write-Host "Coverage: $($json.line_percent)%"
