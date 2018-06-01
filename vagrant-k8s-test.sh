#!/bin/bash
ansible old-k -m shell -a "mkdir -p /home/Vm/Vm1-test"
ansible old-k -m shell -a "mkdir -p /home/Vm/Vm2-test"
ansible old-k -m shell -a "mkdir -p /home/Vm/Vm3-test"

VMS="/home/Vm/Vm1-test /home/Vm/Vm2-test /home/Vm/Vm3-test"

for VM in $VMS; do
ansible old-k -m copy -a "src=./centos-7.0-x86_64.box dest=$VM"
done

for VM in $VMS; do
ansible old-k -m copy -a "src=./Vagrantfile dest=$VM"
done

for VM in "/home/Vm/Vm1-test"; do
   ansible old-k -m shell -a "sed -i '10c IP = \"192.168.100.17\"+i' $VM/Vagrantfile"
   ansible old-k -m shell -a "sed -i '9c INTERFACE = \"eno1\"' $VM/Vagrantfile"
   for((i=1;i<=4;i++)); do
     ansible "192.168.100.15"$i -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
   done
     ansible "192.168.100.166" -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
done

for VM in "/home/Vm/Vm2-test"; do
   ansible old-k -m shell -a "sed -i '10c IP = \"192.168.100.18\"+i' $VM/Vagrantfile"
   ansible old-k -m shell -a "sed -i '9c INTERFACE = \"eno1\"' $VM/Vagrantfile"
   for((i=1;i<=4;i++)); do
     ansible "192.168.100.15"$i -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
   done
   ansible "192.168.100.166" -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
done

for VM in "/home/Vm/Vm3-test"; do
   ansible old-k -m shell -a "sed -i '10c IP = \"192.168.100.19\"+i' $VM/Vagrantfile"
   ansible old-k -m shell -a "sed -i '9c INTERFACE = \"eno1\"' $VM/Vagrantfile"
   for((i=1;i<=4;i++)); do
     ansible "192.168.100.15"$i -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
   done
   ansible "192.168.100.166" -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
done

