#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Install gems in home directory
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# NVM Path
source /usr/share/nvm/init-nvm.sh
