if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/conf.d/variables.fish
source ~/.config/fish/conf.d/fzf.fish

starship init fish | source
zoxide init fish | source
fzf --fish | source
