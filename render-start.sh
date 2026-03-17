#!/usr/bin/env bash
# 1. Re-link Java (Since Render clears the PATH between build and deploy)
export JAVA_HOME=$(pwd)/jdk17
export PATH=$JAVA_HOME/bin:$PATH

# 2. Run the JAR
java -Xmx512m -Dserver.port=$PORT -Dspring.profiles.active=postgresql -jar $(find . -name "fineract-provider*.jar" | grep -v "plain" | head -n 1)