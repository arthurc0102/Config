# Load zplug.
source "${HOME}/.zplug/init.zsh"

## ssh-agent config should place before loading oh-my-zsh.
[ -z "$SHORT_HOST" ] && export SHORT_HOST="localhost"
zstyle :omz:plugins:ssh-agent identities $SSH_AGENT_IDENTITIES

# Load plugin.
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/web-search", from:oh-my-zsh
zplug "zpm-zsh/clipboard"
zplug "zsh-users/zsh-autosuggestions"
zplug "qoomon/zsh-lazyload"
zplug "zsh-users/zsh-completions", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Theme config.
source "$HOME/.dotfiles/zsh/theme.zsh"
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

## Load custom settings
source "$HOME/.dotfiles/zsh/alias.zsh"
source "$HOME/.dotfiles/zsh/config.zsh"
source "$HOME/.dotfiles/zsh/environments/android.zsh"
source "$HOME/.dotfiles/zsh/environments/flutter.zsh"
source "$HOME/.dotfiles/zsh/environments/golang.zsh"
source "$HOME/.dotfiles/zsh/environments/mysql.zsh"
source "$HOME/.dotfiles/zsh/environments/node.zsh"
source "$HOME/.dotfiles/zsh/environments/python.zsh"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
# zplug load --verbose

## Lazyload
lazyload pyenv python pip pipx -- 'load_pyenv'
lazyload nvm node npm npx git-cz -- 'load_nvm'
