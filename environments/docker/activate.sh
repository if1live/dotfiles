# for WSL
# https://medium.com/@sebagomez/installing-the-docker-client-on-ubuntus-windows-subsystem-for-linux-612b392a44c4

if [[ $OS_WSL == "1" ]]; then
  export DOCKER_HOST=localhost:2375
fi
