# AI Practical Examples

This repository contains a collection of scripts demonstrating how to use the AI Practical API for various tasks, including text, image, video, and audio generation.

## Project Structure

```
.
├── .env
├── .env.example
├── README.md
├── audio
│   ├── generate_speech_bearer.sh
│   └── generate_speech_gemini.sh
├── image
│   ├── generate_image_curl.sh
│   ├── generate_image_litellm.py
│   └── generate_image_openai.py
├── text
│   └── generate_text_litellm.py
└── video
    ├── check_generation_status.sh
    ├── download_video.sh
    └── generate_video.sh
```

## Setup

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/ai-practical-examples.git
    cd ai-practical-examples
    ```

2.  **Install dependencies:**
    - For Python scripts, you'll need to install the required libraries:
      ```bash
      pip install litellm openai python-dotenv
      ```
    - For shell scripts, ensure you have `curl` and `jq` installed.

3.  **Configure your API Key:**
    - Rename the `.env.example` file to `.env`:
      ```bash
      mv .env.example .env
      ```
    - Open the `.env` file and add your AI Practical API key and Base URL:
      ```
      API_KEY="<your_api_key>"
      BASE_URL="https://api.thucchien.ai"
      ```

## How to Run the Scripts

### Text Generation

-   **Using `litellm`:**
    ```bash
    python text/generate_text_litellm.py
    ```

### Image Generation

-   **Using `litellm`:**
    ```bash
    python image/generate_image_litellm.py
    ```

-   **Using `openai`:**
    ```bash
    python image/generate_image_openai.py
    ```

-   **Using `curl`:**
    ```bash
    bash image/generate_image_curl.sh
    ```

### Video Generation

1.  **Start video generation:**
    ```bash
    bash video/generate_video.sh
    ```
    This will return an operation ID.

2.  **Check generation status:**
    Replace `<operation_id>` with the ID from the previous step.
    ```bash
    bash video/check_generation_status.sh <operation_id>
    ```

3.  **Download the video:**
    Replace `<file_id>` with the file ID from the completed operation.
    ```bash
    bash video/download_video.sh <file_id>
    ```

### Audio Generation

-   **Using Bearer Token Auth:**
    ```bash
    bash audio/generate_speech_bearer.sh
    ```

-   **Using Gemini API Key:**
    ```bash
    bash audio/generate_speech_gemini.sh
# kieng-thucchien-ai-2025
