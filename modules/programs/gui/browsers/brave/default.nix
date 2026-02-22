{ variables, ... }:
{
  home-manager.users.${variables.username} = { ... }:
  {
    programs.brave = {
      enable = true;
      extensions = [
        { id = "oboonakemofpalcgghocfoadofidjkkk"; } # KeePassXC-Browser
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      ];
    };
  };
}
