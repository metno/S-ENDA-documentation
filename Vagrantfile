# -*- mode: ruby -*-
# vi: set ft=ruby :

# Build/rebuild documentation : vagrant up
# Stop helper VM              : vagrant halt
# Remove helper VM            : vagrant destroy

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y graphviz plantuml python3-pip
    pip3 install sphinx==2.3.1 sphinx_rtd_theme==0.4.3 sphinxcontrib-plantuml==0.18
    wget http://sourceforge.net/projects/plantuml/files/plantuml.jar
    cp plantuml.jar /usr/share/plantuml/plantuml.jar
  SHELL
  config.vm.provision "shell", privileged: false, run: "always", inline: <<-SHELL
    cd /vagrant
    make clean
    make html
  SHELL
end
