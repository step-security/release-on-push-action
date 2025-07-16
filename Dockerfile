# See https://hub.docker.com/r/babashka/babashka
FROM babashka/babashka@sha256:9e45c480bff09ca372f9215ea87d84241ceb5b18d94f87c14d7e11693a9c4a8f

WORKDIR /var/src/release-on-push-action

COPY src src

ENV BABASHKA_CLASSPATH=/var/src/release-on-push-action/src

ENTRYPOINT [ "bb", "--main", "release-on-push-action.core" ]