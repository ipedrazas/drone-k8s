# Pull from base Ubuntu image
FROM ubuntu

# Do system updates and install dependencies
RUN apt-get update && apt-get -y upgrade && apt-get -y install git wget

# Download Drone.io
RUN wget http://downloads.drone.io/master/drone.deb
RUN dpkg -i drone.deb

# Expose the Drone.io port
EXPOSE 8080

ENV DRONE_SERVER_PORT 0.0.0.0:8080
ENV DRONE_DATABASE_DATASOURCE /var/lib/drone/drone.sqlite

# Define our GitHub oAuth keys below
ENV DRONE_GITHUB_CLIENT <CLIENT_TOKEN_HERE>
ENV DRONE_GITHUB_SECRET <CLIENT_SECRET_HERE>

# The command we'll be running when the container starts
CMD /usr/local/bin/droned
