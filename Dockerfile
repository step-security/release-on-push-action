# See https://hub.docker.com/r/babashka/babashka
FROM babashka/babashka@sha256:14ef0720c8f0d95b02b48f669fe0b28c7840d60b6a03e680579252e6d816d5c0

WORKDIR /var/src/release-on-push-action

COPY src src

ENV BABASHKA_CLASSPATH=/var/src/release-on-push-action/src

ENTRYPOINT [ "bb", "--main", "release-on-push-action.core" ]