nginx -c /etc/nginx/nginx01.conf
nginx -c /etc/nginx/nginx02.conf
nginx -c /etc/nginx/nginx03.conf
haproxy -W -f /usr/local/etc/haproxy/haproxy.cfg
sleep infinity