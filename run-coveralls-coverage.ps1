param(
    $COVERALLS_REPO_TOKEN
)

# https://gcovr.com/en/stable/guide.html#the-gcovr-command
# pip install gcovr
# Add 'C:\Users\harol.DESKTOP-P3APK3S\AppData\Roaming\Python\Python37\Scripts' to path

cd $PSScriptRoot
# git clean -dXf

git clone https://github.com/eddyxu/cpp-coveralls
pip install --user cpp-coveralls

g++ main.cpp helper.cpp --coverage -g -O0

./a.exe

coveralls -r . --verbose --repo-token $COVERALLS_REPO_TOKEN
