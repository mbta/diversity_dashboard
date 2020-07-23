#!/bin/bash -e

# Install asdf and link cached languages
export ASDF_DATA_DIR="${SEMAPHORE_CACHE_DIR}/.asdf"
if [[ ! -d "${ASDF_DATA_DIR}" ]]; then
  mkdir -p "${ASDF_DATA_DIR}"
  git clone https://github.com/asdf-vm/asdf.git "${ASDF_DATA_DIR}" --branch v0.7.8
fi

# shellcheck disable=SC1090
source "${ASDF_DATA_DIR}/asdf.sh"
asdf update

# install node.js
asdf plugin-add nodejs || true
asdf plugin-add yarn || true
asdf plugin-update --all

# import the Node.js release team's OpenPGP keys to main keyring
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

asdf install
# reshim is needed to pick up languages that were already installed in cache
asdf reshim

# install application dependencies
yarn install
