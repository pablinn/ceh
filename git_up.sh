#!/bin/sh
git add *
git commit -m "Segunda revision"
git status
git rm 
git commit -m "Segunda revision"
#git remote add origin git@github.com:pablinn/ceh.git
git push -u -f origin master
