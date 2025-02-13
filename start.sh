#!/bin/bash

#start Nginx in the background
service nginx start

#start Uvicorn for FastAPI
uvicorn main:app --host 0.0.0.0 --port 8000