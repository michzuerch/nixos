{ pkgs, lib, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;

# [palettes.gruvbox_dark]
# color_fg0 = '#fbf1c7'
# color_bg1 = '#3c3836'
# color_bg3 = '#665c54'
# color_blue = '#458588'
# color_aqua = '#689d6a'
# color_green = '#98971a'
# color_orange = '#d65d0e'
# color_purple = '#b16286'
# color_red = '#cc241d'
# color_yellow = '#d79921'

      format = lib.concatStrings [

        "[](#d65d0e)"
        "[  ](bg:#d65d0e fg:#fbf1c7)"
        "$username"
        "[](bg:#d79921 fg:#d65d0e)"
        "$directory"
        "[](fg:#d79921 bg:#689d6a)"
        "$git_branch"
        "$git_status"
        "[](fg:#689d6a bg:#458588)"
        "$rust"
        "$golang"
        "$nodejs"
        "$bun"
        "$java"
        "[](fg:#458588 bg:#665c54)"
        "$docker_context"
        "[](fg:#665c54 bg:#3c3836)"
        "$cmd_duration"
        "[ ](fg:#3c3836)"
        "$sudo"
        "$line_break"
        "$character"
      ];

      directory = {
        style = "fg:#fbf1c7 bg:#d79921";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
	      };
      };

      git_branch = {
        symbol = "";
        style = "bg:#689d6a";
        format = "[[ $symbol $branch ](fg:#fbf1c7 bg:#689d6a)]($style)";
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
        symbol = " ";
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

      line_break = {
        disabled = false;
      };
    };
  };
}
