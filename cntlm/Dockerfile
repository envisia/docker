FROM ubuntu:latest

RUN apt update -y && apt install cntlm -y

ENTRYPOINT ["/usr/sbin/cntlm","-f","-c"]
CMD ["/etc/cntlm.conf"]
