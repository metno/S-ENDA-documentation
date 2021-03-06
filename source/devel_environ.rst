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

Local development environment
=============================

The `S-ENDA csw catalog service <https://github.com/metno/S-ENDA-csw-catalog-service>`_ contains a Vagrant virtual machine configuration and a Docker container to run the catalog in a development environment that allows easy debugging of the relevant tools used by the service. All tools are downloaded to a folder called ``lib``, which is added in the vagrant shared folder (the root folder of the `S-ENDA csw catalog service <https://github.com/metno/S-ENDA-csw-catalog-service>`_ repository). You can then use your preferred editor to debug, change and update code. This is not intended for a regular user, but for people who wants to extend functionality or debug software.

* Start VM:

  .. code-block:: bash

    vagrant up localdev

  .. note::

    The git repositories with editable code is now available in the ``lib`` folder. If you need to add some repositories, please do it by editing line 13 in the file ``clone_or_update_git_repositories.sh``

* Add MMD test files to ``lib/input_mmd_files``
* Access VM:

  .. code-block:: bash

    vagrant ssh localdev

* Rebuild the docker container (if necessary)

  .. code-block:: bash

    cd /vagrant
    sudo ./build_container.localdev.sh

.. note::

  The Docker container (called ``catalog-dev``) is started with ``sleep 1d``. This means that it will run in the background for 1 day after running the ``build_container.localdev.sh`` script. This is a "hack" to be able to enter the container and run ``/usr/local/bin/entrypoint.py`` interactively. If you cannot access the container with ``sudo docker exec ...``, try rerunning the script again.

* Enter the docker container to run some code

  .. code-block:: bash

    sudo docker exec -it catalog-dev bash

* Translate from MMD to ISO19139, ingest metadata, and run the local web server

  .. code-block:: bash

    cd scripts/
    # Translate from MMD to ISO19139
    ./xmlconverter.py -i ~/mmd_in -o ~/isostore -t ~/mmd/xslt/mmd-to-iso.xsl
    cd
    # Create database
    python3 /usr/local/bin/pycsw-admin.py -c setup_db -f /etc/pycsw/pycsw.cfg
    # Ingest the ISO19139 record(s)
    python3 /usr/local/bin/pycsw-admin.py -c load_records -f /etc/pycsw/pycsw.cfg -p iso_out -r -y
    # Start the web server
    python3 /usr/local/bin/entrypoint.py

The csw-catalog-service is now started, and the catalog can be accessed on `<http://10.20.30.11>`_. Unless you have already ingested some metadata, the catalog should be empty. You can search the metadata catalog using, e.g., `QGIS <https://qgis.org/en/site/>`_ (v3.14 or higher):

* `Download and install QGIS <https://qgis.org/en/site/forusers/download.html>`_
* Run ``qgis``
* Select ``Web > MetaSearch > MetaSearch`` menu item
* Select ``Services > New``
* Type, e.g., ``localdev`` for the name
* Type ``http://10.20.30.11`` for the URL
* Under the ``Search`` tab, you can then add search parameters, click ``Search``, and get a list of available datasets.
* Select a dataset
* Click ``Add Data`` and select a WMS channel - the data will then be displayed in QGIS

If you want to debug the code, you can add break points and access the running process in the terminal window where the web server was started (``python3 /usr/local/bin/entrypoint.py --reload``).

Breakpoints are set by adding the following lines somewhere in the Python code:

.. code-block:: bash

  import ipdb
  ipdb.set_trace()

Search, e.g., datasets within a given time span:

* http://10.20.30.11/?mode=opensearch&service=CSW&version=2.0.2&request=GetRecords&elementsetname=full&typenames=csw:Record&resulttype=results&time=2000-01-01/2020-09-01


To run tests:

.. code-block:: bash

  py.test -m unit

..
  Contents of the S-ENDA-csw-catalog-service repository
  =====================================================

..
  * The file ``pycsw_local.dev.cfg`` is the pycsw configuration file used for local development. It contains configuration instructions to run the csw catalog service on your local Docker container which runs on the local virtual machine.
  * ``Vagrantfile`` is the vagrant configuration currently containing the development vm (TODO: add vm for non-development local testing)
  * ``Dockerfile.devel`` - Dockerfile for the development environment
  * ``build_container.dev.sh`` - shell script to add git repositories, run and set up volumes in the container ``catalog-dev``
  * ``docker-compose.*`` - docker-compose files to set up local test environment (not for development of tools) and run Continuous Integration

