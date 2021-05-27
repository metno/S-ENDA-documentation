=======================
Development environment
=======================

.. _HashiCorps: https://www.hashicorp.com/
.. _Vagrant: https://www.vagrantup.com/
.. _Vagrant documentation: https://www.vagrantup.com/docs/
.. _Wikipedia: https://en.wikipedia.org/
.. _Vagrant 2.2.7: https://releases.hashicorp.com/vagrant/2.2.7/
.. _VirtualBox 6.1.x: https://www.virtualbox.org/wiki/Downloads
.. _vagrant-disksize 0.1.3: https://github.com/sprotheroe/vagrant-disksize

--------
Workflow
--------

The workflow from local development to production goes through four main stages: local development, local testing of containers intended for the staging environment, online staging, and online production.

.. uml:: puml/development_workflow.puml

-------
Vagrant
-------

In Wikipedia_, HashiCorps_' Vagrant_ is defined as

  Vagrant is an open-source software product for building and maintaining portable virtual software development environments, e.g. for VirtualBox, KVM, Hyper-V, Docker containers, VMware, and AWS. It tries to simplify the software configuration management of virtualizations in order to increase development productivity.

Vagrant is used in S-ENDA for spinning up reproducible development environments.

------------
Installation
------------

S-ENDA has standardized on these versions for the development environment:

* `Vagrant 2.2.7`_
* `VirtualBox 6.1.x`_
* Vagrant plugin `vagrant-disksize 0.1.3`_

Download the Vagrant and VirtualBox  appropriate for your platform and install. Install the plugin as follows.

.. code-block:: bash

   vagrant plugin install --plugin-version 0.1.3 vagrant-disksize

-------------
Generic usage
-------------

Below is a sample of the most used Vagrant commands. For an overview of other options used in the configuration file, ``Vagrantfile``, and more advanced usage, read the `Vagrant documentation`_.

* Create config file, ``Vagrantfile``, for an Ubuntu Bionic VM:

  .. code-block:: bash

    vagrant init ubuntu/bionic64

* Start VM:

  .. code-block:: bash

    vagrant up

* Access VM:

  .. code-block:: bash

    vagrant ssh

* Stop VM:

  .. code-block:: bash

   vagrant halt

* Rerun provisioning scripts:

  .. code-block:: bash

    vagrant provision


--------------------
S-ENDA configuration
--------------------
This section contains a template ``Vagrantfile`` used in S-SENDA development. There is one generic and reusable part. In addition to this, examples to help developers extend development environment functionality will be added. Specific ``Vagrantfile``'s for reproducing the complete development environment for S-ENDA will reside in the main code repositories.


Generic configuration
=====================

1. Create a folder for the development environment. This is usually your git repository folder where your code resides.

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
      # config.yml is ignored by git, i.e., it is added to .gitignore
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

  Explanation. If you add this file in the same directory as you ``Vagrantfile``, the Vagrant VM will automatically get the hostname and external IP on the interface you've defined as bridge. You can have multiple configurations in same file. Select the configuration you want with the ``use`` variable. In this example file ``use`` is set to ``myip1``. With the ``myip1`` configuration the VM will get the name ``my.host.foo``, IP ``192.168.1.101`` bridged on ``eth0``.

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
================================

This section will be extended as the need for more functionality in the development environment arises.

Resize VM disk size in ``Vagrantfile``
--------------------------------------

To increase the capacity of the VM disk, you need the ``vagrant-disksize`` plugin installed on your system, see Installation_. Accepted sizes are ``KB``, ``MB``, ``GB`` and ``TB``. Change this example size, ``50GB``, to your desired size. Add this example to your ``Vagrantfile``.

.. code-block:: ruby

  # Add example inside the vagrant configure block
  # Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-disksize")
    config.disksize.size = '50GB'
  else
    config.vm.post_up_message = <<-MESSAGE
    WARNING:
    Can't resize disk. 'vagrant-disksize' plugin is not installed.

    To install plugin run:
    vagrant plugin install --plugin-version=0.1.3 vagrant-disksize
    MESSAGE
  end

  # End of Vagrant configure block
  # end

..
  # vim: set spell spelllang=en:

--------------------------------------------------------------------------
Development of the S-ENDA csw catalog service and relevant Python packages
--------------------------------------------------------------------------

.. _local-developmen-env:

See DMH: https://htmlpreview.github.io/?https://github.com/metno/data-management-handbook/blob/master/html/data-management-handbook.html#practical-guides
