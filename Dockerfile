FROM golang:1.8 as build-env

WORKDIR /go/src/app
ADD ./main.go /go/src/app

RUN go-wrapper download
RUN go-wrapper install

FROM gcr.io/distroless/base
COPY --from=build-env /go/bin/app /
CMD ["/app"]