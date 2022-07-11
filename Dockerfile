ARG JAVA_VERSION=11
FROM gradle:6-jdk${JAVA_VERSION}-alpine AS build
ARG VERSION=1.5
WORKDIR /src
RUN apk add --update curl \
    && curl -L -o /src/diff-to-html.tar.gz \
        "https://github.com/cronn/diff-to-html/archive/refs/tags/v$VERSION.tar.gz" \
    && tar --strip 1 -xzf /src/diff-to-html.tar.gz -C /src \
    && gradle installDist

FROM amazoncorretto:${JAVA_VERSION}-alpine
ARG VERSION=1.5
RUN mkdir -p /usr/local/lib/diff-to-html
COPY --from=build /src/build/libs/src-$VERSION.jar /usr/local/lib/diff-to-html/diff-to-html.jar
COPY ./diff-to-html.sh /usr/local/bin/diff-to-html
RUN chmod +x /usr/local/bin/diff-to-html \
    && apk --update --no-cache add bash
CMD ["diff-to-html"]
