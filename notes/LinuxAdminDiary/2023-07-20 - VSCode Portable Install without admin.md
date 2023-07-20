# Installing VSCode on Linux without `sudo`

https://stackoverflow.com/questions/63974747/install-vscode-as-a-non-root-user-on-a-linux-distribution

```bash
cd ~/Downloads
wget --user-agent=Mozilla --content-disposition -E -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
tar -xzf code-stable-x64-1686734446.tar.gz 
mv VSCode-linux-x64 ~/bin/
chmod +x code code-tunnel 
# Make symlinks in the ~/bin folder which should be on the path
ln -s -t ~/bin/ '~/bin/VSCode-linux-x64/bin/code' '~/bin/VSCode-linux-x64/bin/code-tunnel'

./code --no-sandbox

```