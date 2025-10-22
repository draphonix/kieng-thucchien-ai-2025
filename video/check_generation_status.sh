#!/bin/bash

# Load API key from .env file
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

if [ -z "$1" ]; then
  echo "Usage: $0 <operation_id>"
  exit 1
fi

OPERATION_ID=$1

curl "$BASE_URL/gemini/v1beta/models/veo-3.0-generate-001/operations/$OPERATION_ID" \
-H "x-goog-api-key: $API_KEY"
