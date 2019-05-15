# Linux First Setup

I wrote this script to automize the installation of all the programs I use frequently and configure settings the way I like it.

## Installation
- Find what package manager your system uses (**apt**, **dnf**, (I will soon add support for **pacman**), ...)
  - For example if you are using Ubuntu you will need to select **apt**, if you are using Fedora you will need to select **dnf**.
- Copy and paste one of these command-lines to your terminal:
  - If your system uses **apt**:
```
git clone https://github.com/leofracca/start-linux-setup && cd linux-first-setup/apt/ && chmod +x install.sh && ./install.sh
```

  - - If your system uses **dnf**:
```
git clone https://github.com/leofracca/start-linux-setup && cd linux-first-setup/dnf/ && chmod +x install.sh && ./install.sh
```

## Additional information
I personally used this script  on Ubuntu and Fedora, where it works correctly. However, it could not fully work on other systems. If it doesn't work on your system contact me and I'll try to fix it.
## Contacts
- Telegram: https://t.me/Il_secco
- Mail: leonardofraccaroli1999@gmail.com
