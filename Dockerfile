FROM ubuntu
MAINTAINER Eric
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -y
RUN apt install vim wget   curl -y
RUN mkdir /root/my-test
RUN mkdir /root/my-test1
RUN apt-get update 
RUN apt-get clean 
LABEL "cameroon"="yaounde"
LABEL "gabon"="libreville"
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
VOLUME /myvol
VOLUME /peter
WORKDIR /root/my-test
#now start the server
RUN apt-get update
RUN apt-get install -y apache2
RUN mkdir -p /var/lock/apache2
RUN mkdir -p /var/run/apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV LANG C
COPY ./index.html  /var/www/html
CMD ["/usr/sbin/apache2","-D","FOREGROUND"]
EXPOSE 80
