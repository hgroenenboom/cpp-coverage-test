# https://gcc.gnu.org/onlinedocs/gcc/Invoking-Gcov.html#Invoking-Gcov

g++ main.cpp --coverage -g -O0

./a.exe

gcov main.cpp -m
