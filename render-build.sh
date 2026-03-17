#!/usr/bin/env bash
# Exit on error
set -o errexit

# 1. Download and Extract JDK 17
wget -q https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.8.1%2B1/OpenJDK17U-jdk_x64_linux_hotspot_17.0.8.1_1.tar.gz -O jdk17.tar.gz
mkdir -p ./jdk17
tar -xzf jdk17.tar.gz -C ./jdk17 --strip-components=1

# 2. Setup Environment
export JAVA_HOME=$(pwd)/jdk17
export PATH=$JAVA_HOME/bin:$PATH

# 3. Build Fineract
chmod +x ./gradlew
./gradlew clean bootJar -x test