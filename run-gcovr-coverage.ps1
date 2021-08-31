# https://gcovr.com/en/stable/guide.html#the-gcovr-command
# pip install gcovr
# Add 'C:\Users\harol.DESKTOP-P3APK3S\AppData\Roaming\Python\Python37\Scripts' to path

Remove-Item -Recurse *.exe

g++ main.cpp helper.cpp --coverage -g -O0

./a.exe

gcovr -r . --output coverage.txt
gcovr -r . --json-summary --output coverage.json

$json = Get-Content coverage.json | ConvertFrom-Json
ConvertTo-Json -depth 100 $json | Out-File coverage.json

Write-Host $json.line_percent
if($json.line_percent -lt 50)
{
	Write-Error "Coverage of $($json.line_percent)% is not enough!"
}
