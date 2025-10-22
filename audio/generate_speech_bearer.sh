#!/bin/bash

# Load API key from .env file
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

curl $BASE_URL/audio/speech \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $API_KEY" \
-d '{
  "model": "gemini-2.5-flash-preview-tts",
  "input": "Xin chào, đây là một thử nghiệm chuyển văn bản thành giọng nói qua AI Thực Chiến gateway.",
  "voice": "Zephyr"
}' \
--output generated_audio.mp3
