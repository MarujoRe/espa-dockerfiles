FROM centos:7.2.1511


MAINTAINER USGS LSRD http://eros.usgs.gov


LABEL description="CentOS with updated repo and python packages"


# Update the OS packages to the latest versions
RUN yum update -y \
    && yum clean metadata


# Required for additional tools installed later
RUN yum install -y \
        epel-release \
    && yum clean metadata


# Initial Python Configuration
RUN yum install -y \
        python-pip \
        python-devel \
    && pip install --upgrade pip \
    && yum clean metadata
