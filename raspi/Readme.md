## Installation
- Install Raspbian on the raspi
- do the initial setup of Raspbian
  - set a password for the user `pi` and document it via `sudo raspi-config`
  - configure wireless lan via editing `/etc/wpa_supplicant/wpa_supplicant.conf`
  - enable VNC service, so that you can maintain it remotly via `sudo raspi-config`
  - enable SSH service for the same reason via `sudo raspi-config`
- clone this repository with https, so that others don't access your github commit by a saved token. You will be asked for your github password at every git operation you perform. The project has to be in /home/pi/monitoring-display, so that the paths in scripts match.
    `git clone https://<your github name>@github.com/actano/monitoring-display.git`
- call `/home/pi/monitoring-display/raspi/bin/installStatusMonitor.sh`
    
## How does it work
All scripting is executed in the context of the standard `pi` user.

### autostart Chromium
- in `~/.config/lxsession/LXDE-pi/autostart` apps can be started on bootup and the usual window-manager will be disabled.
- the installation will create a call to the script `raspi/bin/startChromium.sh` in this project.

### Suppress "Chromium terminated without shutdown" bubble
To get rid of the "Chromium wurde nicht richtig beendet" bubble after power loss:

- Shut down Chromium gracefully
- save `~/.config/chromium/Default/Preferences` to preserve these two variables

        "exit_type": "Normal"
        "exited_cleanly": true

- copy this backup to its original location before starting Chromium
- Commandline switches were not working, removing write access for user pi did't do the job either. Maybe changing ownership also works?

### Hide mouse cursor
To hide the mouse cursor, a tool called 'unclutter' is used. It is installed by the install script and called by the chromium start script.
