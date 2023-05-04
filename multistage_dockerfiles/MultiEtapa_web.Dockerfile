FROM golang:1.20 as Etapa1
RUN mkdir /web
WORKDIR /web
COPY dispatcher.go .
RUN go build dispatcher.go

FROM alpine as Etapa2
RUN mkdir /web
WORKDIR /web
COPY --from=Etapa1 /web .
CMD ["./dispatcher"]

EXPOSE 8080