{ variables, ... }:
{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ variables.username ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
