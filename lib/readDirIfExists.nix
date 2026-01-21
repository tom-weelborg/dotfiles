dir:
  if builtins.pathExists dir
  then builtins.readDir dir
  else {}