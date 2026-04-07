FROM dr34m/python_3.11.9_glibc_2.24:3.11.9
COPY requirements.txt ./
COPY wheels/arm64/ ./wheels_old/
RUN /bin/sh -c set -eux; \
    pip install --find-links=./wheels_old --prefer-binary -r requirements.txt; \
	pip freeze > requirements_cache.txt; \
	pip wheel -r requirements_cache.txt -w ./wheels --find-links=./wheels_old --prefer-binary; \
	rm -rf wheels_old