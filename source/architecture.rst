===================
S-ENDA Architecture
===================

About the architecture drafts:

- They are described using the C4 model (https://c4model.com/). C4 does not define any properties based on the directionality of the used arrows so each arrow should have a textual description to avoid disambiguity
- They are work in progress, and many updates are expected as we dig into the details
- The implementation of the metadata store is not yet decided. Amongst viable possibilities is one of the document-oriented databases (https://en.wikipedia.org/wiki/Document-oriented_database)
- They are to a high degree based on the use cases outlined in :ref:`use-cases-section`

----------------
General Contexts
----------------

.. note:: This is a draft under development. We highly appreciate input and help in correcting any mistakes.

S-ENDA is part of a larger effort within the national geodata strategy (*"Alt skjer et sted"*), and relates to this strategy through Geonorge, which is developed and operated by the Norwegian Mapping Authority (*"Kartverket"*). GeoNorge, in turn, relates to the European Inspire Geoportal through the Inspire directive. In particular, S-ENDA is responsible for *Action 20* of the Norwegian geodata strategy.  The goal of action 20 is to *establish a distributed, virtual data center for use and management of dynamic geodata*. S-ENDA's vision is that *everyone, from professional users to the general public, should have easy, secure and stable access to dynamic geodata*. 

The vision of S-ENDA and the goal of action 20 are aligned with international guidelines, in particular the `FAIR Guiding Principles for scientific data management and stewardship <https://www.nature.com/articles/sdata201618>`_. To achieve these goals, we focus initially on two main systems: (1) S-ENDA Discovery Metadata Service, and (2) S-ENDA Data Access Service.

About the *S-ENDA Discovery Metadata Service*: 

- Data and service providers register (see `S-ENDA provider context`_) their datasets or services via a WebUI or a web registration API in their own system nodes (see `S-ENDA Discovery Metadata Service Boundary`_). These nodes expose CSW [1]_ catalogue services for harvesting, either in `Context with a central catalogue`_, or in `Context with a distributed S-ENDA Discovery Metadata Service solution`_. 

.. note::

   Relations in the C4 diagrams illustrate protocol and standard in brackets as [<protocol>: <standard>].
   
   When the protocol/standard is represented by several instances divided by a forward slash "/", the final solution may contain several protocols/standards or is still open for discussion.

S-ENDA harvest context
======================

The below figure illustrates S-ENDA's and Geonorge's position in the national and international context. As illustrated, GeoNorge CSW harvesting should also make S-ENDA metadata findable by other portals. This does not mean, however, that S-ENDA shall not provide catalog services in, e.g., DCAT or schema.org to provide direct harvesting access from the other portals at a later stage.

.. uml:: harvest_context.puml

S-ENDA provider context
=======================

* **Data Provider:** Produces discovery and configuration (meta)data and wants to make them discoverable and available to users
* **Service Provider:** Creates data services, and wants to make the data services discoverable and available to users

If a data provider wishes to assign a DOI to their dataset, there are three alternatives: 

#. They register a DOI following established procedures in their own organisation (e.g., `DOI registration at MET <dm_recipes.html#doi-registration-at-met>`_)
#. The S-ENDA Dynamic Geo-Assets API system handles DOI registration (and update) through the DataCite API
#. If they do not wish to have a DOI assigned to their dataset, this is also possible.

.. uml:: provider_context.puml

S-ENDA search context
=====================

The goal of the project is to make sure that all kinds of potential users of dynamical geodata will be able to find and use the data. There is a broad spectrum of users with varying expertise in data management and domain knowledge when it comes to dynamical geodata. In the search context diagram, we focus on *general* and *advanced users*. They are defined as follows:

* **General User:** Any user interested in dynamical geodata
* **Advanced User:** An experienced user who knows how to access and process data in their tool of choice (in addition to the WebUI portals they need a machine-to-machine interface, which they can integrate in their software or command line tools)

.. uml:: search-context.puml

S-ENDA Discovery Metadata Service Boundary 
==========================================

Context with a central catalogue
--------------------------------

At present, there is no way for any system to know the other systems apriori. Each system must be informed about the existence of other systems. In the context of a central S-ENDA catalogue, external systems such as Geonorge and ADC harvest metadata from the central S-ENDA catalogue. This system then knows about the internal data centres in S-ENDA (serving dynamical geodata), and performs metadata harvesting from these. This is illustrated below.

   .. uml:: context.puml


Context with a distributed S-ENDA Discovery Metadata Service solution
---------------------------------------------------------------------

An alternative solution to the central catalogue system, is a system based on a gossip protocol [2]_. In this system, the distributed data centres use peer-to-peer *gossip* to ensure that metadata is disseminated to all members of the *S-ENDA Discovery Metadata Service* system. In this setting, there is no dependence on a central catalog, and the external systems can connect to any internal node in order to discover all of them. This would be a more truly *distributed system* but is challenging to get to work in practice. The context diagram for such a solution is shown below.

.. uml:: context-gossip.puml


-------------------------
S-ENDA C4 Context Diagram
-------------------------

For simplicity, a node is hereinafter equivalent to the *S-ENDA Central Catalogue* or a node in the *S-ENDA aggregated (gossip coordinated)* system.

.. uml:: puml/S-ENDA-metadata-service-context-diagram.puml

S-ENDA Discovery Metadata Service - C4 container diagram
========================================================

.. uml:: S-ENDA-metadata-service-container-diagram.puml

.. note::

   * File-level metadata is editable only via ACDD compliant NetCDF-CF files. Higher level datasets (i.e., collections and series) are added via the *CLI Registrar* or the *Web Application*, and stored in their own catalogue (IS THIS NECESSARY?). The file-level metadata can contain parent-child relationships to the higher level datasets (series/collections). The Dynamic Geo-Assets API in this version is essentialy replaced by a set of tools assisting in creation of metadata in ACDD.
   * api.met.no and similar APIs that serve merged data, point to the source datasets in the *Service Discovery Metadata*
   * APIs that serve single datasets (e.g., Frost, after it has been decided what is a dataset, collection and series) needs to be better displayed here (at the moment we store netcdf-cf files from Frost but this is not the intention for the long term)


Dataset catalog service API - C4 component diagram
--------------------------------------------------

.. uml:: pyCSW_MMD_component_diagram.puml

For the MMD variant we would need to write the MMD plugin and output schema. See pyCSW docs at https://docs.pycsw.org/en/2.4.2/introduction.html.



.. note::

   * (*) Harvesting by pyCSW from the Discovery Metadata Store is currently only supported by ISO19139 and MMD (through XSLT and a script) - plugins for GeoDCAT-AP and MMD are needed in pyCSW if we want to use that
   * I still need to do some consistency checking before we discuss...

Production Hubs - C4 container diagram
======================================

.. See commented code in S-ENDA-metadata-service-context-diagram.puml


Distribution Systems - C4 container diagram 
===========================================

.. See commented code in S-ENDA-metadata-service-context-diagram.puml

.. uml:: S-ENDA-data-distribution-container-diagram.puml

S3/Zarr - C4 component diagram
------------------------------

.. note:: This is part of a distribution system. The diagram below should be updated to reflect the distribution system container in the context diagram above.

We categorize data consumers in three levels:

* :ref:`advanced-consumers`
* :ref:`intermediate-consumers`
* :ref:`simple-consumers`

The system described here is concerned with :ref:`advanced-consumers` and :ref:`data-producers`.

Functional requirements
^^^^^^^^^^^^^^^^^^^^^^^

* :ref:`data-producers` should be able to produce a dataset and upload results to the data access service without time-consuming transformations
* :ref:`advanced-consumers` must be able to download a copy of the entire dataset
* :ref:`advanced-consumers` must be able to stream and filter parts of the dataset
* :ref:`advanced-consumers` need access to enough use metadata to be able to locally post-process, reproject, etc., the dataset
* The data access service must support the FAIR principles, in particular (meta)data interoperability and reusability
* The transport mechanism used in the data access service needs to be a widely adopted standard solution, and it must be open-source
* The dataset needs to be on a widely adopted open data format standard
* The data access service as a whole needs to be easy to use with familiar tools from the meteorological/climate/oceanographic domain, both for upload and download
* The data access service must work together with an event-driven production system
* The data acccess service should support the Harmonised Data API from the European Weather Cloud
* :ref:`advanced-consumers` need to able to give feedback on the data access service and each individual dataset.


Quality attributes
^^^^^^^^^^^^^^^^^^

* The total throughput and storage size for the data access service need to scale with massively increasing dataset sizes
* The total throughput, storage size and number of objects of the data access service need to scale with massively increasing number of datasets
* Scaling for increasing size of datasets and increasing number of datasets must not significantly increase latency or decrease throughput for individual requests
* Response time for first-byte in a response should be low, e.g < 50ms
* The relationship between response time and size of data requested should be predictable, and not worse than a linear increase in response time with data size

Constraints
^^^^^^^^^^^

* The data access service has no search mechanism for datasets, and assumes that the datasets can be listed/found/searched through a separate metadata catalog

S3/Zarr - C4 component diagram
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. uml:: dataaccess.puml



.. [1] https://en.wikipedia.org/wiki/Catalogue_Service_for_the_Web

.. [2] https://en.wikipedia.org/wiki/Gossip_protocol
