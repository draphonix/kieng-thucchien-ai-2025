#!/bin/bash

# Load API key from .env file
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

if [ -z "$1" ]; then
  echo "Usage: $0 <file_id>"
  exit 1
fi

FILE_ID=$1

curl "$BASE_URL/gemini/download/v1beta/files/$FILE_ID:download?alt=media" \
-H "x-goog-api-key: $API_KEY" \
--output my_generated_video.mp4
