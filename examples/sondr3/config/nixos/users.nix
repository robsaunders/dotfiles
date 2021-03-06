{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sondre = {
    isNormalUser = true;
    description = "Sondre Nilsen";
    extraGroups = [ "wheel" "networkmanager" "docker" "fuse" ];
    shell = pkgs.fish;
  };

  home-manager.users.sondre = { pkgs, ... }: {
    nixpkgs.overlays = [ (import ../pkgs) ];
    imports = [
      # Import all home configurations
      ../home
    ];
  };
}
