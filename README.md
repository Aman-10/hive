# Hive Assessment

The README.md contains a small guide as to explain what all has been done to solve the docker challenge.

### Solution

Ans 1. 
1. After inspecting the haproxy.cfg we found that the request are being server to 3 ports on localhost i.e. 8001, 8002, 8000.
2. Next, I examined the /etc/nginx folder and saw 3 nginx configs nginx01, nginx02 and nginx03. However, after going through these files it can be confirmed that nginx is running on port 8001, 8002 and 8003, hence, making the port 8000 a wrong port in haproxy.cfg. 
3. After changing the port in haproxy.cfg to the right we could observe that haproxy was only serving traffic twice i.e. every 1 out 3 request were failing. Investigating the nginx errors.log pointed to the wrong file being used to run one of three nginx services. 
4. Finally, we update the entrypoint.sh file to use the correct nginx conf for nginx02 and we were finally able to server the request 3/3 times.
5. The updated [entrypoint.sh](entrypoint.sh), [haproxy.cfg](haproxy.cfg) and [index.html](index.html) has also been added in the git repo. 


Ans 2. 
1. For second problem in order to generate OS level metrics and expose them as metrics, a python script has been developed(the same has been attached [ main.py ](main.py)).
2. This script is being mounted into the container that is being bootstrapped  with the help of a cookbook.
3. For an endpoint to be accessible from the first container "amanarora1010/hive:docker-challenge-solved" I have created a route in the already existing nginx configuration. So whenever a user will make the following curl request `curl localhost:80/metrics` metrics from the second container will be exposed.
4. Updated nginx configurations have been also been added in the git repo [nginx01](nginx01.conf), [nginx02](nginx02.conf) and [nginx03.conf](nginx03.conf).
5. Finally, in the cookbook first a docker network is created, then the container created in the 1st problem has been used and finally we create another container called metrics_container has been created, in which the main.py is being mounted as volume. 
6. I have only added the cookbook.rb in the git repo.