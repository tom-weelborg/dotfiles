{
  discoverHosts = import ./discoverHosts.nix;
  discoverModules = import ./discoverModules.nix;
  importIfExists = import ./importIfExists.nix;
  readDirIfExists = import ./readDirIfExists.nix;
}