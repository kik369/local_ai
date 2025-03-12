# Local AI Environment

This repository contains configuration for a local AI development environment using Docker Compose, featuring:

- **Ollama**: Local large language model server with a custom Dockerfile
- **Open WebUI**: Web interface for interacting with Ollama models
- **OpenHands**: AI sandbox environment

## Components

### Ollama

Runs locally to serve AI models. The custom Dockerfile extends the base Ollama image with:
- Zsh shell with Oh My Zsh
- Git, curl, and other development tools
- Eza (modern ls replacement)
- UTF-8 locale support

### Open WebUI

Provides a user-friendly web interface to interact with Ollama models.

### OpenHands

AI sandbox environment for safe execution of AI-generated code.

## Setup

1. Clone this repository
2. Make sure Docker and Docker Compose are installed
3. Run `docker-compose up -d` to start the services

## Access

- **Ollama API**: http://localhost:11434
- **Open WebUI**: http://localhost:3000
- **OpenHands**: http://localhost:3993

## Data Storage

All data is persisted in local directories:
- `ollama_data/`: Model files and Ollama configuration
- `openwebui_data/`: Open WebUI settings and history
- `openhands_data/`: OpenHands sessions and configuration
