# Supported platforms:
# - Windows
#
# Prerequisites:
# - g++ (MinGW on windows, with g++ and gcov added to PATH)
# - powershell (core)
#
# Notes:
# https://gcc.gnu.org/onlinedocs/gcc/Invoking-Gcov.html#Invoking-Gcov

Set-Location $PSScriptRoot
git clean -dXf

g++ main.cpp helper.cpp --coverage -g -O0

if($IsLinux -or $IsMacOS)
{
    ./a.out
}
else 
{
    ./a.exe
}

gcov main.cpp helper.cpp -m
