ssh-keygen -t rsa
ssh-copy-id -i vagrant_id_rsa.pub vagrant@172.17.177.40
A senha deve ser vagrant


* $ 
ansible gitlab -u vagrant --private-key .vagrant/machines/wordpress/virtualbox/private_key -i hosts -m shell -a 'echo Hello, World'
ansible gitlab -u vagrant --private-key .vagrant/machines/gitlab/virtualbox/private_key  -i hosts -m shell -a 'echo Hello, World'
