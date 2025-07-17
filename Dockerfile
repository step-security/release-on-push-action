# Alpine with glibc compatibility for ARM64 babashka
FROM alpine:3.20

ARG TARGETARCH
ENV BB_VERSION=1.12.206

# Install basic dependencies
RUN apk add --no-cache curl bash tar gcompat libc6-compat

# Download and install babashka
RUN \
  BB_ARCH=$( \
    case "$TARGETARCH" in \
      "amd64") echo "amd64" ;; \
      "arm64") echo "aarch64" ;; \
      *) echo "Unsupported TARGETARCH=$TARGETARCH" && exit 1 ;; \
    esac \
  ) && \
  BB_SUFFIX=$( \
    case "$BB_ARCH" in \
      "aarch64") echo "-static" ;; \
      *) echo "" ;; \
    esac \
  ) && \
  BB_FILENAME="babashka-${BB_VERSION}-linux-${BB_ARCH}${BB_SUFFIX}.tar.gz" && \
  BB_URL="https://github.com/babashka/babashka/releases/download/v${BB_VERSION}/${BB_FILENAME}" && \
  echo "Downloading $BB_URL" && \
  curl -L "$BB_URL" | tar -xz -C /usr/local/bin bb && \
  chmod +x /usr/local/bin/bb

WORKDIR /var/src/release-on-push-action

COPY src src

ENV BABASHKA_CLASSPATH=/var/src/release-on-push-action/src

ENTRYPOINT [ "bb", "--main", "release-on-push-action.core" ]