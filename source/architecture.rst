===================
S-ENDA Architecture
===================

S-ENDA architecture is described using the C4 model (https://c4model.com/).
C4 does not define any properties based on the directionality
of the used arrows so each arrow should have a textual
description to avoid disambiguity.

We draft the initial version of the architecture with emphasis
on the goal and use cases of the first sprint of the project.
Some parts of the design are not complete, notably we will need to choose
the implementation of the metadata store. Amongst viable possibilities is
one of the document-oriented databases
(https://en.wikipedia.org/wiki/Document-oriented_database)

We need to clarify which protocol GeoNorge would prefer to use to harvest metadata from us. Our
preference is the `Open Geospatial Consortium (OGC) <https://www.opengeospatial.org/>`_ `Catalogue
Service for the Web (CSW) <https://www.opengeospatial.org/standards/cat>`_. Also how does GeoNorge
provide data further to search engines and international portals.

-----------------------------------------
Goal and use cases of S-ENDA sprint no. 1
-----------------------------------------

Goal
====

To draft the architecture for S-ENDA find and access,
and establish metadata handling to lift the user experience
in finding dynamic geodata to a new level


Use cases
=========

- An outdoor swimming competition organizer
  wants to know sea-water temperature at the event location `#37 <https://github.com/metno/S-ENDA-documentation/issues/37>`_ or
  `Outdoor swimming competition in readthedocs <https://s-enda-documentation.readthedocs.io/en/latest/use_case_swimming_comp.html>`_
- A user shall extract observed and forecasted temperature
  time series data values over Longyearbyen `#35 <https://github.com/metno/S-ENDA-documentation/issues/35>`_
- Farmer in Malawi use case `#2 <https://github.com/metno/S-ENDA-documentation/issues/2>`_
- A user at the Environment Directorate wants to investigate the vegetation state in a given area
  based on measurements from Sentinel-2 and use the results in their decision making system
  `#31 <https://github.com/metno/S-ENDA-documentation/issues/31>`_
- A tourist guide wants to look at the cloud for a specific
  region at night for the visibility of Northern lights `#38
  <https://github.com/metno/S-ENDA-documentation/issues/38>`_ or
  `Find latest satellite image describing cloud cover for visibility of Northern Lights in readthedocs <https://s-enda-documentation.readthedocs.io/en/latest/use_case_northern_light.html>`_

--------
Contexts
--------

.. note:: This is a draft under development. We highly appreciate input and help in correcting any mistakes.

S-ENDA is part of a larger effort within the national geodata strategy (*"Alt skjer et sted"*), and relates to this strategy through Geonorge, which is developed and operated by the Norwegian Mapping Authority (*"Kartverket"*). GeoNorge, in turn, relates to the European Inspire Geoportal through the Inspire directive. In particular, S-ENDA is responsible for *Action 20* of the Norwegian geodata strategy.  The goal of action 20 is to *establish a distributed, virtual data center for use and management of dynamic geodata*. S-ENDA's vision is that *everyone, from professional users to the general public, should have easy, secure and stable access to dynamic geodata*. 

The vision of S-ENDA and the goal of action 20 are aligned with international guidelines, in particular the `FAIR Guiding Principles for scientific data management and stewardship <https://www.nature.com/articles/sdata201618>`_. To achieve these goals, we focus initially on two main systems: (1) S-ENDA Find, and (2) S-ENDA Access. Provided these two systems are well designed and documented, they should support the I(nteroperable) and R(eusable) of the FAIR principles as well.

A mock of *S-ENDA Find* is the product of Sprint 1.  Data and service providers register (see `S-ENDA register context`_) their datasets or services via a WebUI or a web registration API in their own S-ENDA system nodes (see `S-ENDA Find Boundary`_). These nodes expose CSW [1]_ catalogue services for harvesting, either in `Context with a central catalogue`_, or in `Context with a distributed S-ENDA find solution`_. 


S-ENDA harvest context
======================

The below figure illustrates S-ENDA's and Geonorge's position in the national and international context. As illustrated, GeoNorge CSW harvesting should also make S-ENDA metadata findable by other portals. This does not mean, however, that S-ENDA shall not provide catalog services in, e.g., DCAT or schema.org to provide direct harvesting access from the other portals at a later stage.

.. uml:: 

   @startuml S-ENDA context diagram
   !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Context.puml

   LAYOUT_LEFT_RIGHT

   System_Boundary(portals, "Portals"){
      System_Ext(edp, "European Data Portal")
      System_Ext(searchengine, "Web Search Engines")
      System_Ext(inspire, "Inspire Geoportal")
      System_Ext(datanorge, "Data Norge")
      System_Ext(geonorge, "GeoNorge")
      System_Ext(adc, "ADC")
   }

   'Not sure about the following...
   System_Boundary(senda, "S-ENDA Find"){
      System(sendafind, "S-ENDA Find Nodes")
   }

   Rel(adc, senda, "Harvests metadata", "CSW")
   Rel(geonorge, senda, "Harvests metadata", "CSW")
   Rel(searchengine, geonorge, "Harvests metadata", "DCAT")
   Rel(inspire, geonorge, "Harvests metadata", "?")
   Rel(datanorge, geonorge, "Harvests metadata", "?")
   Rel(edp, datanorge, "Harvests metadata", "?")

   @enduml

S-ENDA register context
=======================

* **Data Provider:** Produces (meta)data and wants to make the (meta)data discoverable and available to users
* **Service Provider:** Creates data services, and wants to make the data services discoverable and available to users

If a data provider wishes to assign a DOI to their dataset, there are two alternatives: 

#. They register a DOI following established procedures in their own organisation, or 
#. The S-ENDA Find system handles DOI registration (and update) through the DataCite API. If they do not wish to have a DOI assigned to their dataset, this is also possible.

.. uml::

   @startuml S-ENDA register context
   !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Context.puml

   LAYOUT_LEFT_RIGHT

   System(sendafind, "S-ENDA Find Node")

   Boundary(providers, "Providers") {
      Person(developer, "Service Provider (SP)")
      Person(dataprovider, "Data Provider (DP)")
   }

   System_Ext(doiregistrar, "DOI Registrar")

   Rel(dataprovider, doiregistrar, "Alt. 1: DP registers DOI")
   Rel(sendafind, doiregistrar, "Alt. 2: S-ENDA Find registers DOI", "DataCite API")
   Rel(dataprovider, sendafind, "DP registers dataset", "API/Web UI")
   Rel(sendafind, dataprovider, "S-ENDA find gives feedback", "Validation/Monitoring/user questions")

   Rel(developer, sendafind, "SP registers service", "API/Web UI")
   Rel(sendafind, developer, "S-ENDA find gives feedback", "Validation/Monitoring/user questions")

   @enduml

S-ENDA search context
=====================

The goal of the project is to make sure that all kinds of potential users of dynamical geodata will
be able to find and use the data. There is a broad spectrum of users with varying expertise in data
management and domain knowledge when it comes to dynamical geodata. In the search context diagram, we focus
on *general* and *advanced users*. They are defined as follows:

* **General User:** Any user interested in dynamical geodata
* **Advanced User:** An experienced user who knows how to access and process data in their tool of choice (in addition to the WebUI portals they need a machine-to-machine interface, which they can integrate in their software or command line tools)

.. uml::

   @startuml S-ENDA register context
   !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Context.puml

   LAYOUT_LEFT_RIGHT

   Boundary(users, "Users") {
      Person(advanced, "Advanced user")
      Person(user, "General user")
   }

   System_Boundary(portals, "Portals") {
      System_Ext(geonorge, "GeoNorge")
      System_Ext(searchengine, "Web Search Engines")
      System_Ext(adc, "ADC")
      System_Ext(europeandataportal, "European Data Portal")
   }

   System_Boundary(sendafind, "S-ENDA Find"){
      System(sendafind_nodes, "S-ENDA Find Nodes")
   }

   Rel(users, portals, "Users search portals", "Web-UI/API")
   Rel(advanced, sendafind, "Users search S-ENDA", "OpenSearch, CSW")

   @enduml

S-ENDA Find Boundary 
====================

Context with a central catalogue
--------------------------------

At present, there is no way for any system to know the other systems apriori. Each system must be informed about the existence of other systems. In the context of a central S-ENDA catalogue, external systems such as Geonorge and ADC harvest metadata from the central S-ENDA catalogue. This system then knows about the internal data centres in S-ENDA (serving dynamical geodata), and performs metadata harvesting from these. This is illustrated below.

   .. uml:: context.puml


Context with a distributed S-ENDA find solution
-----------------------------------------------

An alternative solution to the central catalogue system, is a system based on a gossip protocol
[2]_. In this system, the distributed data centres use peer-to-peer *gossip* to ensure that metadata
is disseminated to all members of the *S-ENDA Find* system. In this setting, there is no dependence
on a central catalog, and the external systems can connect to any internal node in order to discover
all of them. This would be a more truly *distributed system*. The context diagram for such a
solution is shown below.

.. uml:: context-gossip.puml

----------------------------------
S-ENDA Find Node Container Diagram
----------------------------------

  .. uml:: container.puml

Data and service providers interact with a Web data/service registration User Interface (UI) or
command line (console) registration tool to register their data/service. These tools communicate
with the Metadata store via a web data/service registration API. The contents of the
metadata store are served as CSW using pyCSW API.

**Dynamic Geo-Assets API**

An application that mocks a metadata store and an API that exposes metadata in
MMD. The application provides functionality for registering new datasets and
data services, updating existing datasets and services. The application
validates the metadata and provides detailed user feedback before storing the
metadata.


  .. [1] https://en.wikipedia.org/wiki/Catalogue_Service_for_the_Web

  .. [2] https://en.wikipedia.org/wiki/Gossip_protocol
