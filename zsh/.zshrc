# shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/.dotfiles

# your project folder that we can `c [tab]` to
export PROJECTS=~/Code

# source every .zsh file in this rep
for config_file ($ZSH/**/*.zsh) source $config_file

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
# for config_file ($ZSH/**/completion.sh) source $config_file

# configuring dircolors
export LS_COLORS="$ZSH/zsh/.dircolors"
eval `dircolors $ZSH/zsh/.dircolors`

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
