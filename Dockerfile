# Load base Docker image
FROM debian:stretch

# Disable Debian frontend interaction promts
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies with apt-get
RUN set -ex; \
    apt-get update -qq; \
    apt-get install -y -qq apt-utils; \
    apt-get install -y -qq \
        python-pip \
        vim \
    ; \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*;

# Re-enable Debian frontend interaction promts
ENV DEBIAN_FRONTEND Teletype

# Install Python dependencies
RUN pip install --upgrade pip tabulate

# Create directories
RUN mkdir /tools /workdir

# Copy dummy_script.sh to /tools
COPY ./dummy_script.sh /tools/

# Update the permissions for the script
RUN chmod u+x /tools/dummy_script.sh

# Update environment variable, PATH
ENV PATH $PATH:/tools

# Set entry point (this makes the container invoke the tool directly)
ENTRYPOINT ["dummy_script.sh"]

# Set default cmd/arguments to the entry point
CMD ["Nobody"]

# Change working directory
WORKDIR /workdir

# Set convenience aliases
RUN echo "alias edit='vim'" >> ~/.bashrc && \
    echo "alias ls='ls -h --color=tty'" >> ~/.bashrc && \
    echo "alias ll='ls -lrt'" >> ~/.bashrc && \
    echo "alias l='less'" >> ~/.bashrc && \
    echo "alias du='du -hP --max-depth=1'" >> ~/.bashrc && \
    echo "alias cwd='readlink -f .'" >> ~/.bashrc;
