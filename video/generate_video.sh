#!/bin/bash

# Load API key from .env file
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

curl -X POST "$BASE_URL/gemini/v1beta/models/veo-3.0-generate-001:predictLongRunning" \
-H "Content-Type: application/json" \
-H "x-goog-api-key: $API_KEY" \
-d '{
  "instances": [{
    "prompt": "A cinematic shot of a baby raccoon wearing a tiny cowboy hat, riding a miniature pony through a field of daisies at sunset.",
    "image": null
  }],
  "parameters": {
    "negativePrompt": "blurry, low quality",
    "aspectRatio": "16:9",
    "resolution": "720p",
    "personGeneration": "allow_all"
  }
}'
