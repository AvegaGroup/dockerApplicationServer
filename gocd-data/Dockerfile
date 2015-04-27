#TODO: find better image containing /bin/true & echo 
FROM dockerfile/java:oracle-java8

COPY conf/cruise-config.xml /etc/go/cruise-config.xml
RUN chown -R 999:999 /etc/go

CMD tail -f /etc/go/cruise-config.xml
VOLUME ["/etc/go/"]