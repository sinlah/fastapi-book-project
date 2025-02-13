#!/bin/bash

#start Nginx in the background
service nginx start

#start Uvicorn for FastAPI
sh -c uvicorn main:app --host 0.0.0.0 --port ${PORT:-5000}