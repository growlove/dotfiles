# Proxy Configuration Tool

#
# main
#
# Runs the proxy command. Executed at end of file so
# that command is always run when file is sourced.
#
function main {
  proxy "$@"
}

#
# _set_proxy_vars
#
# Reads through the .proxy file line by line and looks
# for expected variables, setting the corresponding
# environment variables for each.
#
# The expected file format looks like the following:
#
# user: MyUsername
# password: MyPassword
# server: proxy.mydomain.com:3000
# locations: VPN Network
#
# user, password, and server are all required settings.
# locations is an optional setting.
#
# If any of the required settings are missing, prints an
# error message and stops execution.
#
function _set_proxy_vars {
  # unset proxy variables
  unset PROXY_USER; unset PROXY_PASSWORD
  unset PROXY_URL; unset PROXY_PORT
  unset PROXY_NETWORK_LOCATIONS
  unset RETURN;

  # read proxy settings from file
  # and set corresponding env vars
  file="$HOME/.proxy"
  while IFS= read line
  do
    if [[ $line == "user:"* ]]; then
      PROXY_USER=${line#user: *}
    fi

    if [[ $line == "password:"* ]]; then
      PROXY_PASSWORD=${line#password: *}
    fi

    if [[ $line == "server:"* ]]; then
      PROXY_URL=${${line#server: *}%:*}
      PROXY_PORT=${${line#server:*:}}
    fi

    if [[ $line == "locations:"* ]]; then
      PROXY_NETWORK_LOCATIONS=${line#locations: *}
    fi
  done < "$file"
  unset file

  if [ -z ${PROXY_USER+x} ]; then
    echo ".proxy file missing username setting"
    echo "Username must be set in .proxy file in the following format:"
    echo "user:username"
    RETURN=1
  fi

  if [ -z ${PROXY_PASSWORD+x} ]; then
    echo ".proxy file missing password setting"
    echo "Password must be set in .proxy file in the following format:"
    echo "password:password"
    RETURN=1
  fi

  if [ -z ${PROXY_URL+x} ] || [ -z ${PROXY_PORT+x} ]; then
    echo ".proxy: missing or incorrect configured proxy server setting"
    echo "Server and port must be set in .proxy file in the following format:"
    echo "server:url:port"
    RETURN=1
  fi

  if [[ $RETURN -ne 1 ]]; then
    PROXY=http://$PROXY_USER:$PROXY_PASSWORD@$PROXY_URL:$PROXY_PORT
  else
    unset PROXY
  fi
  unset RETURN
}

#
# _proxy_location_check
#
# *MACOS ONLY*
#
# Compares the current network location with the
# locations specified in .proxy. If the current
# location matches one of the specified locations,
# return 0. If the current location doesn't match
# or system isn't MacOS, return 1.
#
function _proxy_location_check {
  if command_exists networksetup; then
    if [[ -v PROXY_NETWORK_LOCATIONS ]]; then
      local current=`networksetup -getcurrentlocation`
      if [[ $PROXY_NETWORK_LOCATIONS =~ .*$current.* ]]; then
        return 0
      fi
    fi
  fi
  return 1
}

#
# _proxy_enable
#
# Runs _set_proxy_vars and then sets the http_proxy
# and https_proxy environment variables. If SILENT
# environment variable is true, does not show output.
#
function _proxy_enable {
  if ! [ "$SILENT" = true ]; then
    echo "Enabling proxy"
  fi
  _set_proxy_vars
  export http_proxy=$PROXY
  export https_proxy=$PROXY
}

#
# _proxy_disable
#
# Unsets the http_proxy and https_proxy environment
# variables. If SILENT environment variable is true,
# does not show output.
#
function _proxy_disable {
  if ! [ "$SILENT" = true ]; then
    echo "Disabling proxy"
  fi
  unset http_proxy
  unset https_proxy
}

#
# _proxy_toggle
#
# Checks if http_proxy environment variable is
# currently set. Disable proxy if so and enable
# proxy if not.
#
function _proxy_toggle {
  if ((${#http_proxy} > 0)); then
    _proxy_disable
  else
    _proxy_enable
  fi
}

#
# _proxy_status
#
# Checks if http_proxy environment variable is
# currently set and echo the status.
#
function _proxy_status {
  if ((${#http_proxy} > 0)); then
    echo "Proxy enabled"
  else
    echo "Proxy disabled"
  fi
}

#
# _proxy_usage
#
# Prints minimal usage information.
#
function _proxy_usage {
  echo "Usage: $1 {enable|disable|toggle|status|help}\n"
  echo "Options:"
  echo "--silent    Disables terminal output for commands\n"
  echo "If provided no arguments, proxy is set based on network location."
  echo "For more detailed instructions, use '$1 help'."
}

#
# _proxy_help
#
# Similar to _proxy_usage, but also prints information
# related to correctly configuring the .proxy file.
#
function _proxy_help {
  echo "Usage: $1 {enable|disable|toggle|status|help}\n"
  echo "Options:"
  echo "--silent    Disables terminal output for commands\n"
  echo "If provided no arguments, proxy is set based on network location.\n"
  echo ".proxy file format:"
  echo "user:<username>"
  echo "password:<password>"
  echo "server:<url>:<port>"
  echo "locations:<location 1> <location 2>"
}

#
# proxy
#
# The main public function of the system.
#
# Handles a few responsibilities:
#
# 1) Runs _set_proxy_vars to ensure proxy environment
# variables are set.
# 2) Checks for the silent option in command line args,
# and sets the corresponding environment variable.
# 3) If no options are passed to the command, it
# enables or disables the http_proxy and https_proxy
# environments variables based on the current MacOS
# network location and the .proxy locations setting.
# 4) If options are passed to the command, it routes
# them to the corresponding function. If unknown option
# is passed, it runs _proxy_usage.
#
function proxy {
  _set_proxy_vars

  SILENT=false
  if [[ "$@" == *"--silent"* ]]; then
    SILENT=true
  fi

  if [ "$#" -eq 0 ]; then
    SILENT=true
    _proxy_location_check
    if [ "$?" -eq 0 ]; then
      _proxy_enable
    else
      _proxy_disable
    fi
  else
    case "$1" in
      enable)
        _proxy_enable
        ;;

      disable)
        _proxy_disable
        ;;

      toggle)
        _proxy_toggle
        ;;

      status)
        _proxy_status
        ;;

      help)
        _proxy_help "$0"
        ;;

      *)
        _proxy_usage "$0"
    esac
  fi

  unset SILENT
}

# Always run main when file is sourced.
main "$@"

