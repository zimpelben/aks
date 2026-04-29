FROM mcr.microsoft.com/devcontainers/base:ubuntu

COPY --from=jdxcode/mise /usr/local/bin/mise /usr/local/bin

# Make sure mise is activated in bash. Might be overriden by a user's dotfiles.
RUN echo 'eval "$(mise activate bash)"' >> /home/vscode/.bashrc
