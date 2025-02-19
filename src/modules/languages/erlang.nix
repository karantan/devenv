{ pkgs, config, lib, ... }:

let
  cfg = config.languages.erlang;
in
{
  options.languages.erlang = {
    enable = lib.mkEnableOption "Enable tools for Erlang development.";

    package = lib.mkOption {
      type = lib.types.package;
      description = "Which package of Erlang to use";
      default = pkgs.erlang;
      defaultText = "pkgs.erlang";
    };
  };

  config = lib.mkIf cfg.enable
    {
      packages = with pkgs; [
        cfg.package
        erlang-ls
      ];

      enterShell = ''
      '';
    };
}
