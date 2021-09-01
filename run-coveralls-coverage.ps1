param(
    $COVERALLS_REPO_TOKEN
)

# https://gcovr.com/en/stable/guide.html#the-gcovr-command
# pip install gcovr
# Add 'C:\Users\harol.DESKTOP-P3APK3S\AppData\Roaming\Python\Python37\Scripts' to path

Set-Location $PSScriptRoot
# git clean -dXf

Write-Host "--- Cloning and installing cpp-coveralls"
git clone https://github.com/eddyxu/cpp-coveralls
pip install --user cpp-coveralls

Write-Host "--- Building program"
g++ main.cpp helper.cpp --coverage -g -O0

Write-Host "--- Executing program to obtain coverage information"
if($IsLinux)
{
    ./a.out
}
else 
{
    ./a.exe
}

Write-Host "--- Running cpp-coveralls to upload coverage report"
coveralls -r . --verbose --repo-token $COVERALLS_REPO_TOKEN
