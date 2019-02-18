FROM node:8-alpine

ENV KINESALITE_DATA /var/lib/kinesalite/data

RUN addgroup kinesalite && adduser -H -D -G kinesalite kinesalite
RUN mkdir -p /var/lib/kinesalite/data \
    && chown kinesalite:kinesalite /var/lib/kinesalite/data

# see https://github.com/npm/npm/issues/17851 for npm permissions issues when
# installing global packages as root, --unsafe-perm resolves this
RUN apk add --update g++ make python \
    && npm install -g --unsafe-perm --build-from-source kinesalite \
    && apk --purge -v del g++ make python \
    && rm -rf /var/cache/apk/*

USER kinesalite

EXPOSE 4567
CMD [ "sh", "-c", "kinesalite --path ${KINESALITE_DATA}" ]
