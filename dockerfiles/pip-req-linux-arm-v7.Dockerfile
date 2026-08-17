FROM dr34m/python_3.11.9_glibc_2.24:3.11.9
COPY requirements.txt ./
COPY dockerfiles/install-and-cache-wheels.sh /tmp/install-and-cache-wheels.sh
COPY wheels/arm-v7/ ./wheels_old/
RUN /bin/sh /tmp/install-and-cache-wheels.sh
