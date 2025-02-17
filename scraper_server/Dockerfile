FROM dart:3.3.0 AS build

WORKDIR /app
COPY . .

RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/server

FROM alpine:latest

# Install Python, dependencies, and libstdc++
RUN apk update && \
    apk add --no-cache python3 py3-pip libstdc++

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

RUN chmod +x google-maps-scraper
RUN chmod +x verify.py

EXPOSE 443
EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

ENTRYPOINT ./server --apply-migrations --mode=$runmode --server-id=$serverid --logging=$logging --role=$role
