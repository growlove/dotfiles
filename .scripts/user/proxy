# Proxy Configuration

if [ -f $HOME/.proxy_credentials ]; then
  CREDENTIALS=$(<$HOME/.proxy_credentials)
  PROXY=http://$CREDENTIALS@proxy.kroger.com:3128

  export http_proxy=$PROXY
  export https_proxy=$http_proxy

  function proxy_toggle {
    if ((${#http_proxy} > 0)); then
      unset http_proxy
      unset https_proxy
    else
      export http_proxy=$PROXY
      export https_proxy=$PROXY
    fi
  }
fi
