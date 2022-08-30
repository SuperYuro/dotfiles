# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Paradox

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Alias
Set-Alias c cd
Set-Alias vim nvim
Set-Alias v vim
Set-Alias ll ls
Set-Alias la ls
Set-Alias grep findstr
Set-Alias g git
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
