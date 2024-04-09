{ pkgs, lib, ... }: {
  programs.starship = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      add_newline = true;

      format = lib.concatStrings [
        "$username"
        "$directory"
        "$git_branch"
        "$git_status"
        "$rust"
        "$golang"
        "$nodejs"
        "$bun"
        "$java"
        "$docker_context"
        "$sudo"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];

      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
          "Source" = " ";
        };
      };

      git_branch = {
        symbol = "";
        format = "[[ $symbol $branch ]]($style)";
      };

      git_status = {
        style = "bg:#689d6a";
        format = "[[($all_status$ahead_behind )](fg:#fbf1c7 bg:#689d6a)]($style)";
      };

	    nodejs = {
        symbol = "";
        style = "bg:#458588";
        format = "[[ $symbol ($version) ](fg:#fbf1c7 bg:#458588)]($style)";
      };

      bun = {
        symbol = "🍔";
        style = "bg:#458588";
        format = "[[ $symbol ($version) ](fg:#fbf1c7 bg:#458588)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#458588";
        format = "[[ $symbol ($version) ](fg:#fbf1c7 bg:#458588)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:#458588";
        format = "[[ $symbol ($version) ](fg:#fbf1c7 bg:#458588)]($style)";
      };

      cmd_duration = {
        min_time = 500;
        style = "bg:#3c3836";
        format = "[[  $duration ](bold fg:#fbf1c7 bg:#3c3836)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute Format
        style = "bg:#3c3836";
        format = "[[  $time ](fg:#fbf1c7 bg:#3c3836)]($style)";
      };

      sudo = {
        disabled = false;
        symbol = "";
        format = "[[ sudo $symbol ](fg:#fbf1c7 bg:#cc241d)]($style)";
        style = "bg:#cc241d";
      };

      character = {
        success_symbol = "[➜](bold green) ";
        error_symbol = "[✗](bold red) ";
      };

      line_break = {
        disabled = false;
      };
    };
  };
}
