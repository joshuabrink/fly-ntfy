FROM binwiederhier/ntfy:latest
COPY server.yml /etc/ntfy/server.yml

RUN mkdir /var/cache/ntfy
RUN touch /var/cache/ntfy/cache.db


RUN mkdir /var/lib/ntfy
RUN touch /var/lib/ntfy/user.db

RUN --mount=type=secret,id=ADMIN_PASSWORD \
    && echo -e "$ADMIN_PASSWORD\n$ADMIN_PASSWORD" | ntfy user add --role=admin $ADMIN_USER 

ENTRYPOINT ["ntfy", "serve"]