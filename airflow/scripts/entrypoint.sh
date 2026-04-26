#!/bin/bash

airflow db init

airflow users create \
  --username admin \
  --firstname admin \
  --lastname admin \
  --role Admin \
  --email admin@admin.com \
  --password admin

exec airflow webserver

