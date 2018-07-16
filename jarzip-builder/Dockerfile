FROM hail-jar-dependencies
MAINTAINER Hail Team <hail@broadinstitute.org>

# cache (almost all) gradle dependencies
#
# Some plugin we use hides its dependencies in a so-called "detached
# configuration" so there is no way for us to ensure it gets cached.
RUN mkdir hail
WORKDIR /hail
COPY hail/build.gradle hail/settings.gradle hail/deployed-spark-versions.txt ./
RUN mkdir -p /gradle-jar-dependency-cache
RUN gradle downloadDependencies --gradle-user-home /gradle-jar-dependency-cache

# setup an output volume
RUN mkdir /artifacts
VOLUME /artifacts

# build hail
COPY hail .
ENV GRADLE_OPTS=-Xmx2g
CMD gradle shadowJar archiveZip --info --gradle-user-home /gradle-jar-dependency-cache && \
    cp build/libs/hail-all-spark.jar /artifacts && \
    cp build/distributions/hail-python.zip /artifacts
