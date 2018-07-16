FROM continuumio/miniconda
MAINTAINER Hail Team <hail@broadinstitute.org>

USER root
RUN apt-get -y install \
    bash \
    cmake \
    curl \
    g++ \
    git \
    openjdk-8-jdk-headless \
    r-base \
    tar \
    unzip

RUN apt-get -y install libnlopt-dev # https://github.com/jyypma/nloptr/issues/40
RUN Rscript -e 'install.packages(c("jsonlite", "SKAT", "logistf"), repos = "http://cran.us.r-project.org")'
RUN apt-get -y install r-cran-ncdf4 r-cran-rnetcdf
RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite("GENESIS"); biocLite("SNPRelate"); biocLite("GWASTools")'

WORKDIR /plink
ADD http://www.cog-genomics.org/static/bin/plink/plink_linux_x86_64.zip /plink
RUN unzip plink_linux_x86_64.zip && \
    rm -rf plink_linux_x86_64.zip && \
    ln -s /plink/plink /bin/plink

WORKDIR /qctool
ADD http://www.well.ox.ac.uk/~gav/resources/qctool_v2.0-CentOS6.8-x86_64.tgz /qctool
RUN tar --strip-components=1 -xvzf qctool_v2.0-CentOS6.8-x86_64.tgz -C /qctool && \
    rm -rf qctool_v2.0-CentOS6.8-x86_64.tgz && \
    ln -s /qctool/qctool /bin/qctool
