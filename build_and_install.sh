#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BUILD_DIR="${SCRIPT_DIR}"/build
INSTALL_DIR="${SCRIPT_DIR}"/install

if [[ ! -d "${BUILD_DIR}" ]]; then
    mkdir "${BUILD_DIR}"
fi

if [[ ! -d "${INSTALL_DIR}" ]]; then
    mkdir "${INSTALL_DIR}"
fi

pushd "${BUILD_DIR}"

cmake -DMAILIO_BUILD_TESTS=OFF -DMAILIO_BUILD_EXAMPLES=OFF -DMAILIO_BUILD_DOCUMENTATION=OFF ..
cmake --build . --parallel="$(nproc)"

make DESTDIR="${INSTALL_DIR}" install

popd
