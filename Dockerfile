FROM golang:rc-alpine as pre
WORKDIR /go/src
COPY ./main.go main.go
RUN go build main.go

FROM hello-world:latest
COPY --from=pre /go/src/main .
CMD [ "./main" ]
