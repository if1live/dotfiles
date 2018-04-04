# docker
# docker 중복설치하면 경고떠서 가장 마지막에 배치
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER
sudo docker version

sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

