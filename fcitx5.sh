sudo sed -i 's|^Exec=/usr/bin/microsoft-edge-stable\(.*\)|Exec=/usr/bin/microsoft-edge-stable --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime\1|' /usr/share/applications/com.microsoft.Edge.desktop

sudo sed -i 's|^Exec=/usr/bin/discord\(.*\)|Exec=/usr/bin/discord --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime\1|' /opt/discord/discord.desktop
