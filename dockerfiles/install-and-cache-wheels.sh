#!/bin/sh
set -eu

pip install --find-links=./wheels_old --prefer-binary -r requirements.txt

python - <<'PY'
from pathlib import Path
from importlib.metadata import PackageNotFoundError, version

missing = []
for raw in Path("requirements.txt").read_text().splitlines():
    line = raw.strip()
    if not line or line.startswith("#"):
        continue
    name = line.split("==", 1)[0].split("[", 1)[0].strip()
    try:
        print("ok %s==%s" % (name, version(name)))
    except PackageNotFoundError:
        missing.append(name)

if missing:
    raise SystemExit("pip install incomplete, missing: " + ", ".join(missing))
print("all requirements installed")
PY

pip freeze > requirements_cache.txt
pip wheel -r requirements_cache.txt -w ./wheels --find-links=./wheels_old --prefer-binary
rm -rf wheels_old
