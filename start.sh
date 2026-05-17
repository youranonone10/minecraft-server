#!/bin/bash

# Accept EULA
echo "eula=true" > eula.txt

# Start the server with JVM optimizations
java -Xmx${RAM:-1024}M -Xms${RAM:-1024}M \
  -XX:+UseG1GC \
  -XX:MaxGCPauseMillis=200 \
  -XX:+UnlinkSymbolsOnError \
  -XX:G1NewCollectionPercentage=30 \
  -XX:G1MaxNewCollectionPercentage=40 \
  -XX:InitiatingHeapOccupancyPercent=35 \
  -XX:G1HeapRegionSize=16M \
  -XX:MinMetaspaceExpansion=21M \
  -XX:MaxMetaspaceExpansion=160M \
  -XX:CompileThreshold=2000 \
  -Dcom.mojang.eula.agree=true \
  -jar server.jar nogui
