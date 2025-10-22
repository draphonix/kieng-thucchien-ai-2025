#!/bin/bash

# Load API key from .env file
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

curl "$BASE_URL/gemini/v1beta/models/gemini-2.5-flash-preview-tts:generateContent" \
-H "x-goog-api-key: $API_KEY" \
-H 'Content-Type: application/json' \
-d '{
  "contents": [{
    "parts": [
      {"text": "Say cheerfully: Have a wonderful day!"}
    ]
  }],
  "generationConfig": {
      "responseModalities": ["AUDIO"],
      "speechConfig": {
        "voiceConfig": {
          "prebuiltVoiceConfig": {
            "voiceName": "Kore"
          }
        }
      }
  }
}'
