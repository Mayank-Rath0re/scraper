FROM dart:3.3.0 AS build

WORKDIR /app
COPY . .

RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/server

FROM alpine:latest

# Install Python and dependencies
RUN apk update && \
    apk add --no-cache python3 py3-pip bash docker-cli zip

ENV runmode=production
ENV serverid=default
ENV logging=normal
ENV role=monolith

COPY --from=build /runtime/ /
COPY --from=build /app/bin/server server
COPY --from=build /app/confi[g]/ config/
COPY --from=build /app/we[b]/ web/
COPY --from=build /app/migration[s]/ migrations/
COPY --from=build /app/results results/
COPY --from=build /app/queries queries/
COPY verify.py verify.py

RUN chmod +x verify.py
RUN pip install pandas

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

ENTRYPOINT ./server --apply-migrations --mode=$runmode --server-id=$serverid --logging=$logging --role=$role
