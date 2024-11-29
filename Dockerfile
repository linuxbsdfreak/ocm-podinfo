FROM ghcr.io/stefanprodan/podinfo:6.7.1 as podinfo
FROM gcr.io/distroless/static:nonroot

WORKDIR /home/app
COPY --from=podinfo /home/app/podinfo .
COPY --from=podinfo /usr/local/bin/podcli /usr/local/bin/podcli
USER 65532:65532
CMD ["./podinfo"]