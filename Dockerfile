# See https://hub.docker.com/r/babashka/babashka
FROM babashka/babashka@sha256:12fdec10dfa892dfe50ec62b21f654da8f84b9a8fafd915e38751109a7a2fa58

WORKDIR /var/src/release-on-push-action

COPY src src

ENV BABASHKA_CLASSPATH=/var/src/release-on-push-action/src

ENTRYPOINT [ "bb", "--main", "release-on-push-action.core" ]