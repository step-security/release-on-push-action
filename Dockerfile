# See https://hub.docker.com/r/babashka/babashka
FROM babashka/babashka@sha256:b6175637e766c13d225dc86e76c9577d3ef2f39bb132b116ceefe9340363e0ec

WORKDIR /var/src/release-on-push-action

COPY src src

ENV BABASHKA_CLASSPATH=/var/src/release-on-push-action/src

ENTRYPOINT [ "bb", "--main", "release-on-push-action.core" ]