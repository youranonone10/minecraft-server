FROM eclipse-temurin:17-jre-alpine

WORKDIR /minecraft

# Install curl
RUN apk add --no-cache curl bash

# Download Paper Server (latest 1.20.4)
RUN curl -fsSL -o server.jar https://launcher.papermc.io/v1/builds/paper/1.20.4/latest/downloads/paper-1.20.4-latest.jar

# Copy configuration files
COPY server.properties .
COPY eula.txt .
COPY start.sh .

# Make script executable
RUN chmod +x start.sh

# Accept EULA
RUN echo "eula=true" > eula.txt

# Expose Minecraft port
EXPOSE 25565

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:25565 || exit 1

# Start server
CMD ["./start.sh"]
