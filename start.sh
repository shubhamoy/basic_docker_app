#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

CHECK_IMAGE=$(docker images -q shubhamoy/basic_docker_app:latest 2> /dev/null)
CHECK_CONTAINER=$(docker ps -a | grep bdapp1 2> /dev/null)

if [ -z "$CHECK_IMAGE" ]; then
  printf "${GREEN}=============================================================\n"
  printf "\t${RED}Image Not Found. ${YELLOW}Trying to Pull from Hub.\n"
  printf "${GREEN}=============================================================\n"
  docker pull shubhamoy/basic_docker_app:latest
fi

if [ -z "$CHECK_CONTAINER" ]; then
  printf "${GREEN}=============================================================\n"
  printf "\t\t${BLUE}Creating App Container\n"
  printf "${GREEN}=============================================================\n"
  docker run -d -p 3000:3000 --name bdapp1 shubhamoy/basic_docker_app
else
  printf "${GREEN}=============================================================\n"
  printf "\t\t${BLUE}Starting App Container\n"
  printf "${GREEN}=============================================================\n"
  docker start bdapp1
fi

printf "${GREEN}=============================================================\n"
printf "\t${BLUE}Point your browser to http://127.0.0.1:3000\n"
printf "${GREEN}=============================================================\n"