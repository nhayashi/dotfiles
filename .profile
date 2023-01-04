
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.poetry/bin:$PATH"
source "/Users/hayashi.naritoshi/.rover/env"

# added by Miniconda3 installer
export PATH="$HOME/miniconda3/bin:$PATH"

# anyenv
export PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init -)"

# pyenv, pyenv-virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# phpenv
export PATH="/usr/local/opt/bzip2/bin:$PATH"

# go lang
export GOROOT=$HOME/go
export GOPATH=$HOME/code
export PATH=$GOROOT/bin:$PATH
export PATH=$GOPATH/bin:$PATH

# gls color
eval "$(gdircolors ~/code/src/github.com/seebi/dircolors-solarized/dircolors.256dark)"

# for git diff-hgighlight PATH
export PATH=/usr/local/share/git-core/contrib/diff-highlight:$PATH

# mysql@5.6
#export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/mysql@5.6/lib"
#export CPPFLAGS="-I/usr/local/opt/mysql@5.6/include"

# Neovim
export EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hayashi.naritoshi/google-cloud-sdk/path.bash.inc' ]; then . '/Users/hayashi.naritoshi/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hayashi.naritoshi/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/hayashi.naritoshi/google-cloud-sdk/completion.bash.inc'; fi
# export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# stern bash completion
#source <(stern --completion=bash)

# npm completion
eval "`npm completion`"

# node modules bin path
export PATH=$PATH:./node_modules/.bin

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# gradle-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# hekaton github token
export GITHUB_TOKEN=a4f33c07b403a5e6308eaaecd22d815843638c72

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# kubectl-completion
#source <(kubectl completion bash)

# hekaton bash completion
#eval "$(_HEKATON_COMPLETE=bash_source hekaton)"

# bazel
export PATH=$PATH:$HOME/bin
source $HOME/.bazel/bin/bazel-complete.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pack
. $(pack completion)

# kn
#source <(kn completion bash)
eval "`kn completion bash`"

# rover
source "/Users/hayashi.naritoshi/.rover/env"
APOLLO_TELEMETRY_DISABLED=1

# Enable gke-gcloud-auth-plugin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
