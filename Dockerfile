FROM ingensi/dockbeat

ADD https://github.com/progrium/entrykit/releases/download/v0.4.0/entrykit_0.4.0_Linux_x86_64.tgz /tmp/entrykit.tgz
RUN tar -xf /tmp/entrykit.tgz -C /bin entrykit \
    && entrykit --symlink \
    && true

ADD ./files /

ENTRYPOINT [ \
    "render", \
        "/etc/dockerbeat/dockerbeat.yml", \
    "--", \
    "dockbeat", "-c", "/etc/dockerbeat/dockerbeat.yml" \
]
