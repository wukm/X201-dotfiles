# barebones bashrc. the already sourced /etc/{profile,bash.bashrc} are also
# pretty trim.

# the presence of $ should be enough to tell it's bash, right?
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# and finally:
alias ls='ls --color=auto'
