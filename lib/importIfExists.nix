{ path, default ? {} }:
  if builtins.pathExists path
  then import path
  else default