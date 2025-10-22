import litellm
import base64
import os
from dotenv import load_dotenv

load_dotenv()

litellm.api_base = os.getenv("BASE_URL")
litellm.api_key = os.getenv("API_KEY")

response = litellm.image_generation(
  model="imagen-4",
  prompt=" a digital render of a massive skyscraper, modern, grand, epic with a beautiful sunset in the background ",
  n="1",
  extra_body={
      "aspect_ratio": "1:1"
  }
)

# Save image from base64 data
b64_data = response.data[0]['b64_json']
image_data = base64.b64decode(b64_data)
with open("generated_image.png", "wb") as f:
  f.write(image_data)
print("Image saved to generated_image.png")
