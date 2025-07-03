FROM gitpod/workspace-full-vnc:latest
# Install Java 17
RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    sdk install java 17.0.15-tem && \
    sdk default java 17.0.15-tem"
# Set Java environment variables
ENV JAVA_HOME=/home/gitpod/.sdkman/candidates/java/17.0.15-tem
ENV PATH=$JAVA_HOME/bin:$PATH
# Docker is already installed in workspace-full-vnc
# Ensure Docker daemon runs and user has permissions
USER root
RUN usermod -aG docker gitpod
USER gitpod
# Pre-download some Maven dependencies
RUN mkdir -p /tmp/maven-cache
COPY pom.xml /tmp/maven-cache/
WORKDIR /tmp/maven-cache
RUN mvn dependency:go-offline -q || true
WORKDIR /workspace
