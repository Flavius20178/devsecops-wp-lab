FROM wordpress:latest

RUN apt-get update && apt-get upgrade -y && apt-get clean

RUN rm -rf /var/lib/apt/lists/*

USER www-data
