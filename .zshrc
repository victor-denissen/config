# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="/nfs/homes/vdenisse/.local/bin:$PATH"
export PATH="/nfs/homes/vdenisse/.nvim-linux64/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell" # set by `omz`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories # much, much faster.  # DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# Uncomment the following line if you want to change the command execution time
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# make sure the --git-dir is the same as the
# directory where you created the repo above.
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

function cat_fact_loop() {
  while true; do
    local fact=$(curl -s https://catfact.ninja/fact | jq -r '.fact' 2>/dev/null)
    fact=${fact:-"Cats can rotate their ears 180 degrees."}
    print -Pn "\e]0;$fact\a"
    sleep 60  # 1 minute = 60 seconds
  done
}

# Only start the loop if it's not already running
if [[ -z "$CAT_FACT_LOOP_STARTED" ]]; then
  export CAT_FACT_LOOP_STARTED=1
  cat_fact_loop &!
fi


countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}
alias coll="cd ~/Documents/git_collection"
alias libft="cd ~/Documents/git_collection/libft"
alias gnl="cd ~/Documents/git_collection/get_next_line"
# alias printf="cd ~/Documents/git_collection/ft_printf"
alias push="cd ~/Documents/git_collection/push_swap"
alias solong="cd ~/Documents/git_collection/so_long"
alias pipex="cd ~/Documents/git_collection/pipex"
alias philo="cd ~/Documents/git_collection/philosophers"
alias mini="cd ~/Documents/git_collection/minishell"
alias cb="cd ~/Documents/git_collection/Cub3d"
alias cpp="cd ~/Documents/git_collection/cpp"
alias t="tere --map Enter:ChangeDirAndExit --map 0:Exit"
alias p="python3"
alias s="p /home/ratchet/Documents/scripts/intra_utils/script_hub.py"

tere() {
	local result=$(~/tere/tere "$@")
    [ -n "$result" ] && cd -- "$result"
}

alias c="python3 ~/calendar/calendar_cli.py"
alias docker_nuke="docker stop $(docker ps -q) && docker rm $(docker ps -aq) && docker rmi -f $(docker images -q) && docker volume rm -f $(docker volume ls -q) && docker system prune -a --volumes -f"

alias cppinit="mkdir src; cd src; mkdir ClassImplements ClassHeaders;cd ..;touch src/main.cpp src/main.h"

alias gdb="gdb -x .gdbinit"

NVIM_SESSION_DIR=$HOME'/.local/share/nvim/sessions/'
export NVIM_SESSION_DIR
v() {
  if [ $# -eq 0 ]; then
    local session_dir=$NVIM_SESSION_DIR
    local session_files=()

    # Check session directory exists first
    if [ -d "$session_dir" ]; then
      for f in "$session_dir"/*.vim; do
        [[ -e "$f" ]] && session_files+=("$f")
      done
    fi

    if [ ${#session_files[@]} -eq 0 ]; then
      nvim .
      return
    fi

    echo "Available sessions:"
    local i=1
    local choices=()
    for file in "${session_files[@]}"; do
      local name=$(basename "$file" .vim)
      echo "  [$i] $name"
      choices+=("$file")
      ((i++))
    done

    echo "  [0] None (just open nvim .)"
    read "?Choose a session: " choice

    if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#choices[@]} ] | true; then
      # print "choice num: ${choice}"
      # print "choices num: ${choices}"
      # print "choice val: ${choices[$((choice))]}"
      nvim -S "${choices[$((choice))]}"
    else
      echo "Opening without session..."
      nvim .
    fi
  else
    nvim "$@"
  fi
}
delete_nvim_session() {
  local session_dir="${NVIM_SESSION_DIR:-$HOME/.config/nvim/sessions}"
  local session_files=()

  if [ ! -d "$session_dir" ]; then
    echo "No session directory found at $session_dir"
    return
  fi

  for f in "$session_dir"/*.vim; do
    [[ -e "$f" ]] && session_files+=("$f")
  done

  if [ ${#session_files[@]} -eq 0 ]; then
    echo "No sessions to delete."
    return
  fi

  echo "Available sessions to delete:"
  local i=1
  local choices=()
  for file in "${session_files[@]}"; do
    local name=$(basename "$file" .vim)
    echo "  [$i] $name"
    choices+=("$file")
    ((i++))
  done

  echo "  [0] Cancel"
  read "?Choose a session to delete: " choice

  if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#choices[@]} ]; then
    local to_delete="${choices[$((choice))]}"
    echo "Deleting: $(basename "$to_delete")"
    rm -f -- "$to_delete"
  else
    echo "Cancelled."
  fi
}
alias dvs="delete_nvim_session"



alias clear="clear;pwd;ls"
# alias lckill="sudo kill $(sudo lsof -ti:8000)"
alias dup="docker compose up -d"
alias down="docker compose down"
alias dre="docker compose build --no-cache"
alias dlog="docker compose logs -f"

alias francinette=/nfs/homes/vdenisse/francinette/tester.sh
alias lg="lazygit"
alias black="black --line-length=79"
alias vgdb="valgrind --vgdb-error=1"

alias paco=/nfs/homes/vdenisse/francinette/tester.sh
alias getlib="rm -rf libft; gcl git@github.com:ace-rake/Libft.git libft ; rm -rf libft/.git"
# preexec() { sleep 1; }

# Created by `pipx` on 2025-03-14 09:12:13
export PATH="$PATH:/home/ratchet/.local/bin"
USER=ratchet
export USER
