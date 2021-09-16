FROM golang:1.17.1-alpine3.14 as builder

WORKDIR /app 

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build .

FROM scratch

WORKDIR /app

COPY --from=builder /app/challenge_1 .

CMD ["./challenge_1"]
