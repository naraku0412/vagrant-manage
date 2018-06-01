#!/bin/bash
ansible new -m shell -a "mkdir -p /home/Vm/Vm1"
ansible new -m shell -a "mkdir -p /home/Vm/Vm2"
ansible new -m shell -a "mkdir -p /home/Vm/Vm3"
ansible new -m shell -a "mkdir -p /home/Vm/Vm4"
ansible new -m shell -a "mkdir -p /home/Vm/Vm5"
ansible new -m shell -a "mkdir -p /home/Vm/Vm6"

VMS="/home/Vm/Vm1 /home/Vm/Vm2 /home/Vm/Vm3 /home/Vm/Vm4 /home/Vm/Vm5 /home/Vm/Vm6"

for VM in $VMS; do
ansible new -m copy -a "src=./centos-7.0-x86_64.box dest=$VM"
done

for VM in $VMS; do
ansible new -m copy -a "src=./Vagrantfile dest=$VM"
done

for VM in "/home/Vm/Vm1"; do
   ansible new -m shell -a "sed -i '10c IP = \"192.168.100.20\"+i' $VM/Vagrantfile"
   for((i=1;i<=6;i++)); do
     ansible "192.168.100.16"$i -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
   done
done

for VM in "/home/Vm/Vm2"; do
   ansible new -m shell -a "sed -i '10c IP = \"192.168.100.21\"+i' $VM/Vagrantfile"
   for((i=1;i<=6;i++)); do
     ansible "192.168.100.16"$i -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
   done
done

for VM in "/home/Vm/Vm3"; do
   ansible new -m shell -a "sed -i '10c IP = \"192.168.100.22\"+i' $VM/Vagrantfile"
   for((i=1;i<=6;i++)); do
     ansible "192.168.100.16"$i -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
   done
done

for VM in "/home/Vm/Vm4"; do
   ansible new -m shell -a "sed -i '10c IP = \"192.168.100.10\"+i' $VM/Vagrantfile"
   for((i=1;i<=6;i++)); do
     ansible "192.168.100.16"$i -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
   done
done

for VM in "/home/Vm/Vm5"; do
   ansible new -m shell -a "sed -i '10c IP = \"192.168.100.11\"+i' $VM/Vagrantfile"
   for((i=1;i<=6;i++)); do
     ansible "192.168.100.16"$i -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
   done
done

for VM in "/home/Vm/Vm6"; do
   ansible new -m shell -a "sed -i '10c IP = \"192.168.100.12\"+i' $VM/Vagrantfile"
   for((i=1;i<=6;i++)); do
     ansible "192.168.100.16"$i -m shell -a "sed -i '8c i = \"'$i'\"' $VM/Vagrantfile"
   done
done

