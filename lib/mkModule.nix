{ lib, users }:
let
  mkModuleOptionsForUsers = options:
    builtins.listToAttrs (
      builtins.map
        (username: lib.nameValuePair username options)
        users
    )
  ;

  mkSystemModuleOptions = options: options;

  mkUserModuleOptions = mkModuleOptionsForUsers;

  mkHomeManagerModuleOptions = mkModuleOptionsForUsers;

  mkModuleConfigForUsers = { mkCfg, mkConfig, wrapConfig }:
    lib.mkMerge (
      builtins.map
        (username:
          wrapConfig
            (mkConfig {
              cfg = mkCfg username;
              inherit username;
            })
            username
        )
        users
    );

  mkSystemModuleConfig = { config, mkCfg, mkConfig }: mkConfig {
    cfg = mkCfg null;
  };

  mkUserModuleConfig = { config, mkCfg, mkConfig }: mkModuleConfigForUsers {
    inherit
      mkCfg
      mkConfig
      ;
    wrapConfig = c: username: c;
  };

  mkHomeManagerModuleConfig = { config, mkCfg, mkConfig }: mkModuleConfigForUsers {
    inherit
      mkCfg
      mkConfig
      ;
    wrapConfig = c: username:
      lib.mkIf config.modules.system.home-manager.homeManagerModule.${username}.enable
      {
        home-manager.users.${username} = c;
      };
  };

  mkModule =
    {
      modulePath ? [],
      systemModule ? {
        options = {};
        mkConfig = { cfg }: {};
      },
      userModule ? {
        options = {};
        mkConfig = { cfg, username }: {};
      },
      homeManagerModule ? {
        options = {};
        mkConfig = { cfg, username }: homeManagerArgs: {};
      }
    }:
    { config, ... }@nixosArgs:
    let
      modulePathWithPrefix = [ "modules" ] ++ modulePath;

      options = lib.setAttrByPath modulePathWithPrefix {
        systemModule = mkSystemModuleOptions systemModule.options;
        userModule = mkUserModuleOptions userModule.options;
        homeManagerModule = mkHomeManagerModuleOptions homeManagerModule.options;
      };

      cfg = lib.getAttrFromPath modulePathWithPrefix config;
      mkSystemModuleCfg = _: cfg.systemModule;
      mkUserModuleCfg = username: cfg.userModule.${username};
      mkHomeManagerModuleCfg = username: cfg.homeManagerModule.${username};
    in
    {
      options = options;

      config = lib.mkMerge [
        (mkSystemModuleConfig {
          inherit config;
          mkCfg = mkSystemModuleCfg;
          mkConfig = systemModule.mkConfig;
        })
        (mkUserModuleConfig {
          inherit config;
          mkCfg = mkUserModuleCfg;
          mkConfig = userModule.mkConfig;
        })
        (mkHomeManagerModuleConfig {
          inherit config;
          mkCfg = mkHomeManagerModuleCfg;
          mkConfig = homeManagerModule.mkConfig;
        })
      ];
    };
in
mkModule
