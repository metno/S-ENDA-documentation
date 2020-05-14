===================
S-ENDA Architecture
===================

About the architecture drafts:

- They are described using the C4 model (https://c4model.com/). C4 does not define any properties based on the directionality of the used arrows so each arrow should have a textual description to avoid disambiguity
- They are work in progress, and many updates are expected as we dig into the details
- The implementation of the metadata store is not yet decided. Amongst viable possibilities is one of the document-oriented databases (https://en.wikipedia.org/wiki/Document-oriented_database)
- They are to a high degree based on the use cases outlined in :ref:`use-cases-section`

--------
Contexts
--------

.. note:: This is a draft under development. We highly appreciate input and help in correcting any mistakes.

S-ENDA is part of a larger effort within the national geodata strategy (*"Alt skjer et sted"*), and relates to this strategy through Geonorge, which is developed and operated by the Norwegian Mapping Authority (*"Kartverket"*). GeoNorge, in turn, relates to the European Inspire Geoportal through the Inspire directive. In particular, S-ENDA is responsible for *Action 20* of the Norwegian geodata strategy.  The goal of action 20 is to *establish a distributed, virtual data center for use and management of dynamic geodata*. S-ENDA's vision is that *everyone, from professional users to the general public, should have easy, secure and stable access to dynamic geodata*. 

The vision of S-ENDA and the goal of action 20 are aligned with international guidelines, in particular the `FAIR Guiding Principles for scientific data management and stewardship <https://www.nature.com/articles/sdata201618>`_. To achieve these goals, we focus initially on two main systems: (1) S-ENDA Metadata Service, and (2) S-ENDA Data Access Service.

About the *S-ENDA Metadata Service*: 

- Data and service providers register (see `S-ENDA provider context`_) their datasets or services via a WebUI or a web registration API in their own system nodes (see `S-ENDA Metadata Service Boundary`_). These nodes expose CSW [1]_ catalogue services for harvesting, either in `Context with a central catalogue`_, or in `Context with a distributed S-ENDA Metadata Service solution`_. 

.. note::

   Relations in the C4 diagrams illustrate protocol and standard in brackets as [<protocol>: <standard>].
   
   When the protocol/standard is represented by several instances divided by a forward slash "/", the final solution may contain several protocols/standards or is still open for discussion.

S-ENDA harvest context
======================

The below figure illustrates S-ENDA's and Geonorge's position in the national and international context. As illustrated, GeoNorge CSW harvesting should also make S-ENDA metadata findable by other portals. This does not mean, however, that S-ENDA shall not provide catalog services in, e.g., DCAT or schema.org to provide direct harvesting access from the other portals at a later stage.

.. uml:: harvest_context.puml

S-ENDA provider context
=====================================

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

S-ENDA Metadata Service Boundary 
================================

Context with a central catalogue
--------------------------------

At present, there is no way for any system to know the other systems apriori. Each system must be informed about the existence of other systems. In the context of a central S-ENDA catalogue, external systems such as Geonorge and ADC harvest metadata from the central S-ENDA catalogue. This system then knows about the internal data centres in S-ENDA (serving dynamical geodata), and performs metadata harvesting from these. This is illustrated below.

   .. uml:: context.puml


Context with a distributed S-ENDA Metadata Service solution
-----------------------------------------------------------

An alternative solution to the central catalogue system, is a system based on a gossip protocol [2]_. In this system, the distributed data centres use peer-to-peer *gossip* to ensure that metadata is disseminated to all members of the *S-ENDA Metadata Service* system. In this setting, there is no dependence on a central catalog, and the external systems can connect to any internal node in order to discover all of them. This would be a more truly *distributed system*. The context diagram for such a solution is shown below.

.. uml:: context-gossip.puml

----------------------------------------------
S-ENDA Metadata Service Node Container Diagram
----------------------------------------------

Data and service providers interact with a Web data/service registration User Interface (UI) or command line (console) registration tool to register their data/service. These tools communicate with the Metadata store via a web data/service registration API. The contents of the metadata store are served as CSW using pyCSW API.

First iteration with xslt and some python code to modify MMD metadata
=======================================================================

  .. uml:: puml/container.puml

A metadata store and an API that exposes metadata in MMD. The application listens to an event engine that provides information from the production system. S-ENDA Metadata Service should also provide functionality for registering and updating datasets and data services. The application should validate the metadata and provide detailed user feedback before storing the metadata.

Dynamic Geo-Assets Component Diagram
------------------------------------

.. uml:: dgaAPI_component.puml

An alternative based on two levels of metadata
===============================================
File-level metadata editable only via ACDD, higher level in their own catalogue. The file-level
metadata can contain parent-child link relationships to the higher level datasets (series/collections).
The Dynamic Geo-Assets API in this version is essentialy replaced by a set of tools assisting in
creation of metadata in ACDD.

  .. uml:: acdd_and_curated_catalogue.puml

Second iteration with more containers and functionality
=====================================================================

.. uml:: new_S_ENDA_metadata_service_container.puml

The Dynamic Geo-Assets API is split into several containers with different purposes. It is unclear how the Usage Statistics container should be linked to the other containers.

Third iteration with more containers and functionality
=====================================================================

.. uml:: newer_S_ENDA_metadata_service_container.puml

The Dynamic Geo-Assets API is split into several containers with different purposes.

Merge of three previous headings (REMOVE PREVIOUS WHEN WE AGREE AND KEEP THIS FOR LATER REFERENCE)
===================================================================================================

.. uml:: S-ENDA-metadata-service-container-diagram.puml

.. note::

   * (*) Harvesting by pyCSW from the Metadata Store is currently only supported by ISO19139 and MMD (through XSLT and a script) - plugins for GeoDCAT-AP and MMD are needed in pyCSW if we want to use that
   * I still need to do some consistency checking before we discuss...

PyCSW diagram
--------------
.. uml:: pyCSW_harvesting_diagram.puml

PyCSW component diagram for a system based on MMD
--------------------------------------------------

.. uml:: pyCSW_MMD_component_diagram.puml

For the MMD variant we would need to write the MMD plugin and output schema. See pyCSW docs at https://docs.pycsw.org/en/2.4.2/introduction.html.

  .. [1] https://en.wikipedia.org/wiki/Catalogue_Service_for_the_Web

  .. [2] https://en.wikipedia.org/wiki/Gossip_protocol
