=======================
Data Management Recipes
=======================

----------------
Register context
----------------

Data Provider registers dataset
===============================

In order to make a dataset findable, a dataset must be registered in S-ENDA Find with appropriate metadata, which is indexed and exposed in CSW. The procedure is as follows:

#. Create MMD XML record of metadata
#. Translate from MMD to ISO19115
#. Index in CSW
#. Expose ISO19115 metadata via CSW to the internet

This is done with the s-enda-find Virtual Machine (VM), for which a Vagrant configuration is available in https://github.com/metno/S-ENDA-Prototype.

**TODO:** We need to describe how to do this:

* manually in the VM
* through the geoassets API

S-ENDA Find gives feedback
==========================

**TODO:** describe data dashboard..

--------------
Search context
--------------

User searches web portals
=========================

GeoNorge.no
-----------

**TODO:** describe how to search in geonorge, possibly with screenshots

User searches S-ENDA Find system
================================

CSW Protocol
------------

A prototype catalogue service of S-ENDA Find is available at http://senda1.lab-a.met.no:8000/. This can, e.g., be used from QGIS, as follows:

* Select ``Web > MetaSearch > MetaSearch`` menu item
* Select ``Services > New``
* Type, e.g., ``senda1-lab-a`` for the name
* Type ``http://senda1.lab-a.met.no:8000`` for the URL

Under the ``Search`` tab, you can then add search parameters, click ``Search``, and get a list of available datasets.