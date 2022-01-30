
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
alias d="kitty +kitten diff"

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

# enable lf icons
[ -s "${HOME}/.config/lf/lf-icons.sh" ] && source "${HOME}/.config/lf/lf-icons.sh"

## "home" and "end" keys functionality in shell
# for tmux sessions
bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line

# for normal sessions
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
