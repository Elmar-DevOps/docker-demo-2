FROM golang:alpine as build
WORKDIR /app
ADD . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM scratch
WORKDIR /app
COPY --from=build /app/docker-demo-2 /app/docker-demo-2
EXPOSE 9000
ENTRYPOINT [ "/app/docker-demo-2" ]
