# Editors & Terminals
abbr --add vim nvim
abbr --add wez wezterm

# Git
abbr --add ga 'git add'
abbr --add ga. 'git add .'
abbr --add gco 'git checkout'
abbr --add gc 'git commit'
abbr --add gcl 'git clone'
abbr --add gp 'git push'
abbr --add gpt 'git push --tags'
abbr --add gu 'git pull'
abbr --add gf 'git fetch'
abbr --add gd 'git diff'

# Docker
abbr --add do 'docker container'
abbr --add dop 'docker container ps'
abbr --add dob 'docker container build'
abbr --add dor 'docker container run --rm'
abbr --add dox 'docker container exec -it'

abbr --add dc 'docker compose'
abbr --add dcu 'docker compose up'
abbr --add dcub 'docker compose up --build'
abbr --add dcd 'docker compose down'
abbr --add dcr 'docker compose restart'

# Utils
abbr --add mkd 'mkdir -p'
abbr --add yy yazi
abbr --add yz yazi
alias ls 'eza --icons --group-directories-first'
abbr --add ll 'ls -l'
abbr --add la 'ls -la'
abbr --add fzf 'fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias cat bat
alias grep rg

# Nvidia
alias nvidia-settings 'nvidia-settings --config="$XDG_CONFIG_HOME/nvidia/settings"'
