=======================
Development environment
=======================

.. _HashiCorps: https://www.hashicorp.com/
.. _Vagrant: https://www.vagrantup.com/
.. _Vagrant documentation: https://www.vagrantup.com/docs/
.. _Wikipedia: https://en.wikipedia.org/
.. _Vagrant 2.2.7: https://releases.hashicorp.com/vagrant/2.2.7/
.. _VirtualBox 6.1.x: https://www.virtualbox.org/wiki/Downloads

In Wikipedia_, HashiCorps_' Vagrant_ is defined as

  Vagrant is an open-source software product for building and maintaining portable virtual software development environments, e.g. for VirtualBox, KVM, Hyper-V, Docker containers, VMware, and AWS. It tries to simplify the software configuration management of virtualizations in order to increase development productivity.

Vagrant is used in S-ENDA for spinning up reproducible development environments.

------------
Installation
------------

S-ENDA has standardized on these versions for the development environment.

* `Vagrant 2.2.7`_
* `VirtualBox 6.1.x`_

Download the software appropriate for your platform and install.

-------------
Generic usage
-------------

Below is a sample of the most used Vagrant commands. Other options for the configuration file, ``Vagrantfile``, and more advanced usage, read the `Vagrant documentation`_.

* Create config file, ``Vagrantfile``, for a Ubuntu Bionic VM.

  .. code-block:: bash

    vagrant init ubuntu/bionic64

* Start VM.

  .. code-block:: bash

    vagrant up

* Access VM.

  .. code-block:: bash

    vagrant ssh

* Stop VM.

  .. code-block:: bash

   vagrant halt

* Rerun provisioning scripts.

  .. code-block:: bash

    vagrant provision


--------------------
S-ENDA configuration
--------------------

This section contains template ``Vagrantfile`` used in S-SENDA development. There is a generic part, which will be reused. Then it will contain examples to help developers extend development environment functionality. Specific ``Vagrantfile`` for reproducing the complete development environment for S-ENDA will reside in the main code repositories.

Generic configuration
=====================

1. Create a folder for the development environment. This is usually your git repository folder.

  .. code-block:: bash

     mkdir development
     cd development

2. Create a new ``Vagrantfile``, and add the generic template we use. Use copy and paste.

  .. code-block:: bash

    vim Vagrantfile

  .. code-block:: ruby

    # -*- mode: ruby -*-
    # vi: set ft=ruby :

    require 'yaml'

    begin
      current_dir    = File.dirname(File.expand_path(__FILE__))
      # config.yml is ignored by git, i.e., .gitignore
      configs        = YAML.load_file("#{current_dir}/config.yml")
      vagrant_config = configs['configs'][configs['configs']['use']]
    rescue StandardError => msg
      vagrant_config = {}
    end

    Vagrant.configure("2") do |config|
      config.vm.box = "ubuntu/bionic64"
      config.vm.box_check_update = false

      config.vm.network "private_network", ip: "10.20.30.10"

      config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.cpus = 4
        vb.default_nic_type = "virtio"
      end

      config.vm.define "default" do |config|
        if vagrant_config != {}
          config.vm.network "public_network", ip: vagrant_config['ip'], netmask: vagrant_config['netmask'], bridge: vagrant_config['bridge']
          config.vm.provision "shell", run: "always", inline: "ip route add default via #{ vagrant_config['gateway'] } metric 10 || exit 0"
          config.vm.hostname = vagrant_config['hostname']
        end
      end

      config.vm.provision "shell", inline: <<-SHELL
        apt-get update
        apt-get install -y wget unattended-upgrades
      SHELL
    end

3. Add configuration file containing external IPs. This is an example. Remember to exclude this file from git in ``.gitignore``.

  .. code-block:: bash

    vim config.yml

  .. code-block:: yaml

    ---
    configs:
      use: myip1
      myip1:
        hostname: my.host.foo
        ip: 192.168.1.101
        netmask: 255.255.255.0
        bridge: eth0
        gateway: 192.168.1.1
      myip2:
        hostname: ohter.host.foo
        ip: 192.168.1.102
        netmask: 255.255.255.0
        bridge: eth0
        gateway:  192.168.1.1

4. Start environment with ``myip1`` external IP.

  .. code-block:: bash

    vagrant up

Examples extending functionality
===============================

This section will be extended as the need for more functionality in the development environment arises.

..
  # vim: set spell spelllang=en:
