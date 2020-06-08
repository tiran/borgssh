FROM panubo/sshd:1.2.1
RUN apk update && \
    apk add borgbackup && \
    rm -rf /var/cache/apk/*

ENV SSH_USERS=borg:1003:1001
VOLUME ["/borg", "/etc/ssh/keys", "/etc/authorized_keys"]

