#!/bin/sh
git add *
git commit -m "Segunda revision"
git remote add origin git@github.com:pablinn/ceh.git
gir push -U origin master
