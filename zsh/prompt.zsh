autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_branch() {
  echo $(/usr/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st =~ ^.*nothing.+to.+commit.*$ ]]
    then
      echo " %F{002}($(git_prompt_info))%f"
    else
      echo " %{$fg_bold[red]%}($(git_prompt_info))%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

unpushed () {
  /usr/bin/git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo " %{$fg_bold[magenta]%}➠%{$reset_color%}"
  fi
}

rb_prompt(){
  if $(which rbenv &> /dev/null)
  then
    echo "%{$fg_bold[cyan]%}$(rbenv version | awk '{print $1}')%{$reset_color%}"
  else
    echo ""
  fi
}

current_time(){
  echo 'date +"%d.%m.%Y %H:%M:%S"'
}

directory_name(){
  echo "%{$fg_bold[magenta]%}%1/%\%{$reset_color%}"
}

suffix(){
  echo "%{$fg_bold[cyan]%} › %{$reset_color%}"
}

export PROMPT=$'\n$(directory_name)$(git_dirty)$(need_push)$(suffix)'
set_prompt () {
  export RPROMPT="$(rb_prompt)"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
