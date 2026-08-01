# for reference, check the content of the bazzite container file
# https://github.com/ublue-os/bazzite/blob/main/Containerfile

# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /
COPY system_files /system_files

# Base Image
FROM ghcr.io/ublue-os/bazzite:stable@sha256:50bd2fac982ece83d9064abbd68e726d6c3e475851700a4cc1d789f76a64d022

### [IM]MUTABLE /opt
# RUN rm /opt && mkdir /opt

### MODIFICATIONS
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

### LINTING
RUN bootc container lint
