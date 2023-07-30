# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/source/github.com/romkatv/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# enable autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# aliases
alias ls='ls --color=auto'
alias grep='grep --color'
alias ncmpcpp="ncmpcpp --quiet"
alias nvi="nvim -u NONE"

# environment variables
ZLE_RPROMPT_INDENT=0

# enable history
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/applications/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/applications/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/applications/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/applications/google-cloud-sdk/completion.zsh.inc"; fi

source <(kubectl completion zsh)

# enable nvm for zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# enable lf icons
[ -s "${HOME}/.config/lf/lf-icons.sh" ] && source "${HOME}/.config/lf/lf-icons.sh"

## "home" and "end" keys functionality in shell
# for tmux sessions
bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line

# for normal sessions
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/arindas/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/arindas/applications/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/arindas/applications/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/arindas/applications/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/arindas/applications/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

# opam configuration
[[ ! -r /home/arindas/.opam/opam-init/init.zsh ]] || source /home/arindas/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
