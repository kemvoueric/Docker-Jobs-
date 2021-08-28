FROM ubuntu
MAINTAINER Eric
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -y
RUN apt install vim wget   curl -y
RUN mkdir /root/my-test
RUN mkdir /root/my-test1
RUN apt-get update 
RUN apt  install  apache2 -y
RUN apt install apache2-utils -y
RUN apt-get clean 
LABEL "cameroon"="yaounde"
LABEL "gabon"="libreville"
LABEL "usa"="washington"

LABEL "peter"="005789847"
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
COPY ./index.html /usr/local/apache2/htdocs/

VOLUME /myvol
VOLUME /peter

WORKDIR /root/my-test
EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
