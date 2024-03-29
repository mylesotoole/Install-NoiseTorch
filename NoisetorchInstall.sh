#!/usr/bin/sh

# Change to downloads directory
cd $HOME/Downloads

# Download the latest release from GitHub
wget https://github.com/noisetorch/NoiseTorch/releases/download/v0.12.2/NoiseTorch_x64_v0.12.2.tgz

# Unpack the tgz file, into your home directory
tar -C $HOME -h -xzf NoiseTorch_x64_v0.12.2.tgz

# Remove the archive
rm -f NoiseTorch_x64_v0.12.2.tgz

# Refresh icon cache
gtk-update-icon-cache

# Give it the required permissions
sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch

# Make sure that is in your PATH
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Start on login 
echo "[Desktop Entry]
Type=Application
Name=Enable Noisetorch
Comment=Enables noisetorch's virtual microphone 
Exec=noisetorch -i
StartupNotify=false
Terminal=false" >> ~/.local/share/applications/noisetorch_startup.desktop
mkdir ~/.config/autostart
cp ~/.local/share/applications/noisetorch_startup.desktop ~/.config/autostart/
