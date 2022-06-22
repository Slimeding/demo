set /p commit_log=请输入 commit 日志信息:

git add .
git commit -m "%commit_log%"
git push origin master
pause
