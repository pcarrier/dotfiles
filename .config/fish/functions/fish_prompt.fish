function fish_prompt --description 'Write out the prompt'
  set stat $status

  if not set -q __prompt_hostname
    set -g __prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __prompt_normal
    set -g __prompt_normal (set_color normal)
  end

  if not set -q __prompt_cwd
    set -g __prompt_cwd (set_color $fish_color_cwd)
  end

  if not set -q __prompt_error
    set -g __prompt_error (set_color $fish_color_error)
  end

  if not set -q __prompt_vcs
    set -g __prompt_vcs (set_color purple)
  end

  if test $stat -ne 0
    set precmd "$__prompt_error$stat$__prompt_normal "
  else
    set precmd
  end

  set vcs_info (vcprompt -f '%b%m%u')

  if test -n "$vcs_info"
    set vcs_info " $__prompt_vcs$vcs_info$__prompt_normal"
  end

  echo -n -s $precmd \
             "$USER" @ "$__prompt_hostname" ' ' \
             "$__prompt_cwd" (prompt_pwd) "$__prompt_normal" \
             "$vcs_info" '> '
end

