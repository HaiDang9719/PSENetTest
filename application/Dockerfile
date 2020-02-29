# First, we define the base image of the container.
#
# Our example container is derived from nVidia's image
# 'tensorflow:18.06-py3', the code stands
# for container version 18.06 (nVidia's internal version number),
# which contains tensorflow set up for python3
#
FROM nvcr.io/nvidia/tensorflow:18.06-py3

#
# This is the maintainer of the container, referenced
# by e-Mail address.
#
MAINTAINER dang.mai@uni-konstanz.de

#
# This is the first line which tells us how this container
# differs from the base image.
#
# In this case, we copy the subdirectory "src" from
# the directory containing the Dockerfile into the
# directory "/application" of the container image.
#
COPY src /application

#
# Many COPY commands can be issued, as well as RUN
# commands which run commands inside the container, e.g.
# to install stuff.
#
# The following is just an example, it is not necessary for
# the application to run. The final container image will
# now contain the "nano" editor just in case you need it
# when logging into the container (yes, you can do this while it's
# running). You should always squeeze as many package
# installations as possible into one RUN command, as each one
# will generate a new intermediate container image.
#
# Note that COPY as well as RUN are executed with sudo
# privileges inside the container. Yes, this also means
# you can access anything on the host, that's why being
# a docker user is basically equivalent to being a sudo user
# on a system. When running on the Kubernetes cluster,
# container privileges are of course much more limited.
#
RUN apt-get update && apt-get install -y nano
RUN ["apt-get", "install", "-y", "libsm6", "libxext6", "libxrender-dev"]
COPY src/requirements.txt ./
RUN pip install -r requirements.txt

#
# this is what will be executed by default when the container is run
#
ENTRYPOINT [ "/application/run.sh" ]