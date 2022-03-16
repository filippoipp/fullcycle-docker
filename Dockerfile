FROM golang:alpine AS build

WORKDIR /go/src/app
COPY main.go .
RUN go build -o server main.go

FROM scratch
WORKDIR /go/src/app
COPY --from=build /go/src/app/server .
CMD [ "./server" ]
