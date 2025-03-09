# Use the Ubuntu 16:04 base image
FROM ubuntu:16.04

# Avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install SSH server
RUN apt-get update && \
    apt install -y ubuntu-desktop 

RUN apt install -y \ 
        tightvncserver \
        gnome-panel \ 
        gnome-settings-daemon \ 
        metacity \ 
        nautilus \ 
        gnome-terminal 

# Add a new user 'dockeruser' and set a password
RUN useradd -m -s /bin/bash dockeruser && \
    echo 'dockeruser:secretpassword' | chpasswd

EXPOSE 1
EXPOSE 5901

COPY xstartup /home/dockeruser/.vnc/xstartup
COPY start-vncserver.sh /home/dockeruser/start-vncserver.sh

RUN chmod a+x /home/dockeruser/.vnc/xstartup \
    && chmod a+x /home/dockeruser/start-vncserver.sh \
    && chmod go-rwx /home/dockeruser/.vnc \
    && touch /home/dockeruser/.Xauthority \
    && chown -R dockeruser:dockeruser /home/dockeruser/ 

# && touch /home/dockeruser/.vnc/passwd \
# && /bin/bash -c "echo -e 'password\npassword\nn' | vncpasswd" > /home/dockeruser/.vnc/passwd \
# && chmod 400 /home/dockeruser/.vnc/passwd \    
USER dockeruser
WORKDIR /home/dockeruser
ENV USER=dockeruser

# Run the SSH server    
#CMD ["/usr/sbin/sshd", "-D"]
#CMD sh -c "echo 'Inside Container:' && echo 'User: $(whoami) UID: $(id -u) GID: $(id -g)'"
CMD [ "./start-vncserver.sh"]