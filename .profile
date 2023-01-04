
# gls color
eval "$(gdircolors ~/code/src/github.com/seebi/dircolors-solarized/dircolors.256dark)"

# for git diff-hgighlight PATH
export PATH=/usr/local/share/git-core/contrib/diff-highlight:$PATH

# Neovim
export EDITOR=nvim

# npm completion
eval "`npm completion`"

# node modules bin path
export PATH=$PATH:./node_modules/.bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# rover
source "/Users/hayashi.naritoshi/.rover/env"
APOLLO_TELEMETRY_DISABLED=1

# Enable gke-gcloud-auth-plugin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
