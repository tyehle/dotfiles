# change the intro message
function fish_greeting
    # fortune
end

eval (/opt/homebrew/bin/brew shellenv)
fish_add_path  "$HOME/.cargo/bin/"

# don't shorten directory names in the prompt
set -g fish_prompt_pwd_dir_length 0

# setup rbenv
contains $HOME/.rbenv/bin $fish_user_paths; or set --universal --append --export fish_user_paths $HOME/.rbenv/bin
status --is-interactive; and rbenv init - | source

# setup pyenv
set --universal --export PYENV_ROOT $HOME/.pyenv
contains $PYENV_ROOT/bin $fish_user_paths; or set --universal --append --export fish_user_paths $PYENV_ROOT/bin
pyenv init - | source

# setup powerline
function fish_prompt
    powerline-rs --shell bare $status
end
set VIRTUAL_ENV_DISABLE_PROMPT 1

# aliases
alias g='git'
