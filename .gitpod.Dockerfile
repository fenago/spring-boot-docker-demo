FROM gitpod/workspace-full:latest

# Install Java 17
RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    sdk install java 17.0.15-tem && \
    sdk default java 17.0.15-tem"

# Set Java environment variables
ENV JAVA_HOME=/home/gitpod/.sdkman/candidates/java/17.0.15-tem
ENV PATH=$JAVA_HOME/bin:$PATH

# Pre-download some Maven dependencies (optional optimization)
RUN mkdir -p /tmp/maven-cache
WORKDIR /workspace

# Gitpod handles Docker setup automatically - no need to modify groups
