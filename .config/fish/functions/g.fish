function g
  switch $argv[1]
    case '*/*'
      set repo $argv[1]
    case '*'
      set repo airbnb/$argv[1]
  end

  set tgt ~/repos/"$repo"

  if not test -d $tgt
    mkdir -p $tgt
    git clone git@github.com:$repo "$tgt"
  end

  cd "$tgt"
end
