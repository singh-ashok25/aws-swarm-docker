#!/bin/bash

source ./variables.sh
source ./box.sh

for node in $(seq 1 $workers);
do
   eval "$(docker-machine env worker$node)"
   docker swarm leave
done
for node in $(seq 1 $leaders);
do
   eval "$(docker-machine env leader$node)"
   docker swarm leave --force
done

for node in $(seq 1 $workers);
do
   docker-machine rm worker$node --force 
done
for node in $(seq 1 $leaders);
do
   docker-machine rm leader$node --force 
done
wait
box "Waiting for the leader node to terminate ..." "blue" "red"
sleep $t
aws ec2 delete-security-group --group-name ${sg_name}
