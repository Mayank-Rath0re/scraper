# Stage 1: Build Dart application
FROM dart:3.3.0 AS build

WORKDIR /app
COPY . .

RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/server

# Stage 2: Final image using a Debian-based image
FROM debian:latest

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
  curl \
  gnupg \
  ca-certificates \
  lsb-release \
  python3 \
  python3-pip \
  python3-dev \
  build-essential \
  && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs \
  && apt-get clean

# Install Playwright
RUN npm install playwright

# Set environment variables
ENV runmode=production
ENV serverid=default
ENV logging=normal
ENV role=monolith

# Ensure you reference the build stage correctly
COPY --from=build /runtime/ / 
COPY --from=build /app/bin/server server
COPY --from=build /app/config/ config/
COPY --from=build /app/web/ web/
COPY --from=build /app/migrations/ migrations/
COPY --from=build /app/results results/
COPY --from=build /app/queries queries/
COPY verify.py verify.py
COPY google-maps-scraper google-maps-scraper

# Make sure the scripts are executable
RUN chmod +x google-maps-scraper
RUN chmod +x verify.py

EXPOSE 443
EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

ENTRYPOINT ./server --apply-migrations --mode=$runmode --server-id=$serverid --logging=$logging --role=$role
