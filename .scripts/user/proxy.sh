# Proxy Configuration

if [ -f $HOME/.proxy_credentials ] && [ -f $HOME/.proxy_server ]; then
  CREDENTIALS=$(<$HOME/.proxy_credentials)
  SERVER=$(<$HOME/.proxy_server)
  PROXY=http://$CREDENTIALS@$SERVER

  export http_proxy=$PROXY
  export https_proxy=$http_proxy

  function proxy {
    function enable {
      echo "Enabling proxy"
      export http_proxy=$PROXY
      export https_proxy=$PROXY
    }

    function disable {
      echo "Disabling proxy"
      unset http_proxy
      unset https_proxy
    }

    function toggle {
      if ((${#http_proxy} > 0)); then
        disable
      else
        enable
      fi
    }

    function status {
      if ((${#http_proxy} > 0)); then
        echo "Proxy is enabled"
      else
        echo "Proxy is disabled"
      fi
    }

    if [ "$#" -eq 0 ]; then
      toggle
    else
      case "$1" in
        enable)
          enable
          ;;

        start)
          enable
          ;;

        disable)
          disable
          ;;

        stop)
          disable
          ;;

        status)
          status
          ;;

        *)
          echo "Usage: $0 {enable|disable|status}"
          echo "\nIf provided no arguments, proxy is toggled."
      esac
    fi
  }
fi
