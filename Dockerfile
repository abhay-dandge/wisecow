FROM ubuntu

# Install dependencies at build time
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay -y
RUN apt install netcat-openbsd -y

COPY wisecow.sh /wisecow.sh
RUN cp /usr/games/fortune /usr/bin/fortune && cp /usr/games/cowsay /usr/bin/cowsay

# Expose your app port
EXPOSE 4499

# Run the script as default command
CMD ["/wisecow.sh"]

