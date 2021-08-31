# https://gcc.gnu.org/onlinedocs/gcc/Invoking-Gcov.html#Invoking-Gcov

cd $PSScriptRoot
git clean -dXf

g++ main.cpp helper.cpp --coverage -g -O0

./a.exe

gcov main.cpp helper.cpp -m
