ARG GO_TAG=1.26
ARG DOCKER_REGISTRY=docker.io
FROM --platform=$BUILDPLATFORM ${DOCKER_REGISTRY}/library/golang:${GO_TAG} AS builder

ARG TARGETOS
ARG TARGETARCH

WORKDIR /go/src/app
ADD . /go/src/app

RUN go get -v ./...

ENV CGO_ENABLED=0
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /go/bin/app

FROM scratch
COPY --from=builder /go/bin/app /default-user-credential-updater
ENTRYPOINT ["/default-user-credential-updater"]
