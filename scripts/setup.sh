#!/usr/bin/env bash
set -euo pipefail

export PYENV_GIT_TAG=v2.6.20
PYTHON_VERSION=3.12.12

# Configure vi
echo "set nocompatible" >> ~/.vimrc
echo "set showmode" >> ~/.vimrc

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Install and use latest LTS version of Node.js
nvm install --lts

# Install yarn globally
npm install -g yarn

# Install pnpm globally
npm install -g pnpm

# Configure npm / yarn / pnpm
npm config set ignore-scripts true --global
yarn config set ignore-scripts true --global
pnpm config set ignore-scripts true --global

yarn config set enableTelemetry 0 --global
pnpm config set enable-telemetry false --global

yarn config set enableImmutableInstalls true --global

# Install Python using pyenv
curl https://pyenv.run | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init - bash)"' >> ~/.bash_profile

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

pyenv install "$PYTHON_VERSION"
pyenv global "$PYTHON_VERSION"
pyenv shell "$PYTHON_VERSION"
