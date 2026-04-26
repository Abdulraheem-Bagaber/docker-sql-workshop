# First-time build can take several minutes.

FROM apache/airflow:3.2.1
ENV AIRFLOW_HOME=/opt/airflow

USER root

# Install system tools + Google Cloud CLI from Google's official apt repository
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        vim \
        curl \
        ca-certificates \
        gnupg \
    && mkdir -p /usr/share/keyrings \
    && curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg \
        | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
        > /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends google-cloud-cli \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR $AIRFLOW_HOME

# Install Python dependencies needed by DAGs
COPY requirements.txt /requirements.txt

USER airflow

RUN pip install --no-cache-dir -r /requirements.txt