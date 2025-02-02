for file in ~/.config/zsh/*.zsh ; do
  source $file
done

eval "$(sheldon source)"
eval "$(starship init zsh)"
