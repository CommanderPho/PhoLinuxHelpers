# Managing dnf/yum repos:
https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/


Repos are located at `/etc/yum.repos.d/`, which is a regular directory containg files like:
```
[root@LNX00052 yum.repos.d]# ls
1password.repo              fedora-modular.repo          fedora-updates-testing-modular.repo   rpmfusion-nonfree.repo
anydesk.repo                fedora-nvidia.repo           fedora-updates-testing.repo           rpmfusion-nonfree-steam.repo
cuda-fedora37.repo          fedora.repo                  gh-cli.repo                           rpmfusion-nonfree-updates.repo
eugeny_tabby.repo           fedora-updates-modular.repo  google-chrome.repo                    rpmfusion-nonfree-updates-testing.repo
fedora-cisco-openh264.repo  fedora-updates.repo          rpmfusion-nonfree-nvidia-driver.repo  vscode.repo

```

You can just delete these files like normal (with sudo).
