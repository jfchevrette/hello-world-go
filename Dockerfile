FROM golang:1.14 AS builder

WORKDIR /go/src
COPY . .

RUN go get -d -v
RUN go build -o /go/bin/app

FROM registry.access.redhat.com/ubi8/ubi-minimal
COPY --from=builder /go/bin/app /app

ENTRYPOINT ["/app"]

