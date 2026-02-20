#!/bin/bash
set -e

ORANGE="$(tput setaf 214)"
RED="$(tput setaf 196)"
YELLOW="$(tput setaf 184)"
GREEN="$(tput setaf 46)"
BLUE="$(tput setaf 87)"
RESET="$(tput sgr0)"

echo -e "${BLUE}Do you want to setup Secure Boot? (y/n)${RESET}"
read -r confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo -e "${YELLOW}Canceled. Secure Boot setup aborted.${RESET}"
    exit 0
fi

install_packages() {
    echo -e "${BLUE}Installing required packages...${RESET}"
    sudo pacman -S --needed --noconfirm sbctl efitools sbsigntools wget findutils
}

create_keys() {
    sudo sbctl create-keys || true
}

install_hooks() {
    echo -e "${BLUE}Installing pacman signing hooks...${RESET}"
    sudo mkdir -p /etc/pacman.d/hooks

    # Kernel signing hook
    sudo tee /etc/pacman.d/hooks/95-sbctl-kernel-sign.hook >/dev/null <<'EOF'
[Trigger]
Type = Path
Operation = Install
Operation = Upgrade
Target = usr/lib/modules/*/vmlinuz

[Action]
Description = Signing kernel with sbctl...
When = PostTransaction
Exec = /usr/bin/sbctl sign -s %n
EOF
    echo -e "${GREEN}✓ Kernel signing hook installed${RESET}"

    # Windows signing hook
    sudo tee /etc/pacman.d/hooks/95-sbctl-windows.hook >/dev/null <<'EOF'
[Trigger]
Type = Path
Operation = Install
Operation = Upgrade
Target = boot/EFI/Microsoft/Boot/*.efi

[Action]
Description = Signing Windows EFI binaries with sbctl...
When = PostTransaction
Exec = /usr/bin/find /boot/EFI/Microsoft/Boot -name '*.efi' -exec /usr/bin/sbctl sign -s {} \;
EOF
    echo -e "${GREEN}✓ Windows EFI signing hook installed${RESET}"

    # systemd-boot signing hook
    sudo tee /etc/pacman.d/hooks/95-sbctl-systemd-boot-sign.hook >/dev/null <<'EOF'
[Trigger]
Type = Path
Operation = Install
Operation = Upgrade
Target = boot/EFI/systemd/systemd-bootx64.efi

[Action]
Description = Signing systemd-boot with sbctl...
When = PostTransaction
Exec = /usr/bin/sbctl sign -s /boot/EFI/systemd/systemd-bootx64.efi
EOF
    echo -e "${GREEN}✓ systemd-boot signing hook installed${RESET}"
}

initial_signing() {
    echo -e "${BLUE}Performing initial manual signing...${RESET}"

    echo -e "${YELLOW}→ Signing kernels...${RESET}"
    for k in /boot/vmlinuz-*; do
        [[ -f "$k" ]] && sudo sbctl sign -s "$k"
    done

    echo -e "${YELLOW}→ Signing systemd-boot...${RESET}"
    sudo sbctl sign -s /boot/EFI/systemd/systemd-bootx64.efi || true

    echo -e "${YELLOW}→ Signing Windows EFI files...${RESET}"
    sudo find /boot/EFI/Microsoft/Boot -name '*.efi' -exec sudo sbctl sign -s {} \;

    echo -e "${YELLOW}→ Signing BOOTX64.EFI (if exists)...${RESET}"
    if [[ -f /boot/EFI/BOOT/BOOTX64.EFI ]]; then
        sudo sbctl sign -s /boot/EFI/BOOT/BOOTX64.EFI
    fi

    echo -e "${YELLOW}→ Signing shellx64.efi (if exists)...${RESET}"
    if [[ -f /boot/shellx64.efi ]]; then
        sudo sbctl sign -s /boot/shellx64.efi
    fi
}

enroll_keys() {
    echo -e "${BLUE}Enrolling Secure Boot keys into firmware...${RESET}"
    sudo sbctl enroll-keys
}

install_packages
create_keys
install_hooks
initial_signing
enroll_keys

echo -e "${GREEN} Secure Boot Setup Completed Successfully! ${RESET}"
echo -e "${YELLOW}Next step (REQUIRED):${RESET}"
echo -e "${BLUE}Reboot → Enter BIOS → Enable Secure Boot (Custom Mode)${RESET}"
echo
