# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Use java 8 as default
export JAVA_HOME=$(/usr/libexec/java_home -v1.8)

# Remove Greeting
function fish_greeting
end

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
set -gx PATH $PATH $ANDROID_HOME/build-tools/31.0.0
set -gx ADB $ANDROID_HOME/platform-tools/adb
set -gx APK_SIGNER $ANDROID_HOME/build-tools/31.0.0/apksigner

# Dot Net SDK
set -gx PATH $PATH /usr/local/share/dotnet

# Flutter SDK
set -gx PATH $PATH $HOME/Library/FlutterSDK/bin

# Node
set -gx PATH $PATH /opt/homebrew/opt/node@12/bin

# Alias 
# Use git or react native commands on root of project
# alias echo-alias='cat /Users/virginiahendras/Console/alias_list/list.txt'
alias cl='clear'
alias cd..='cd ../'
alias npms='npm start'
alias rna='npx react-native run-android'
alias gad='git add .'
alias arelease='cd ./android && ./gradlew clean && ./gradlew assembleRelease; cd..'
alias abundle='cd ./android && ./gradlew clean && ./gradlew bundleRelease; cd..'
alias commit='gitmoji -c'
alias gmain='git push origin main'
alias mirror='scrcpy & disown'
alias branch='git branch'
alias rmnode='echo "⏳ Deleting node modules..." && rm -rf ./node_modules/ && echo "✅ Node modules has been deleted."'
alias grad-clean='echo "⏳ Cleaning gradle..." && cd android && ./gradlew clean && cd.. && echo "✅ Gradle has been cleaned."'
alias pull-main='git pull origin main'
alias pull-mas='git pull origin master'
alias mostart='brew services start mongodb-community@5.0'
alias dockcon='docker container'
alias setting='code ~/.config/fish/conf.d/omf.fish || echo "Failed to open setting"'
alias pod-clean='echo "⏳ Cleanning pod..."; rm -rf ~/Library/Caches/CocoaPods || echo "Skip..."; rm -rf Pods || echo "Skip..."; rm -rf ~/Library/Developer/Xcode/DerivedData/* || echo "skip..."; pod deintegrate || echo "skip..."; echo "✅ Pods has cleaned successfully."'

# Functions
# Checkout branch
function checkout
  git checkout $argv
end

# Check IP Address
function myip
  set ip (ipconfig getifaddr en0)
  echo -n "🏠 Your current ip is: "
  set_color green
  echo $ip
end

# Switching JAVA Version
function change-java
  echo
  echo '+___+ Hello, chappie here, i will change your java version'
  echo
  
  read -P ' > Which version do you want (1.8/11): ' choice

  if [ $choice = "1.8" ]
    export JAVA_HOME=$(/usr/libexec/java_home -v1.8)
    echo '+___+ JAVA VERSION HAS CHANGED TO V.8'
    echo
  else if [ $choice = "11" ]
    export JAVA_HOME=$(/usr/libexec/java_home -v11)
    echo '+___+ JAVA VERSION HAS CHANGED TO V.11'
    echo
  else
    echo 'The options only 1.8 and 11.'
  end

end

# Moving apk or aab to ApkStorage folder
function move-apk
  echo
  echo '+___+ Hello, chappie here, i will move your apk to ApkStorage folder, make sure youre in project root'
  echo
  
  read -P ' > Which type you want move (apk/aab): ' choice
  read -P ' > Whats name (no need extension): ' apkName

  echo
  
  if [ $choice = "apk" ]
    if test -f ./android/app/build/outputs/apk/release/app-release.apk
      echo "+___+ Copying apk to ApkStorage"
      cp ./android/app/build/outputs/apk/release/app-release.apk ~/ApkStorage/$apkName.apk
      echo "^___^ Apk files already copied"
    else
      echo "x___x apk files not found"
    end    
  else if [ $choice = "aab" ]
    if test -f ./android/app/build/outputs/bundle/release/app-release.aab
      echo "+___+ Copying aab to ApkStorage"
      cp ./android/app/build/outputs/bundle/release/app-release.aab ~/ApkStorage/$apkName.aab
      echo "^___^ aab files already copied"
    else
      echo "x___x aab files not found"
    end    
  end

  echo
end

function run-project
  set day (date +%A)
  
  echo 
  echo "+___+ Happy $day, Chappie here, which project you want to run ?"
  
  echo

  echo "0: MHC BE"
  echo "1: MHC FE"
  echo "2: MHC APP"
  echo "3: MHC CUSTOMER BE"
  echo "4: MHC CUSTOMER FE"
  echo "5: MHC EVET BE"
  echo "6: MHC EVENT FE"
  echo "7: MHC GROUPCARE BE"
  echo "8: MHC GROUPCARE FE"
  echo "9: MHC GROUPCARE APP"
  echo "c: To Cancel"

  echo
  
  read -P ' > Select project number: ' project

  echo
  greeting_work_ganbate
  echo

  sleep 3

  switch $project
    case 0
      run-mhc-be
    case 1
      run-mhc-fe
    case 2
      run-mhc-app
    case 3
      run-mhc-customer-be
    case 4
      run-mhc-customer-fe
    case 5
      run-mhc-event-be
    case 6
      run-mhc-event-fe
    case 7
      run-groupcare-be
    case 8
      run-groupcare-fe
    case 9
      run-groupcare-app
    case c
      echo 'Cancel'
    case '*'
      echo 'Cancel'
  end
end

# Automation mhc-app
function run-mhc-app
  echo 'Change directory'
  
  cd ~/WorkRepo/mhc-app/MHCApp/
  
  echo

  echo 'Open VSCode'

  code ./

  echo

  echo 'Set node version 16'

  nvm use 16

  echo

  echo 'Running bundle'

  npm run android-bundle

  echo

  echo 'Running node'

  npms

end

# Automation mhc-be
function run-mhc-be
  echo 'Change directory'

  cd ~/WorkRepo/mhc-be/
  
  echo

  echo 'Open VSCode'

  code ./

  echo

  echo 'Set node version 10'

  nvm use 10

  echo

  echo 'Running node'

  npms

end

# mhc-fe
function run-mhc-fe
  echo 'Change directory'

  cd ~/WorkRepo/mhc-web/

  echo

  echo 'Open VSCode'

  code ./

  echo

  echo 'Set node verson 10'
end


# Automation groupcare-app
function run-groupcare-app
  echo 'Change directory'

  cd ~/WorkRepo/income-mobile/IncomeApp/
  
  echo

  echo 'Open VSCode'

  code ./

  echo

  echo 'Set node version 10'

  nvm use 10

  echo

  echo 'Running bundle'

  npm run bundle

  echo

  echo 'Running node'

  npms

end

# Automation mhc-customer-be
function run-mhc-customer-be
  echo 'Change directory'

  cd ~/WorkRepo/mhc-customer-be/
  
  echo

  echo 'Open VSCode'

  code ./

  echo

  echo 'Set node version 10'

  nvm use 10

  echo

  echo 'Running node'

  npms

end

# Automation mhc-customer-be
function run-mhc-customer-fe
  echo 'Change directory'

  cd ~/WorkRepo/mhc-customer-fe/
  
  echo

  echo 'Open VSCode'

  code ./

  echo

  echo 'Set node version 10'

  nvm use 10
end

# mhc-event-be
function run-mhc-event-be
  echo 'Change directory'

  cd ~/WorkRepo/mhc-event-be/
  
  echo

  echo 'Open VSCode'

  code ./

  echo

  echo 'Set node version 10'

  nvm use 10

  echo

  echo 'Running node'

  npms

end

# mhc-event-fe
function run-mhc-event-fe
  echo 'Change directory'

  cd ~/WorkRepo/mhc-event-fe/
  
  echo

  echo 'Open VSCode'

  code ./

  echo

  echo 'Set node version 10'

  nvm use 10
end

# groupcare-be
function run-groupcare-be
  echo 'Change directory'

  cd ~/WorkRepo/groupcare-be/
  
  echo

  echo 'Open VSCode'

  code ./

  echo

  echo 'Set node version 10'

  nvm use 10

  echo

  echo 'Running node'

  npms

end

# groupcare fe
function run-groupcare-fe
  echo 'Change directory'

  cd ~/WorkRepo/groupcare-fe/
  
  echo

  echo 'Open VSCode'

  code ./

  echo

  echo 'Set node version 10'

  nvm use 10
end

function greeting_work_ganbate
  echo '---------------------------------------------------------------'
  echo '^__^ I will prepare it. Success for today and be happy always'
  echo '---------------------------------------------------------------'
end