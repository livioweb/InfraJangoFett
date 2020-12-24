ssh-keygen -t rsa
ssh-copy-id -i vagrant_id_rsa.pub vagrant@172.17.177.40
A senha deve ser vagrant


ansible-playbook provisioning.yml -u vagrant -i hosts --private-key ssh-keys/vagrant_id_rsa     


* $ 
ansible gitlab -u vagrant --private-key .vagrant/machines/wordpress/virtualbox/private_key -i hosts -m shell -a 'echo Hello, World'
ansible gitlab -u vagrant --private-key .vagrant/machines/gitlab/virtualbox/private_key  -i hosts -m shell -a 'echo Hello, World'



docker run --detach \
  --hostname gitlab.devops \
  --publish 443:443 --publish 80:80 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  gitlab/gitlab-ee:latest
