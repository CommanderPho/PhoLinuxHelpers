# KDE Plasma 5 Customizations/Configurations/Settings Backup

https://askubuntu.com/questions/98006/how-do-i-prevent-policykit-from-asking-for-a-password

sudo nano /etc/polkit-1/rules.d/50-nopasswd_global.rules


```javascript
[root@LNX00052 rules.d]# cat 50-nopasswd_global.rules 
polkit.addRule(function(action, subject) {
    if (subject.user === "halechr") {
        return polkit.Result.YES;
    }

    //if (subject.isInGroup("wheel")) {
    //    return polkit.Result.YES;
    //}
});
```


2023-11-15 - This seemed to fix the updating problem!
