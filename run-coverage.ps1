# https://gcc.gnu.org/onlinedocs/gcc/Invoking-Gcov.html#Invoking-Gcov

g++ main.cpp --coverage -g -O0

gcov main.cpp -m