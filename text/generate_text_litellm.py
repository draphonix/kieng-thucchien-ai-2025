import litellm
import os
from dotenv import load_dotenv

load_dotenv()

# --- Cấu hình ---
litellm.api_base = os.getenv("BASE_URL")
api_key = os.getenv("API_KEY")

# --- Thực thi ---
response = litellm.completion(
  model="gemini-2.5-flash",
  messages=[
      {
          "role": "system",
          "content": "Bạn là một trợ lý ảo"
      },
      {
          "role": "user",
          "content": "Hãy viết một câu giới thiệu về Việt Nam."
      }
  ],
  api_key=api_key
)

print(response.choices[0].message.content)
