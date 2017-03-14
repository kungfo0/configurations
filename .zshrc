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

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline]'

alias ll='ls -latr'
alias la='ls -la'
alias svim="sudo vim"
alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
#alias mitproxy='proxychains4 mitmproxy -p 8888'
alias mitproxy='mitmproxy -p 8888 --insecure'
eval "$(thefuck --alias)"
alias weather="curl -sS http://cdn.fmi.fi/weather-observations/products/finland/finland-weather-observations-map.png | imgcat && ansiweather -a false -s false"

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

source ~/work.sh
