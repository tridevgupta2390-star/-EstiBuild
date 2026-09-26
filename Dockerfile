# EstiBuild deployment - NO-FOLDER METHOD (bulletproof for GitHub web upload)
# The repo needs only these LOOSE FILES at the root (no folders!):
#   Dockerfile, estibuild_code.zip, render.yaml, README.md
# The code (with its modules/structural/estimation folders) lives INSIDE
# estibuild_code.zip and is unpacked during this build.
FROM python:3.11-slim

# tesseract OCR engine + image libs (scanned PDF reading) + unzip
RUN apt-get update && apt-get install -y --no-install-recommends \
    tesseract-ocr libgl1 libglib2.0-0 unzip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# unpack the full application from the single zip
COPY estibuild_code.zip /tmp/estibuild_code.zip
RUN unzip -q /tmp/estibuild_code.zip -d /app && rm /tmp/estibuild_code.zip

# dependencies (requirements.txt is inside the zip)
RUN pip install --no-cache-dir -r requirements.txt

ENV PORT=8080
EXPOSE 8080

# gunicorn production server (4 workers)
CMD ["sh", "-c", "gunicorn -w 4 -b 0.0.0.0:${PORT:-8080} app:app"]
