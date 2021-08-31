# https://gcovr.com/en/stable/guide.html#the-gcovr-command

g++ main.cpp --coverage -g -O0

./a.exe

gcovr --output coverage.txt
gcovr --json-summary --output coverage.json
