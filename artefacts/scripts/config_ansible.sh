#!/bin/sh

USER=vagrant
PASSWORD=vagrant



#cat /etc/ansible/hosts
dos2unix ~/scripts/ssh_pass.sh
chmod +x ~/scripts/ssh_pass.sh
#chown vagrant:vagrant ssh_pass.sh 

ansible-playbook ~/playbooks/configure_ansible.yaml

# password less authentication using expect scripting language
~/scripts/ssh_pass.sh $USER $PASSWORD "ansible.sample.com" 
~/scripts/ssh_pass.sh $USER $PASSWORD "nfsclient.sample.com" 
~/scripts/ssh_pass.sh $USER $PASSWORD "nfsserver.sample.com" 
~/scripts/ssh_pass.sh $USER $PASSWORD "docker.sample.com" 
~/scripts/ssh_pass.sh $USER $PASSWORD "jenkins.sample.com"
~/scripts/ssh_pass.sh $USER $PASSWORD "gitlab.sample.com"

ansible-playbook ~/playbooks/nfs_server.yaml
ansible-playbook ~/playbooks/nfs_clients.yaml
#ansible-playbook ~/playbooks/install_java.yaml
ansible-playbook ~/playbooks/install_jenkins.yaml
ansible-playbook ~/playbooks/install_docker.yaml
ansible-playbook ~/playbooks/install_gitlab.yaml


