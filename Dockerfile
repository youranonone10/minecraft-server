FROM eclipse-temurin:17-jre-alpine

WORKDIR /minecraft

# Install curl + bash (for startup script)
RUN apk add --no-cache curl bash

# Copy configuration files
COPY server.properties .
COPY eula.txt .
COPY start.sh .

# Make script executable
RUN chmod +x start.sh

# Accept EULA (also enforced at runtime)
RUN echo "eula=true" > eula.txt

# Expose Minecraft port
EXPOSE 25565

# Start server
CMD ["./start.sh"]
