#!/bin/sh
git add *
git commit -m "Segunda revision"
git status
git remote add origin git@github.com:pablinn/ceh.git
git push -u origin master
