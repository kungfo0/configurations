if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export PATH="/usr/local/bin:/usr/bin/git:/usr/bin:/usr/local/sbin:$PATH"
export EDITOR='vim'
export LESS="-R"

export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(zsh-autosuggestions docker web-search httpie command-not-found git colored-man colorize github jira virtualenv pip python brew osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

alias ll='ls -latr'
alias la='ls -la'
alias svim="sudo vim"
alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
#alias mitproxy='proxychains4 mitmproxy -p 8888'
alias mitproxy='mitmproxy -p 8888 --insecure'
eval "$(thefuck --alias)"
alias weather="curl -sS http://cdn.fmi.fi/weather-observations/products/finland/finland-weather-observations-map.png | imgcat && ansiweather -l Tampere,FI -u metric -a false -s false"
alias apache_start="sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.httpd22.plist"
alias apache_stop="sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.httpd22.plist"
alias apache_restart="sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.httpd22.plist &&  sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.httpd22.plist"

export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"

function f() { find . -iname "*$1*" ${@:2}  }

function exip () {
    # gather external ip address
    echo -n "Current External IP: "
    curl -s -m 5 http://ipv4.myip.dk/api/info/IPv4Address
}

function killport () {
    kill -9 "$(lsof -i tcp:$1 | tail -1 | awk '{ print $2; }')"
}

function mkcd() {
    mkdir -p "$@" && cd "$_";
}

function emo() {
    en=$(eval "trans -brief fi: \"$@\"")
    emoj -c "$en"
}

source ~/work.sh
