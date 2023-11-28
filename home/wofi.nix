{ pkgs, ... }; {
  
  programs.wofi = {
    enable = true;
    settings = {
      width = 500;
      height = 300;
      always_parse_args = true;
      show_all = false;
      print_command = true;
      insensitive = true;
    };

  };

  home.file.".config/wofi/style.css" = {
    text = ''
      window {
        margin: 5px;
        background-color: #002632;
        opacity: 1.0;
        font-size: 15px;
        font-family: JetBrainsMonoNL NF;
        border-radius: 10px;
        border: 5px solid #6c8b91;
      }

      #outer-box {
        margin: 5px;
        border: 5px;
        border-radius: 10px;
      }

      #input {
        margin: 5px;
        background-color: #00384d;
        color: #a1a19a;
        font-size: 15px;
        border: 5px;
        border-radius: 10px;
      }

      #inner-box {
        background-color: #002635;
        border: 5px;
        border-radius: 10px;
      }

      #scroll {
        font-size: 15px;
        color: #c43060;
        margin: 10px;
        border-radius: 5px;
      }

      #scroll label {
        margin: 0px 0px;
      }

      #entry {
        margin: 5px;
        background-color: #00384d;
        border-radius: 10px;
        border: 5px;
      }
      #entry:selected {
        background-color: #517f8d;
        border: 5px solid #6c8b91;
        border-radius: 10px;
        border: 5px;
      }

      #img {
        margin: 5px;
        border-radius: 5px;
      }

      #text {
        margin: 2px;
        border: none;
        color: #a1a19a;
      }
    '';
  };
}
