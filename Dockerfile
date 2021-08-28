FROM ubuntu
MAINTAINER Eric
RUN apt update -y
RUN apt install vim wget  curl -y
RUN mkdir /root/my-test
RUN mkdir /root/my-test1

LABEL "cameroon"="yaounde"
LABEL "gabon"="libreville"
LABEL "usa"="washington"

LABEL "peter"="005789847"
EXPOSE 6000-9000/tcp
EXPOSE 95/tcp
ENV FRANCE="paris"
ENV PROF="eric"
ENV WORK="success"
ENV LINUX="100000"
ENV FOCUS="group"
ENV EDUCATION="job"
ENV PASSWORD="YWJjMTIzCg=="
ADD ./*   /root/my-test/ 
ADD  https://github.com/kemvoueric/sonar-scanner-cli/archive/refs/tags/4.6.2.2472.tar.gz    /root/my-test   
COPY ./*  /root/my-test1/ 
ENTRYPOINT [ "free"]
CMD [ "-m" ]
VOLUME /myvol
VOLUME /peter
USER peter

WORKDIR /root/my-test

