# Dockerfile for building LogicTech Media Server on CentOS 6
# John Tarlton
#
FROM centos:centos6

MAINTAINER JTarlton 

RUN yum -y update \
 && yum -y install epel-release \
 perl \
 perl-Time-HiRes \
 perl-DBI \
 perl-JSON-XS \
 perl-XML-Parser \
 perl-HTML-Parser \
 perl-Digest-SHA1 \
 perl-YAML-LibYAML \
 perl-Sub-Name \
 perl-EV \
 perl-CGI

RUN rpm -Uvh http://downloads.slimdevices.com/LogitechMediaServer_v7.8.0/logitechmediaserver-7.8.0-1.noarch.rpm

# Ports: 3483 control, 3483/udp discovery, 9000 web ui, 9090 cli.
EXPOSE 3483 3483/udp 9000 9090

USER squeezeboxserver
ENV LANG en_GB.utf8

CMD ["perl", \
     "-I", "/usr/lib/perl5/vendor_perl", \
     "/usr/libexec/squeezeboxserver", \
     "--prefsdir=/data/prefs", \
     "--logdir=/var/log/squeezeboxserver", \
     "--cachedir=/data/cache", \
     "--charset=utf8" \
]

# EOF
