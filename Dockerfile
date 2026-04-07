FROM dr34m/python-gcc6:3.11.9
RUN set -eux; apt-get update; \
    apt-get install -y gfortran libopenblas-dev liblapack-dev cmake; \
	rm -rf /var/lib/apt/lists/*; \
	pip install --upgrade pip setuptools wheel
CMD ["python3"]
