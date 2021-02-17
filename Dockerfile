FROM panubo/sshd:1.2.1
RUN apk update && \
    apk upgrade && \
    apk add borgbackup py3-pip && \
    rm -rf /var/cache/apk/*
RUN apk update && \
    apk add openssl-dev python3-dev gcc g++ acl-dev linux-headers && \
    python3 -m pip install "borgbackup==1.1.15" && \
    apk del openssl-dev python3-dev gcc g++ acl-dev linux-headers && \
    rm -rf /var/cache/apk/*
ENV SSH_USERS=borg:1003:1001
VOLUME ["/borg", "/etc/ssh/keys", "/etc/authorized_keys"]

