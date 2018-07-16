FROM hail-test-dependencies
MAINTAINER Hail Team <hail@broadinstitute.org>

# cache (almost all) gradle dependencies (and gradle itself)
#
# Some plugin we use hides its dependencies in a so-called "detached
# configuration" so there is no way for us to ensure it gets cached.
WORKDIR /hail
COPY hail/gradlew hail/gradle hail/build.gradle hail/settings.gradle hail/deployed-spark-versions.txt ./
COPY hail/gradle gradle
RUN mkdir -p /gradle-jar-dependency-cache
RUN ./gradlew downloadDependencies --gradle-user-home /gradle-jar-dependency-cache
COPY hail/python/hail/dev-environment.yml python/hail/dev-environment.yml
RUN conda env create hail -f ./python/hail/dev-environment.yml

# setup an output volume

WORKDIR /hail
COPY hail .

RUN rm -rf build && mkdir build
VOLUME build
CMD /bin/bash -c 'source activate hail && ./gradlew test --info --gradle-user-home /gradle-jar-dependency-cache'
