function echo-alias
    set -l highlight green
    set -l default normal
    
    echo -n '- cl: ';
    set_color $highlight; 
    echo 'Clear terminal';
    set_color $default;
    
    echo -n '- cd..: '; 
    set_color $highlight; 
    echo 'To above directory';
    set_color $default;

    echo -n '- npms: ';
    set_color $highlight; 
    echo 'npm start';
    set_color $default;

    echo -n '- rna: ';
    set_color $highlight; 
    echo 'Running android for react native app';
    set_color $default;

    echo -n '- gad: ';
    set_color $highlight; 
    echo 'git add .';
    set_color $default;

    echo -n '- arelease: ';
    set_color $highlight; 
    echo 'Build apk for react native';
    set_color $default;
    
    echo -n '- abundle:';
    set_color $highlight; 
    echo 'Build aab for react native';
    set_color $default;
    
    echo -n '- commit: ';
    set_color $highlight; 
    echo 'gitmoji -c';
    set_color $default;
    
    echo -n '- gmain: ';
    set_color $highlight; 
    echo 'git push origin main';
    set_color $default;
    
    echo -n '- mirror: ';
    set_color $highlight; 
    echo 'Mirroring phone with scrcpy software';
    set_color $default;
    
    echo -n '- branch: ';
    set_color $highlight; 
    echo 'git branch';
    set_color $default;
    
    echo -n '- rmnode: ';
    set_color $highlight; 
    echo 'Remove node_modules folder and also package-lock.json file';
    set_color $default;
    
    echo -n '- pull-main: ';
    set_color $highlight; 
    echo 'git pull main';
    set_color $default;
    
    echo -n '- pull-mas: ';
    set_color $highlight; 
    echo 'git pull mas';
    set_color $default;
    
    echo -n '- mostart: ';
    set_color $highlight; 
    echo 'Starting mongodb community';
    set_color $default;
    
    echo -n '- dockon: ';
    set_color $highlight; 
    echo 'docker container';
    set_color $default;
    
    echo -n '- setting: ';
    set_color $highlight; 
    echo 'Open setting aliases file';
    set_color $default;
    
    echo -n '- pod-clean: ';
    set_color $highlight; 
    echo 'Cleaning X-Code Pod';
    set_color $default;
end