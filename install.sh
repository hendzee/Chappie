#! /bin/bash

echo 'Chappie v0.0.1'
echo 'Copying function files...'
cp ./echo-alias.fish ~/.config/fish/functions/ && echo 'Copy functions has completed'
echo 'Copying setting file to fish...'
cp ./omf.fish ~/.config/fish/functions/ && echo 'Copy setting file has completed'
echo 'Finish'