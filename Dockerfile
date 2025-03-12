FROM ollama/ollama:latest

USER root

# Install Zsh, Git, Curl, locales
RUN apt-get update && apt-get install -y \
    zsh git curl locales wget

# Install eza (successor to exa) using direct binary download
RUN wget -qO- https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz | \
    tar xz -C /usr/local/bin

# Generate and configure en_US.UTF-8 (or your preferred UTF-8 locale)
RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Install Oh My Zsh silently
RUN RUNZSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN chsh -s /usr/bin/zsh root

# Clear the entrypoint so we don't invoke `ollama` for every command
ENTRYPOINT []

# By default, run the Ollama server
CMD ["ollama", "serve"]
