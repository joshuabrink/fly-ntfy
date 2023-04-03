FROM binwiederhier/ntfy:latest
COPY server.yml /etc/ntfy/server.yml

RUN mkdir /var/cache/ntfy
RUN touch /var/cache/ntfy/cache.db

RUN mkdir /var/lib/ntfy
RUN touch /var/lib/ntfy/user.db

RUN --mount=type=secret,id=ADMIN_USER \
    --mount=type=secret,id=ADMIN_PASS \
    export ADMIN_USER="$(cat /run/secrets/ADMIN_USER)" && \
    export ADMIN_PASS="$(cat /run/secrets/ADMIN_PASS)" && \
    echo -e "$ADMIN_PASS\n$ADMIN_PASS" | ntfy user add --role=admin $ADMIN_USER

ENTRYPOINT ["ntfy", "serve"]