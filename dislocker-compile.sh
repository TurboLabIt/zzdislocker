#!/usr/bin/env bash
source "/usr/local/turbolab.it/bash-fx/bash-fx.sh"

fxHeader "🚀 Compile Dislocker"
rootCheck

### Universe is required to get some pre-requisites
add-apt-repository universe
apt update

### Pre-requisites
## https://github.com/Aorimn/dislocker/blob/master/INSTALL.md#requirements
apt install gcc cmake make libfuse-dev libmbedtls-dev ruby-dev -y

### Fix for
# CMake Error at /usr/share/cmake-3.22/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
# Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
apt install pkg-config -y

DSKL_COMPILE_DIR=/tmp/zzdislocker-compile-dir/
rm -rf "${DSKL_COMPILE_DIR}"
mkdir "${DSKL_COMPILE_DIR}"
cd "${DSKL_COMPILE_DIR}"

git clone https://github.com/Aorimn/dislocker.git
cd dislocker
cmake . && make && make install
rm -rf "${DSKL_COMPILE_DIR}"

fxEndFooter
