
### suppress no save shutdown bubble
get rid of "Chromium wurde nicht richtig beendet" after power loss:

Shut down Chromium gracefully
saved `~/.config/chromium/Default/Preferences`
to `ChromiumPreferences` in repository to preserve these two variables

    "exit_type": "Normal"
    "exited_cleanly": true

and copy this backup to its original location before starting Chromium
