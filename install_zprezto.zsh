setopt EXTENDED_GLOB

# Cline repository
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Delete existing rc directory
rm -rf ${ZDOTDIR:-$HOME}/.zprezto/runcoms

# Link rc directory
ln -s ${ZDOTDIR:-$HOME}/dotfiles/runcoms ${ZDOTDIR:-$HOME}/.zprezto/runcoms

# Link rc files
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
