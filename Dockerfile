FROM ubuntu:18.04 as intermediate

###############################################################################################
MAINTAINER Ivan E. Cao-Berg <icaoberg@alumni.cmu.edu>
LABEL Description="Ubuntu 18.04 + MATLAB MCR 2019b"
LABEL Vendor="Computational Biology Department at Carnegie Mellon University"
LABEL Web="http://linus.cbd.cs.cmu.edu"
LABEL Version="2019b"
###############################################################################################

###############################################################################################
# UPDATE OS AND INSTALL TOOLS
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update && apt-get -qq install -y --no-install-recommends apt-utils
RUN apt-get install -qq -y build-essential git \
    unzip \
    xorg \
    wget \
    tree \
    curl
RUN apt-get upgrade -qq -y
###############################################################################################

###############################################################################################
# INSTALL MATLAB MCR 2017A
USER root
RUN echo "Downloading Matlab MCR 2019b"
RUN mkdir /mcr-install && \
    mkdir /opt/mcr
RUN cd /mcr-install && \
    wget -nc --quiet http://ssd.mathworks.com/supportfiles/downloads/R2019b/Release/0/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2019b_glnxa64.zip && \
    cd /mcr-install && \
    echo "Unzipping container" && \
    unzip -q MATLAB_Runtime_R2019b_glnxa64.zip && \
    ./install -destinationFolder /opt/mcr -agreeToLicense yes -mode silent && \
    cd / && \
    echo "Removing temporary files" && \
    rm -rf mcr-install
###############################################################################################

###############################################################################################
FROM ubuntu:18.04
COPY --from=intermediate /opt/mcr /opt/mcr
###############################################################################################

###############################################################################################
# CONFIGURE ENVIRONMENT VARIABLES FOR MCR
RUN mv -v /opt/mcr/v97/sys/os/glnxa64/libstdc++.so.6 /opt/mcr/v97/sys/os/glnxa64/libstdc++.so.6.old
ENV LD_LIBRARY_PATH /opt/mcr/v97/runtime/glnxa64:/opt/mcr/v97/bin/glnxa64:/opt/mcr/v97/sys/os/glnxa64
ENV XAPPLRESDIR /opt/mcr/v97/X11/app-defaults
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update && apt-get install --qq -y --no-install-recommends apt-utils
RUN apt-get install -qq -y wget --quiet
###############################################################################################

###############################################################################################
# CONFIGURE ENVIRONMENT
ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/bash
ENV USERNAME murphylab
ENV UID 1000
RUN useradd -m -s /bin/bash -N -u $UID $USERNAME
RUN if [ ! -d /home/$USERNAME/ ]; then mkdir /home/$USERNAME/; fi
###############################################################################################
