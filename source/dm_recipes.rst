=======================
Data Management Recipes
=======================

----------------
Register context
----------------

Tips for generating MMD files from scratch (best practices)
===========================================================

This is a list of best practices when generating MMD files from other sources. Sources may include internal systems and less standardized file formats.

1. Get familiar with the MMD format
-----------------------------------

A full specification of the MMD format can be found in the git repository in the doc folder as .pdf, .adoc and .html. This specification also includes the controlled vocabularies needed for some of the metadata elements in the format.

2. Decide about the granularity of your datasets
------------------------------------------------

There is no set definition of a dataset in S-ENDA or in the standards the S-ENDA project is following. The Data Provider may decide themselves what a useful definition of a dataset is. However, the decision about the granulation of the dataset should keep the needs of the users of the discovery metadata in mind:

* A user searching for data will, in most cases, search for a given type of data, in a given timeframe, in a given location. The discovery metadata should be set up in such a way that the user will be able to find the data he or she is interested in when searching this way. It is useful to review the FAIR principles and assess your evaluation against them before deciding about the dataset granulation.
* Deciding the granulation of your datasets before starting the translation and registration work will save time later in the process. 
  
..
  The decision process MET went through when deciding on the granulation of the definition of a dataset from their surface observation network can be found here.

3. Link the MMD metadata elements to your metadata
--------------------------------------------------

It is a useful exercise to make an overview of the connection between your metadata and the metadata elements in MMD. Take particular care to check that the required fields will be filled from your source. You might need to get some of the metadata from other sources or generate them in another way if the required metadata fields are not available from the source you are working from.

4. Use controlled vocabularies
------------------------------

Some of the metadata elements require use of controlled vocabularies. These can be found in chapter 4 of the MMD documentation. Which controlled vocabulary to use is described under the appropriate metadata element. The information that exists in your source for these metadata elements are not necessarily in the same "formats" as these controlled vocabularies. In that case, one needs to create mappings between the information that exist for these metadata elements in the source to the appropriate controlled vocabulary, or suggest updates to the controlled vocabularies in MMD.

Generate MMD files via NetCDF files
===================================

By documenting and formatting your data using NetCDF following the `CF conventions <https://cfconventions.org/>`_ and the `Attribute Convention for Data Discovery (ACDD) <https://wiki.esipfed.org/Attribute_Convention_for_Data_Discovery_1-3>`_, MMD files can be automatically generated from the NetCDF files. The CF conventions is a controlled vocabulary providing a definitive description of what the data in each variable represents, and the spatial and temporal properties of the data. The ACDD vocabulary describes attributes recommended for describing a NetCDF dataset to data discovery systems.

Information about how to format the NetCDF files is available at `<https://adc.met.no/node/4>`_. Most importantly, this contains an overview of the global NetCDF attributes required to generate an MMD file.

How to test MMD records and register datasets
=============================================

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

This vm is used to test your MMD XML-files locally before pushing them to the main discovery metadata repository. 

* Start VM:

  .. code-block:: bash

    vagrant up localtest

Put your test files in the folder ``lib/input_mmd_files``, then:

  .. code-block:: bash

    vagrant ssh localtest
    cd /vagrant
    sudo MMD_IN=/vagrant/lib/input_mmd_files ./deploy-metadata.sh

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

.. note::

  If you get an error about unexpected keyword argument 'auth' when searching for data, it is most likely due to a bug in QGIS: `<https://github.com/qgis/QGIS/issues/38074>`_

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

.. _`search-context`:

--------------
Search context
--------------

User searches the catalog with OpenSearch
=========================================

The ``localtest`` and ``localdev`` virtual machines provide OpenSearch support through `pyCSW <https://github.com/geopython/pycsw>`_. To test OpenSearch via the browser, start the ``localtest`` vm (``vagrant up localtest``) and go to the following address:

* `<http://10.20.30.10/pycsw/csw.py?mode=opensearch&service=CSW&version=2.0.2&request=GetCapabilities>`_

This will return a description document of the catalog service. The `URL` field in the description document is a template format that can be used to represent a parameterized form of the search. The search client will process the URL template and attempt to replace each instance of a template parameter, generally represented in the form {name}, with a value determined at query time (`OpenSearch URL template syntax <https://github.com/dewitt/opensearch/blob/master/opensearch-1-1-draft-6.md#opensearch-url-template-syntax>`_). The question mark following any search parameter means that the parameter is optional.

We can now find all datasets in the catalog:

* `<http://10.20.30.10/?mode=opensearch&service=CSW&version=2.0.2&request=GetRecords&elementsetname=full&typenames=csw:Record&resulttype=results>`_

Or datasets within a given time span:

* `<http://10.20.30.10/?mode=opensearch&service=CSW&version=2.0.2&request=GetRecords&elementsetname=full&typenames=csw:Record&resulttype=results&time=2000-01-01/2020-09-01>`_

.. note::

  pyCSW opensearch time queries do not relate to the "expected" ``start_date`` and ``end_date`` MMD fields, or the associated ``beginPosition`` and ``endPosition``, in the pyCSW ISO19139 profile. We are working to understand and handle this...

Or, datasets from any of the Sentinel satellites:

* `<http://10.20.30.10/?mode=opensearch&service=CSW&version=2.0.2&request=GetRecords&elementsetname=full&typenames=csw:Record&resulttype=results&q=sentinel>`_

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

