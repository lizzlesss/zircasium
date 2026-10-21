FROM scratch AS ctx
COPY build_files /
COPY system_files /system_files

#FROM ghcr.io/zirconium-dev/zirconium-jackrabbit:latest
FROM ghcr.io/zirconium-dev/zirconium-hawaii-jackrabbit:latest

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    #/ctx/build.sh
    /ctx/build-hawaii.sh
    #ostree container commit

#RUN bootc container lint
