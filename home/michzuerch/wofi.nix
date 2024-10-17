{ pkgs, ... }: {
  programs.wofi = {
    enable = true;
    # settings = {
    #   width = 800;
    #   height = 400;
    #   mode = "drun";
    #   filter-rate = 100;
    #   allow-images = true;
    # };

    settings = {
      image_size = 48;
      columns = 3;
      allow_images = true;
      insensitive = true;
      run-always_parse_args = true;
      run-cache_file = "/dev/null";
      run-exec_search = true;
      matching = "multi-contains";
    };

    style = ''
      window {
      margin: 0px;
      border: 1px solid #bd93f9;
      background-color: #282a36;
      }

      #input {
      margin: 5px;
      border: none;
      color: #f8f8f2;
      background-color: #44475a;
      }

      #inner-box {
      margin: 5px;
      border: none;
      background-color: #282a36;
      }

      #outer-box {
      margin: 5px;
      border: none;
      background-color: #282a36;
      }

      #scroll {
      margin: 0px;
      border: none;
      }

      #text {
      margin: 5px;
      border: none;
      color: #f8f8f2;
      }

      #entry.activatable #text {
      color: #282a36;
      }

      #entry > * {
      color: #f8f8f2;
      }

      #entry:selected {
      background-color: #44475a;
      }

      #entry:selected #text {
      font-weight: bold;
      }
    '';
  };
}
