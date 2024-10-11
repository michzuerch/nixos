{
  pkgs,
  config,
  ...
}: {
  # Setup Env Variables
  environment.variables = {
    SPOTIFY_PATH = "${pkgs.spotify}/";
    JDK_PATH = "${pkgs.jdk}/";
    # NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";

    CI = "1";
    # environment.variables.CLIPBOARD_EDITOR = "hx";
    CLIPBOARD_NOAUDIO = "1";
    # environment.variables.CLIPBOARD_NOGUI = "1";
    # environment.variables.CLIPBOARD_NOPROGRESS = "1";
    # environment.variables.CLIPBOARD_NOREMOTE = "1";
    CLIPBOARD_SILENT = "1";

    OPENAI_API_KEY = "$cat(${config.sops.secrets.openai_api_key.path})";

    EMAIL = "michzuerch@gmail.com";
    NAME = "Michael Zuercher";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
