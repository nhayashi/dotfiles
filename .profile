# Deprecation interactive shell warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# bash-completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# mise
#eval "$(~/.local/bin/mise activate bash)"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
#. $(brew --prefix asdf)/libexec/asdf.sh

# Neovim
export EDITOR=nvim

# gls color
eval "$(gdircolors ~/code/src/github.com/seebi/dircolors-solarized/dircolors.256dark)"

# for git diff-hgighlight PATH
export PATH=$PATH:/opt/homebrew/share/git-core/contrib/diff-highlight

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi

# JetBrains scripts PATH
export PATH=$PATH:~/Library/Application\ Support/JetBrains/Toolbox/scripts

# node modules bin path
export PATH=$PATH:./node_modules/.bin

# rover
#source ~/.rover/env

# apollo
APOLLO_TELEMETRY_DISABLED=1

# Enable gke-gcloud-auth-plugin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Rancher Desktop
#export PATH=$HOME/.rd/bin:$PATH

# golang
export PATH="$PATH:$(go env GOPATH)/bin"

# Rust
#. "$HOME/.cargo/env"

# mysql
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
