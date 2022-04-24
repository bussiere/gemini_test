#!/bin/bash
python3 Analyze.py
sh blacked.sh
pip freeze > request.txt
git config --global user.name "bussiere"
git config --global user.email "bussiere@gmail.com"
branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
git pull origin $branch
git add .
current="`date +'%Y-%m-%d %H:%M:%S'`"
msg="Updated: $current"
git commit -m "wip $branch $msg"
git push origin $branch
ssh bussiere@192.168.192.77 'bash /Workspace/monolyth/forcepull.sh'
