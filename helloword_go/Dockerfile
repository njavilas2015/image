FROM golang:1.23 AS builder

WORKDIR /app

COPY main.go .
COPY go.mod .

RUN go build -o backend

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/backend .

EXPOSE 8080

CMD ["./backend"]
