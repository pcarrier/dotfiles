function fish_prompt --description 'Write out the prompt'
  set stat $status

  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  switch $USER
    case root
      if not set -q __fish_prompt_cwd
        if set -q fish_color_cwd_root
          set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
        else
          set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end
      end

      echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" '# '

    case '*'
      if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
      echo -n -s $stat ' ' "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" (vcprompt -f ' %b%m%u') '➜ '
  end
end

