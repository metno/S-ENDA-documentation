===================
S-ENDA Architecture
===================

About the architecture drafts:

- They are described using the C4 model (https://c4model.com/). C4 does not define any properties based on the directionality of the used arrows so each arrow should have a textual description to avoid disambiguity
- They are work in progress, and many updates are expected as we dig into the details
- They are to a high degree based on the use cases outlined in :ref:`use-cases-section`

----------------
General Contexts
----------------

.. note:: This is a draft under development. We highly appreciate input and help in correcting any mistakes.

S-ENDA is part of a larger effort within the national geodata strategy (*"Alt skjer et sted"*), and relates to this strategy through Geonorge, which is developed and operated by the Norwegian Mapping Authority (*"Kartverket"*). GeoNorge, in turn, relates to the European Inspire Geoportal through the Inspire directive. In particular, S-ENDA is responsible for *Action 20* of the Norwegian geodata strategy.  The goal of action 20 is to *establish a distributed, virtual data center for use and management of dynamic geodata*. S-ENDA's vision is that *everyone, from professional users to the general public, should have easy, secure and stable access to dynamic geodata*. 

The vision of S-ENDA and the goal of action 20 are aligned with international guidelines, in particular the `FAIR Guiding Principles for scientific data management and stewardship <https://www.nature.com/articles/sdata201618>`_.

..
  .. note::
  
     Relations in the C4 diagrams illustrate protocol and standard in brackets as [<protocol>: <standard>].
     
     When the protocol/standard is represented by several instances divided by a forward slash "/", the final solution may contain several protocols/standards or is still open for discussion.
  
S-ENDA in a national and international context
==============================================

Dynamic geodata is weather, environment and climate-related data that changes in space and time and is thus descriptive of processes in nature. Examples are weather observations, weather forecasts, pollution (environmental toxins) in water, air and sea, information on the drift of cod eggs and salmon lice, water flow in rivers, driving conditions on the roads and the distribution of sea ice. Dynamic geodata provides important constraints for many decision-making processes and activities in society. 

Geonorge is the national website for map data and other location information in Norway. Here, users of map data can search and access such information. Dynamic geodata is one such information type. S-ENDA extends Geonorge by taking responsibility for harmonising the management of dynamic geodata in a consistent manner.

The below figure illustrates S-ENDA's position in the national and international context. As illustrated, GeoNorge CSW harvesting should also make S-ENDA datasets findable by other systems.

.. uml:: puml/architecture/national_and_international_context.puml

..
  Context with a distributed S-ENDA Discovery Metadata Service solution
  ---------------------------------------------------------------------
  
  An alternative solution to the central catalogue system, is a system based on a gossip protocol [2]_. In this system, the distributed data centres use peer-to-peer *gossip* to ensure that metadata is disseminated to all members of the *S-ENDA Discovery Metadata Service* system. In this setting, there is no dependence on a central catalog, and the external systems can connect to any internal node in order to discover all of them. This would be a more truly *distributed system* but is challenging to get to work in practice. The context diagram for such a solution is shown below.
  
  .. uml:: context-gossip.puml
  

-------------------------
S-ENDA C4 Context Diagram
-------------------------

The below diagram describes the S-ENDA system in the boundary for dynamic geodata above. The data consumers are defined in :ref:`users-definition`.

.. uml:: puml/architecture/S-ENDA-context-diagram.puml

S-ENDA Discovery Metadata Service - C4 container diagram
========================================================

.. uml:: puml/architecture/S-ENDA-discovery-metadata-service-container-diagram.puml

.. note::

   * File-level metadata is editable only via ACDD compliant NetCDF-CF files. Higher level datasets (i.e., collections and series) are added via the *CLI Registrar* or the *Web Application*, and stored in their own catalogue (IS THIS NECESSARY?). The file-level metadata can contain parent-child relationships to the higher level datasets (series/collections). The Dynamic Geo-Assets API in this version is essentialy replaced by a set of tools assisting in creation of metadata in ACDD.
   * api.met.no and similar APIs that serve merged data, point to the source datasets in the *Service Discovery Metadata*
   * APIs that serve single datasets (e.g., Frost, after it has been decided what is a dataset, collection and series) needs to be better displayed here (at the moment we store netcdf-cf files from Frost but this is not the intention for the long term)


Dataset catalog service API - C4 component diagram
--------------------------------------------------

..
  .. uml:: puml/architecture/pyCSW_MMD_component_diagram.puml

..
  For the MMD variant we would need to write the MMD plugin and output schema. See pyCSW docs at https://docs.pycsw.org/en/2.4.2/introduction.html.

Production Hubs - C4 container diagram
======================================

.. See commented code in puml/architecture/S-ENDA-discovery-metadata-service-context-diagram.puml


Distribution Systems - C4 container diagram 
===========================================

.. See commented code in puml/architecture/S-ENDA-discovery-metadata-service-context-diagram.puml

.. uml:: puml/architecture/S-ENDA-data-distribution-container-diagram.puml

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

.. uml:: puml/architecture/data-access-component-diagram.puml



..
  .. [1] https://en.wikipedia.org/wiki/Catalogue_Service_for_the_Web
  
  .. [2] https://en.wikipedia.org/wiki/Gossip_protocol
