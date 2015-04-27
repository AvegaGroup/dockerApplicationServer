FROM busybox

COPY conf/cruise-config.xml /etc/go/cruise-config.xml
RUN chown -R 999:999 /etc/go

CMD tail -f /etc/go/cruise-config.xml
VOLUME ["/etc/go/"]