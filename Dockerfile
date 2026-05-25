FROM golang:alpine
COPY . .
RUN go build

FROM alpine:3.23
RUN apk add --no-cache ca-certificates bash
COPY --from=0 /go/hcloud-cloud-controller-manager /bin/hcloud-cloud-controller-manager
ENTRYPOINT ["/bin/hcloud-cloud-controller-manager"]
