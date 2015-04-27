#TODO: find better image containing /bin/true & echo 
FROM dockerfile/java:oracle-java8

COPY conf/cruise-config.xml /etc/go/cruise-config.xml
RUN chown -R 999:999 /etc/go

CMD /bin/true
VOLUME ["/etc/go/"]