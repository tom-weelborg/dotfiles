let
  username = "tom";
  displayname = "Tom";
in
{
  inherit
    username
    displayname
    ;

  git.name = "Tom Weelborg";
  git.email = "135610355+tom-weelborg@users.noreply.github.com";

  vpnDir = /home/${username}/vpn;
}