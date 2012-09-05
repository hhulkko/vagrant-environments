[Install Vagrant & Virtualbox](http://vagrantup.com/v1/docs/getting-started/index.html)

Install [Ansible](http://ansible.github.com/) and [Ansible Vagrant](https://github.com/dsander/vagrant-ansible) plugin:

    pip install Jinja2 PyYAML paramiko
    git clone https://github.com/ansible/ansible.git
    cd ansible
    sudo make install
    vagrant gem install vagrant-ansible

Clone this

    cd vagrant-envinronments/ubuntu-with-apache
    vagrant up
