# Monitoring display

We are using Kibana to look at production logs and dashboards. Kibana is protected by basic auth.
To authenticate against Kibana we are using Firefox with an Extension which sets basic auth headers.
This is currently set up on a macOS system.

## Setup of a new OSX system

### Create admin user

The credentials of the macmini admin user and the static ip of the system are stored in vault. In case you are creating new credentials, update them in vault.

```
vault read secret/rplanx/macmini-kibana
```

### System setup
* System preferences -> Sharing -> Enable Remote Management
* System preferences -> Energy Saver -> Schedule... -> Start up weekdays at 8:30, Shut Down weekdays at 18:20
* Install Firefox
* System preferences -> Users & Groups -> Login Items -> Add Firefox
* System preferences -> Network -> Wi-Fi -> Advanced -> TCP/IP -> Configure IPv4 -> Using DHCP with manual address
* System preferences -> Network -> Wi-Fi -> Advanced -> TCP/IP -> IPv4 Address -> Use address from vault or enter new address and update vault

### Firefox setup
* Copy `index.html` of this repository onto mac
* Get URL of dashboard and copy into `<meta>` tag
* Point Firefox homepage to index.html file
* Install [AutoFullscreen Add-on](https://addons.mozilla.org/en-US/firefox/addon/autofullscreen/)
* Install [ModHeader Add-on](https://addons.mozilla.org/en-US/firefox/addon/modheader-firefox/)
* Configure ModHeader:
    * Get basic auth token
    ```
    echo -n "$(vault read -field username secret/rplanx/elastic-cloud/kibana-viewer):$(vault read -field password secret/rplanx/elastic-cloud/kibana-viewer)" | base64
    ```
    * Request Headers: `Authorization`: `Basic <token>`
    * Filters: URL Pattern: `<URL from index.html>`
