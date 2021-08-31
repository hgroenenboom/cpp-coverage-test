# https://gcovr.com/en/stable/guide.html#the-gcovr-command
# pip install gcovr
# Add 'C:\Users\harol.DESKTOP-P3APK3S\AppData\Roaming\Python\Python37\Scripts' to path

g++ main.cpp --coverage -g -O0

./a.exe

gcovr -r . --output coverage.txt
gcovr -r . --json-summary --output coverage.json
