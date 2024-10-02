docker_network 'my_network' do
  driver 'bridge'
  action :create
end

docker_container 'docker-challenge' do
  repo 'amanarora1010/hive'
  tag 'docker-challenge-solved'
  port [ '80:80' ]
  network_mode 'my_network'
  action :run
end

docker_container 'metrics_container' do
  repo 'python'
  tag '3.9'
  port [ '5000:5000' ]
  network_mode 'my_network'
  volumes [ './main.py:/app/main.py' , './requirements.txt:/app/requirements.txt']
  command 'pip3 install -r requirements.txt && python3 /app/main.py'
  action :run
end