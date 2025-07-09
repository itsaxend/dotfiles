#!/bin/bash

ORANGE="$(tput setaf 214)"
WARNING="$(tput setaf 196)"
YELLOW="$(tput setaf 184)"
GREEN="$(tput setaf 46)"
SKY_BLUE="$(tput setaf 87)"
RESET="$(tput sgr0)"

set -e

# define apps and commands
declare -A apps
apps["Microsoft Edge"]="sudo sed -i 's|^Exec=/usr/bin/microsoft-edge-stable\(.*\)|Exec=/usr/bin/microsoft-edge-stable --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime\1|' /usr/share/applications/com.microsoft.Edge.desktop; sudo sed -i 's|^Exec=/usr/bin/microsoft-edge-stable\(.*\)|Exec=/usr/bin/microsoft-edge-stable --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime\1|' /usr/share/applications/microsoft-edge.desktop"
apps["Discord"]="sudo sed -i 's|^Exec=/usr/bin/discord\(.*\)|Exec=/usr/bin/discord --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime\1|' /opt/discord/discord.desktop"

# convert keys to array
app_names=("${!apps[@]}")

# menu
echo "${SKY_BLUE}Select applications to apply Wayland IME fix:${RESET}"
for i in "${!app_names[@]}"; do
    printf "${YELLOW}%2d. %s\n" $((i+1)) "${app_names[$i]}${RESET}"
done

# parse input
read -p "${SKY_BLUE}Enter numbers (e.g. 1,3 or 1-2): ${RESET}" input
parse_selection() {
    local selection=()
    IFS=',' read -ra parts <<< "$1"
    for part in "${parts[@]}"; do
        if [[ "$part" =~ ^[0-9]+$ ]]; then
            selection+=("$part")
        elif [[ "$part" =~ ^([0-9]+)-([0-9]+)$ ]]; then
            for ((i=${BASH_REMATCH[1]}; i<=${BASH_REMATCH[2]}; i++)); do
                selection+=("$i")
            done
        fi
    done
    echo "${selection[@]}"
}

# apply selected commands
selected_indices=($(parse_selection "$input"))
for index in "${selected_indices[@]}"; do
    app_index=$((index-1))
    if [[ $app_index -ge 0 && $app_index -lt ${#app_names[@]} ]]; then
        app="${app_names[$app_index]}"
        echo "${GREEN}Applying fix to $app...${RESET}"
        eval "${apps[$app]}"
    else
        echo "${WARNING}Invalid selection: $index${RESET}"
    fi
done
