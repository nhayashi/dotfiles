# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# bash-completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

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
source ~/.rover/env

# apollo
APOLLO_TELEMETRY_DISABLED=1

# Enable gke-gcloud-auth-plugin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
