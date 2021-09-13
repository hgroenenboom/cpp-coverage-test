param(
    $COVERALLS_REPO_TOKEN
)

# Supported platforms:
# - Windows
# - Linux
#
# Prerequisites:
# - g++ (MinGW on windows, with g++ and gcov added to PATH)
# - powershell (core)
# - git
# - coveralls account, with repository and repository token (free account with public repository is fine)

Set-Location $PSScriptRoot
git clean -dXf

Write-Host "--- Cloning and installing cpp-coveralls"
git clone https://github.com/eddyxu/cpp-coveralls
pip3 install cpp-coveralls

Write-Host "--- Building program"
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

Write-Host "--- Running cpp-coveralls to upload coverage report"
coveralls -r . --verbose --repo-token $COVERALLS_REPO_TOKEN
