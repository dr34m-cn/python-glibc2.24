FROM dr34m/python-gcc6:3.11.9
RUN set -eux; apt-get update; \
    apt-get install -y gfortran libopenblas-dev liblapack-dev cmake; \
	rm -rf /var/lib/apt/lists/*; \
	pip install --upgrade pip setuptools==69.5.1 wheel
CMD ["python3"]
