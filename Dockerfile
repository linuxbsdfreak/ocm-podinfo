FROM ghcr.io/stefanprodan/podinfo:6.7.1 as podinfo

FROM alpine:3.20
RUN addgroup -S app \
    && adduser -S -G app app \
    && apk --no-cache add \
    ca-certificates curl netcat-openbsd

WORKDIR /home/app

COPY --from=podinfo /podinfo/bin/podinfo .
COPY --from=podinfo /podinfo/bin/podcli /usr/local/bin/podcli
RUN chown -R app:app ./

USER app

CMD ["./podinfo"]