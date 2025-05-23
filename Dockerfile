FROM golang:1.24 AS builder

WORKDIR /go/src/app
ADD . /go/src/app

RUN go get -v ./...

ENV CGO_ENABLED=0
RUN go build -o /go/bin/app

FROM scratch
COPY --from=builder /go/bin/app /default-user-credential-updater
ENTRYPOINT ["/default-user-credential-updater"]
