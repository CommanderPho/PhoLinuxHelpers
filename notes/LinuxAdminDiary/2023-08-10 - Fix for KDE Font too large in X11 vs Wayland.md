https://www.reddit.com/r/kde/comments/qr18sn/ui_scaling_is_too_large_in_x11_vs_wayland/


```
You may add the following to the /etc/sddm.conf
[X11]
ServerArguments=-dpi 96
```



# Solution
Modify `/etc/sddm.conf`    

```bash
# Arguments passed to the X server invocation
ServerArguments=-dpi 96 
```

