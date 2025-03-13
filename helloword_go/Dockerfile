FROM golang:1.21 AS builder

WORKDIR /app

COPY main.go .

RUN go build -o backend

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/backend .

EXPOSE 8080

CMD ["./backend"]
