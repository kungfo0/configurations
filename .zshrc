if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export PATH="$HOME/miniconda2/bin:/usr/local/bin:/usr/bin/git:/usr/bin:/usr/local/sbin:$PATH:$HOME/go/bin"
export EDITOR='vim'
export LESS="-R"

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export TTC_WEATHER=Tampere
export TTC_APIKEYS=false
export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'

ZSH_THEME=""
plugins=(aws zsh-autosuggestions docker web-search httpie command-not-found git colored-man colorize github jira virtualenv pip python brew osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_HOME=$(/usr/libexec/java_home -v 11) 

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

alias npmplease="rm -rf node_modules/ && rm -f package-lock.json && npm install"
alias ll='ls -latr'
alias la='ls -la'
alias svim="sudo vim"
alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"

alias mitproxy='mitmproxy -p 8888 --insecure'
eval "$(thefuck --alias)"
alias weather="curl -sS http://cdn.fmi.fi/weather-observations/products/finland/finland-weather-observations-map.png | imgcat && ansiweather -l Tampere,FI -u metric -a false -s false"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/python_dev
source ~/miniconda2/bin/virtualenvwrapper.sh

function f() {
    find . -iname "*$1*" "${@:2}"
}

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

function spoof() {
    PORT=$1
    HOST=$2
    sudo mitmproxy -p "$PORT" -s ~/utils/mitmproxy/examples/complex/dns_spoofing.py -R "$HOST" --insecure
}

source ~/work.sh

### Bashhub.com Installation
if [ -f ~/.bashhub/bashhub.zsh ]; then
    source ~/.bashhub/bashhub.zsh
fi


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f $HOME/.nvm/versions/node/v5.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . $HOME/.nvm/versions/node/v5.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f $HOME/.nvm/versions/node/v5.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . $HOME/.nvm/versions/node/v5.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
