FROM centos:7
MAINTAINER Hiroaki Nakamura <hnakamur@gmail.com>

RUN yum install -y epel-release \
 && yum install -y mock rpmdevtools rpmbuild yum-utils diff patch sudo \
 && yum clean all \
 && useradd mockbuild \
 && usermod mockbuild -a -G mock \
 && mkdir /home/mockbuild/bin

ADD bin/ /home/mockbuild/bin/

RUN chmod +x /home/mockbuild/bin/* \
 && chown -R mockbuild:mockbuild /home/mockbuild/bin

USER mockbuild
RUN rpmdev-setuptree

VOLUME ["/var/lib/mock"]

USER root
CMD ["/bin/bash"]
