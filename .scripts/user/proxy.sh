# Proxy Configuration

# Enable proxy command if .proxy_credentials
# and .proxy_server files exist.
if [ -f $HOME/.proxy_credentials ] && [ -f $HOME/.proxy_server ]; then
  CREDENTIALS=$(<$HOME/.proxy_credentials)
  SERVER=$(<$HOME/.proxy_server)
  PROXY=http://$CREDENTIALS@$SERVER

  proxy_location_check --silent

  function proxy {
    SILENT=false
    if [[ $@ == *"--silent"* ]]; then
      SILENT=true
    fi

    function enable {
      if ! [ "$SILENT" = true ]; then
        echo "Enabling proxy"
      fi
      export http_proxy=$PROXY
      export https_proxy=$PROXY
    }

    function disable {
      if ! [ "$SILENT" = true ]; then
        echo "Disabling proxy"
      fi
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
      proxy_location_check
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

        toggle)
          toggle
          ;;

        status)
          status
          ;;

        *)
          echo "Usage: $0 {enable|disable|toggle|status}"
          echo "\nIf provided no arguments, proxy is toggled."
      esac
    fi
  }
fi

# Automatically enable/disable proxy settings
# based on current network location and
# .proxy_locations file.
function proxy_location_check {
  if [ -f $HOME/.proxy_locations ]; then
    LOCATION=`networksetup -getcurrentlocation`
    grep -Fxq $LOCATION $HOME/.proxy_locations

    if [ "$?" -eq 0 ]; then
      proxy enable $@
    else
      proxy disable $@
    fi
  else
    proxy disable $@
  fi
}
