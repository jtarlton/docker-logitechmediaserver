# Dockerfile for building LogicTech Media Server data volumes. 
# These are used to persist server settings.
#
# John Tarlton
#
# docker build --tag="jtarlton/logitechmediaserver-data" .
# docker run --name lms-data -t jtarlton/logitechmediaserver-data true
#
FROM busybox

MAINTAINER John Tarlton 

RUN mkdir /data
RUN chmod 755 /data
RUN mkdir /data/prefs
RUN mkdir /data/cache
RUN mkdir /data/playlists

# Set ownership as the squeezeboxserver process runs as its own user and not as root.
# Currently Docker does not provide a proper way of doing this.
# 499 is the uid/gid  for the squeezeboxserver user in the logitechmediaserver container.

RUN chown -R 499.499 /data

# Expose as VOLUMEs 

VOLUME ["/data/prefs", \
        "/data/cache", \
        "/data/playlists" \
]

