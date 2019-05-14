# Start Linux Setup

I wrote this script for automize the installation of all the programs I used frequently and configure settings in my way.

## Installation
- First clone the repository:
```
git clone https://github.com/LeoFracca/Start-Linux-Setup
```

- Then, move into the directory:
```
cd Start\ Linux\ Setup/
```

- Now you have to know if you use **apt** or **dnf** (soon I will add the support to **pacman**).
  - For example if you use Ubuntu you need to select **apt**, if you use Fedora you need to select **dnf**.

- So, move into the correct directory (apt/ or dnf/):
```
cd apt/
```
  if you use apt, or
```
cd dnf/
```
  if you use dnf.
  
- Now you have to make the file executable:
```
chmod +x start_linux_setup.sh
```

- Then run the script with
```
./start_linux_setup.sh
```
