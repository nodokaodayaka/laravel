FROM centos
RUN yum -y install epel-release
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum install -y --enablerepo=remi,remi-php70 php php-devel php-mbstring php-mysql php-xml php-mcrypt
RUN systemctl enable httpd

RUN rm -rf /var/www/html
RUN ln -s /tmp/app/laravel/public /var/www/html

ADD conf/httpd.conf /etc/httpd/conf/httpd.conf

ENTRYPOINT ["/sbin/init"]
