Pasting Issue: Extraneous Characters ('^[[200~') before and after pasted content
Status: solved

# Copied Text:
```
https://github.com/CommanderPho/PhoGlobusHelpers.git
```

Pasted with [Ctrl]+[Shift]+[v] into VSCode terminal or Konsole, seems mostly independent of the app.


# Result Text:
```
^[[200~https://github.com/CommanderPho/PhoGlobusHelpers.git~^C
```

# Info
https://superuser.com/questions/1532688/pasting-required-text-into-terminal-emulator-results-in-200required-text
https://www.reddit.com/r/xfce/comments/p8c6vk/disable_200_when_accidentally_pressing_ctrlv_when/
https://superuser.com/questions/1495850/cant-get-rid-of-extra-characters-from-bracketed-paste-when-pasting-in-terminal

# Conclusion
The unexpected extra characters come from a feature called "Bracketed Paste" that is triggered by accidentially pressing [Ctrl]+[v] (the usual paste command on other platforms). Then, when pressing the correct paste command for linux ([Ctrl]+[Shift]+[v]) the pasted control characters are treated literally and pasted as well.


bind 'set enable-bracketed-paste off'

# Solution

Add the following to `~/.bashrc`
```bash
if [[ $- == *i* ]]; then
    bind 'set enable-bracketed-paste off'
fi
```

