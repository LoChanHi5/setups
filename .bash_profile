#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Change Prompt
#   ------------------------------------------------------------
    PROMPT_COMMAND=$PROMPT_COMMAND' PS1="${c_path}\W${c_reset}$(git_prompt) :> "'
    export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

    # A more colorful prompt
    # \[\e[0m\] resets the color to default color
    c_reset='\[\e[0m\]'
    #  \e[0;31m\ sets the color to red
    c_path='\[\e[0;31m\]'
    # \e[0;32m\ sets the color to green
    c_git_clean='\[\e[0;32m\]'
    # \e[0;31m\ sets the color to red
    c_git_dirty='\[\e[0;31m\]'
    
    git_prompt ()
    {
      # Is this a git directory?
      if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
      fi
      # Grab working branch name
      git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
      # Clean or dirty branch
      if git diff --quiet 2>/dev/null >&2; then
        git_color="${c_git_clean}"
      else
        git_color=${c_git_dirty}
      fi
      echo " [$git_color$git_branch${c_reset}]"
    }

#   Set Paths
#   ------------------------------------------------------------
    # Rbenv autocomplete and shims
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
    # Path for RBENV
    test -d "$HOME/.rbenv/" && export PATH="$HOME/.rbenv/bin:$PATH"

    test -d /usr/local/bin && export PATH="~/bin:$PATH"

#   Set Default Editor
#   ------------------------------------------------------------
    export EDITOR="gvim --wait"

#   -----------------------------
#   2. Aliases
#   -----------------------------

#   Terminal
#   -------------------------------------------------------------------
    alias cp='cp -iv'                           # Preferred 'cp' implementation
    alias mv='mv -iv'                           # Preferred 'mv' implementation
    alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
    alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
    alias less='less -FSRXc'                    # Preferred 'less' implementation
    alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
    alias ..='cd ../'                           # Go back 1 directory level
    alias ...='cd ../../'                       # Go back 2 directory levels
    alias .3='cd ../../../'                     # Go back 3 directory levels
    alias .4='cd ../../../../'                  # Go back 4 directory levels
    alias .5='cd ../../../../../'               # Go back 5 directory levels
    alias .6='cd ../../../../../../'            # Go back 6 directory levels
    alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
    alias ~="cd ~"                              # ~:            Go Home
    alias c='clear'                             # c:            Clear terminal display
    alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
    alias show_options='shopt'                  # Show_options: display bash options settings
    alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
    alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

    #   Web
    #   -------------------------------------------------------------------
    alias be="bundle exec"
    alias dc="docker-compose"
    alias dcr="docker-compose run --rm web"
    alias startnginx='sudo nginx'
    alias stopnginx='sudo killall nginx'
    alias restartnginx='stopnginx; startnginx'
    alias graphbranch='git log --oneline --abbrev-commit --graph --decorate --color'
    alias graphall='git log --oneline --abbrev-commit --all --graph --decorate --color'

    #   Folders
    #   -------------------------------------------------------------------
    alias lf='cd ~/Desktop/LoveWithFood/Love-With-Food'
    alias pt='cd ~/Desktop/LoveWithFood/insights_pattern_library'
    alias ins='cd ~/Desktop/LoveWithFood/insights'
    alias self='cd ~/Desktop/personal/projects'
    alias viking='cd ~/Desktop/personal/projects/viking'
    alias temp="cd ~/Desktop/Temporary"

    #   Git
    #   -------------------------------------------------------------------
    alias g='git status'
    alias gco="git checkout"
    alias gp="git pull"
    alias gl='git log'
    alias gc='git commit'
    alias gp='git pretty-accept'

#   ---------------------------
#   6. NETWORKING
#   ---------------------------

    alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
    alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
    alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache

#   ---------------------------------------
#   8. Make Terminal Better
#   ---------------------------------------

#   Add autocomplete
#   -------------------------------------------------------------------
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi

    # Load git completions
    git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
    test -s $git_completion_script && source $git_completion_script

#   Add Less to Vim
#   -------------------------------------------------------------------
    function vless() {
      vim -u $(brew info macvim | tail +4 | head -1 | cut -f 1 -d ' ')/MacVim.app/Contents/Resources/vim/runtime/macros/less.vim $*
    }
