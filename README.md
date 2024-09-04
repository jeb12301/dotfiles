# dotfiles

Apps: Guake, Stretchly, ticktick (?)

Use dnf instead of apt install

Install python dependencies and pyenv: https://stribny.name/blog/install-python-dev/

pip3 install speedtest-cli
speedtest-cli


# Jupyter Lab
See: pyenv, virtualenv and using them with Jupyter (Albert)

jupyter lab --generate-config # Create config then make jupyter open new window

dnf install fzf # Fuzzy Find


# zshenv setup

touch ~/.zshenv
echo "ZDOTDIR=~/.config/zsh" > ~/.zshenv

mkdir ~/.config/zsh
touch ~/.config/zsh/.zshrc


echo 'export PYENV_ROOT="$HOME/.pyenv"' > $ZDOTDIR/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' > $ZDOTDIR/.zshrc
echo 'eval "$(pyenv init -)"' > $ZDOTDIR/.zshrc

mkdir ~/.config/zsh/zsh_plugins



download cheat.sh

- Zathura
dnf install zathura
dnf install zathura-pdf-mupdf # Better than Poppler

- Vimtex
Change to let l:cmd  = 'GDK_BACKEND=x11 zathura' in autoload/vimtex/view/zathura.vim file
# Locate file by running find ~ -name zathura.vim 


- Hyprland
https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/

sudo dnf copr enable solopasha/hyprland 
sudo dnf install hyprland

dnf remove xdg-desktop-portal-kde --noautoremove


https://github.com/hwittenborn/celeste
https://github.com/TheAssassin/AppImageLauncher

https://chatboxai.app/



Wayland scaling like Zotero: https://rgoswami.me/posts/revisiting-wayland-2021-archlinux/#reference-management


# Texlive
/usr/share/texlive/texmf-dist/web2c/texmf.cnf
Change texmfhome to desired path

# Obsidian
custom callout blocks: https://www.reddit.com/r/ObsidianMD/comments/y64g3k/how_to_set_colors_of_callout_icons_with_custom_css/




# Some websites
# https://codeberg.org/tplasdio/lf-config


# Ansys
Download location in opt/lib/ansys (?)



# MATLAB
/home/song12301/Applications/MATLAB/R2024a/bin/


