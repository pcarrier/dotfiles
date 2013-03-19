set print pretty
set height 0

set logging on

set history save
set history filename ~/.gdb_history
set history size 1048576

set confirm off

define bta
  thread apply all backtrace full
end

define lon
  set scheduler-locking on
end

define loff
  set scheduler-locking off
end
