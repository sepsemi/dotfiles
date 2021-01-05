source ~/.config/zsh/antigen.zsh
antigen use oh-my-zsh
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
alias manager='sudo /opt/lampp/manager-linux-x64.run'

antigen bundle git
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle last-working-dir
antigen bundle z
antigen apply
alias gerease='make clean; rm -rf config.h && git reset --hard origin/master'

function git_branch_name()
{
    branch=$(git symvolic-ref HEAD 2>/dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo '- ('$braanch')'
    fi    
}

setopt prompt_subst

if [ "$EUID" -ne 0 ]; then
    PROMPT='%F{28}[%F{197}%1~%f%F{28}]%f%f '
else
    ROMPT='%F{196}[%F{208}%1~%f%F{196}]%f%f '
fi

PROMT='%2/ $(git_branch_name) > '


# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`

