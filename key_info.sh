#!/bin/bash

# Load API key from .env file
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

curl -X 'GET' \
"$BASE_URL/key/info" \
-H 'accept: application/json' \
-H "Authorization: Bearer $API_KEY"
