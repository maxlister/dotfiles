set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_DESKTOP_DIR $HOME/Desktop
set -gx XDG_DOWNLOAD_DIR $HOME/Downloads
set -gx XDG_DOCUMENTS_DIR $HOME/Documents
set -gx XDG_MUSIC_DIR $HOME/Music
set -gx XDG_PICTURES_DIR $HOME/Pictures
set -gx XDG_VIDEOS_DIR $HOME/Videos

set -gx EDITOR nvim

set -gx MOZ_DISABLED_RDD_SANDBOX 1
set -gx LIBVA_DRIVER_NAME nvidia
set -gx CUDA_CACHE_PATH $XDG_CACHE_HOME/nv

set -gx GRIM_DEFAULT_DIR $XDG_PICTURES_DIR/Screenshots

set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx GOPATH $XDG_DATA_HOME/go
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

set -gx DOTNET_CLI_HOME $XDG_DATA_HOME/dotnet
set -gx NUGET_PACKAGES $XDG_CACHE_HOME/NuGetPackages

set -gx TERMINFO $XDG_DATA_HOME/terminfo
set -gx TERMINFO_DIRS $XDG_DATA_HOME/terminfo:/usr/share/terminfo

set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -e SSH_AGENT_PID
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh
