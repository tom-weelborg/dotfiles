{ variables, ... }:
{
  home-manager.users.${variables.username} = { ... }:
  {
    programs.vivaldi = {
      enable = true;
      extensions = [
        { id = "oboonakemofpalcgghocfoadofidjkkk"; } # KeePassXC-Browser
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      ];
    };
  };
}
