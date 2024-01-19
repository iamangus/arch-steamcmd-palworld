FROM archlinux
#bump
RUN \
  # Enable multilib
  printf "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist">> /etc/pacman.conf && \
  # update
  pacman -Syyu --noconfirm && \
  # install packages
  pacman -S --noconfirm glibc lib32-glibc git vi xorg-server-xvfb sudo base-devel xdg-user-dirs && \
  # create steam user
  useradd -m steam  && \
  # remove password
  passwd -d steam  && \
  # add steam user to wheel
  usermod -aG wheel steam && \
  # wheel stuff
  echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

COPY entrypoint.sh /home/steam/entrypoint.sh

RUN \
  chmod +x /home/steam/entrypoint.sh && \
  chown steam:steam /home/steam/entrypoint.sh

USER 1000
ENV USER=steam
WORKDIR /home/steam

RUN \
  #install steamcmd
  git clone https://aur.archlinux.org/steamcmd.git && \
  cd steamcmd  && \
  makepkg -si --noconfirm && \
  #initial steamcmd configuration
  steamcmd +quit

ENTRYPOINT ["/home/steam/entrypoint.sh"]
EXPOSE 8221