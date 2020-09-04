=======================
Data Management Recipes
=======================

----------------
Register context
----------------

Data Provider registers dataset
===============================

In order to make a dataset findable, a dataset must be registered in a searchable catalog with appropriate metadata. The (meta)data catalog is indexed and exposed through `CSW <https://en.wikipedia.org/wiki/Catalogue_Service_for_the_Web>`_. 

The procedure to register a dataset in the catalog is as follows:

#. Create `MMD <https://htmlpreview.github.io/?https://github.com/metno/mmd/blob/master/doc/mmd-specification.html>`_ XML record of metadata
#. Translate from MMD to ISO19115
#. Index in CSW
#. Expose ISO19115 metadata via CSW to the internet

We have prepared Virtual Machine (VM) configurations and Docker containers to handle points 2-4 above.

..
  Note to reviewers: Please consider if this makes sense, and can be done now

The workflow which a data provider should follow in order to add new datasets to the common metadata catalog service is then as follows:

#. Create `MMD <https://htmlpreview.github.io/?https://github.com/metno/mmd/blob/master/doc/mmd-specification.html>`_ XML record of metadata
#. Clone the `S-ENDA-csw-catalog <https://github.com/metno/S-ENDA-csw-catalog-service>`_ repository
#. Test your MMD XML file(s) using the localtest vm (:ref:`local-test-env`)
#. Add an issue to the `S-ENDA-metadata <https://github.com/metno/S-ENDA-metadata>`_ repository (e.g., "New foo model dataset" [the issue is numbered, e.g., 131])
#. Clone the `S-ENDA-metadata <https://github.com/metno/S-ENDA-metadata>`_ repository
#. Create an issue branch: ``git branch issue131_foo_dataset``
#. Add your MMD file in the new branch, then commit, push, and create a pull request
#. A reviewer will evaluate the new dataset, and provide feedback or direcly accept and merge

..
  Note to reviewers: I now interpret http://senda1.lab-a.met.no as a staging server. How do we go from that to production, and what needs to be done? Please review and/or add issues in https://github.com/metno/S-ENDA-project-plan..

When the new MMD file is added to the metadata repository, it will be translated to a `pyCSW <https://github.com/geopython/pycsw>`_ ISO19139 profile, indexed in a postgis database, and exposed to the public via the `(meta)data catalog <http://senda1.lab-a.met.no/>`_ in the same way as demonstrated in the localtest vm (:ref:`local-test-env`).

.. _`local-test-env`:

Local test environment
----------------------

This vm is used to test your MMD XML-files locally before pushing them to the main discovery metadata repository. Put your test files in the folder ``lib/input_mmd_xml_files``, then:

* Start VM:

  .. code-block:: bash

    vagrant up localtest
    vagrant ssh localtest
    cd /vagrant
    sudo MMD_IN=/vagrant/lib/input_mmd_xml_files ./deploy-metadata.sh

.. note::

  The three last commands above should be handled through the provisioning but this currently does not work...

..
  * Check that the postgis db is added

..
  .. code-block:: bash

..
    vagrant ssh localtest
    cd /vagrant/
    sudo docker-compose exec postgis bash
    psql -U postgis csw_db
    \dt
    select * from records;

The csw-catalog-service is now started, and the catalog can be accessed on `<http://10.20.30.10>`_. Note that there is no point in debugging or changing code used in this environment. It is only meant to test the content of `S-ENDA-metadata <https://github.com/metno/S-ENDA-metadata>`_. If you want to modify code used in the catalog service, please refer to :ref:`local-developmen-env`.

Search the metadata catalog using `QGIS <https://qgis.org/en/site/>`_ (v3.14 or higher):

* `Download and install QGIS <https://qgis.org/en/site/forusers/download.html>`_
* Run ``qgis``
* Select ``Web > MetaSearch > MetaSearch`` menu item
* Select ``Services > New``
* Type, e.g., ``localtest`` for the name
* Type ``http://10.20.30.10`` for the URL
* Under the ``Search`` tab, you can then add search parameters, click ``Search``, and get a list of available datasets.
* Select a dataset
* Click ``Add Data`` and select a WMS channel - the data will then be displayed in QGIS

..
  S-ENDA Metadata Service gives feedback
  ======================================

..
  S-ENDA Metadata Service has two main types of feedback for the data provider:

..
  #. Questions/praise/bug reports etc. from users.
  #. Operational metrics about downloads and production runs for each dataset.

..
  Feedback from users would come as either e-mails into a ticketing system, or as messages in a forum.

..
  Operational metrics will be harvested from metrics server (e.g Prometheus), giving the data provider information such as number of downloads pr. day for each type of service(WMS, DAP etc.) and delays in producing the datasets.

DOI registration at MET
=======================

.. include:: doi_at_met.rst

--------------
Search context
--------------

User searches the catalog with opensearch
=========================================

TODO: test and describe..

User searches web portals
=========================

GeoNorge.no
-----------

**TODO:** describe how to search in geonorge, possibly with screenshots

User searches from QGIS
=======================

A staging server for the CSW catalog service is available at http://senda1.lab-a.met.no:8000/. This can be used from QGIS, as follows:

* Select ``Web > MetaSearch > MetaSearch`` menu item
* Select ``Services > New``
* Type, e.g., ``senda1-lab-a`` for the name
* Type ``http://senda1.lab-a.met.no`` for the URL

Under the ``Search`` tab, you can then add search parameters, click ``Search``, and get a list of available datasets.

