# change the intro message
function fish_greeting
    # fortune
end

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
powerline-daemon -q
set fish_function_path $fish_function_path "$HOME/.pyenv/versions/3.8.3/lib/python3.8/site-packages/powerline/bindings/fish"
powerline-setup
set VIRTUAL_ENV_DISABLE_PROMPT 1

# aliases
alias g='git'
