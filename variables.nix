let
  username = "tom";
  displayname = "Tom";
in
{
  inherit
    username
    displayname
    ;

  vpnDir = /home/${username}/vpn;
}