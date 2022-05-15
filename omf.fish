# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Homebrew
eval (/opt/homebrew/bin/brew shellenv)

# Theme configuration
set -g theme_display_date no
set -g theme_color_scheme nord

# Android Env
set -gx ANDROID_HOME $HOME/Library/Android/Sdk
set -gx PATH $PATH $ANDROID_HOME/tools
set -gx PATH $PATH $ANDROID_HOME/platform-tools
set -gx ADB $ANDROID_HOME/platform-tools/adb

# Dot Net SDK
set -gx PATH $PATH /usr/local/share/dotnet

# Flutter SDK
set -gx PATH $PATH $HOME/Library/FlutterSDK/bin

# Node
set -gx PATH $PATH /opt/homebrew/opt/node@12/bin

#Alias
alias echo-alias='cat /Users/virginiahendras/Console/alias_list/README.md'
alias cl='clear'
alias cd..='cd ../'
alias npms='npm start'
alias rna='npx react-native run-android'
alias gad='git add .'
alias arelease='./gradlew assembleRelease'
alias abundle='./gradlew bundleRelease'
alias commit='gitmoji -c'
alias gmain='git push origin main'
alias mirror='scrcpy & disown'
alias branch='git branch'
alias rmnode='echo "⏳ Deleting node modules..."; rm -rf ./node_modules/; rm -f ./package-lock.json; echo "✅ Node modules has been deleted."'
alias pull-main='git pull origin main'
alias pull-mas='git pull origin master'
alias mostart='brew services start mongodb-community@5.0'
alias dockcon='docker container'
alias setting='code ~/.config/fish/conf.d/omf.fish || echo "Failed to open setting"'
alias pod-clean='echo "⏳ Clean and restarting pod..."; rm -rf ~/Library/Caches/CocoaPods; rm -rf Pods; rm -rf ~/Library/Developer/Xcode/DerivedData/* || echo "skip..."; pod deintegrate; pod setup; pod install; echo "✅ Pods has restarted successfully."'

# Functions
# Checkout branch
function checkout
  git checkout $argv
end

#Check IP Address
function myip
  set ip (ipconfig getifaddr en0)
  echo -n "🏠 Your current ip is: "
  set_color green
  echo $ip
end