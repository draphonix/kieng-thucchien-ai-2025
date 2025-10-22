from openai import OpenAI
import base64
import os
from dotenv import load_dotenv

load_dotenv()

client = OpenAI(
  api_key=os.getenv("API_KEY"),
  base_url=os.getenv("BASE_URL")
)

response = client.chat.completions.create(
  model="gemini-2.5-flash-image-preview",
  messages=[{"role": "user", "content": "A breathtaking scene where a majestic waterfall cascades down rugged cliffs, shimmering like silver threads under the warm sunlight. Lush greenery surrounds the falls—towering trees, vibrant flowers, and soft moss painting nature’s perfect canvas. Mist rises gently, forming a magical rainbow that arches across the sky, while birds soar gracefully above as if dancing to the music of nature. A dreamlike moment that blends serenity and beauty in one stunning view."}],
  modalities=["image"]
)

# Lưu ảnh từ dữ liệu base64
base64_string = response.choices[0].message.images[0].get("image_url").get("url")
if ',' in base64_string:
  header, encoded = base64_string.split(',', 1)
else:
  encoded = base64_string
image_data = base64.b64decode(encoded)
with open("generated_chat_image.png", "wb") as f:
  f.write(image_data)
print("Image saved to generated_chat_image.png")
