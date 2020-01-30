S-ENDA Architecture
"""""""""""""""""""""""""""

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

We need to clarify which protocol GeoNorge would prefer to use to harvest
metadata from us. Our preference is CSW. Also how does GeoNorge provide data
further to search engines and international portals.

Goal and use cases of S-ENDA sprint no. 1
==========================================

Goal
----

To draft the architecture for S-ENDA find and access,
and establish metadata handling to lift the user experience
in finding dynamic geodata to a new level


Use cases
---------------
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

Context 
==========

.. note:: This is a draft under development. We highly appreciate input and help in correcting any mistakes.

S-ENDA is part of a larger effort within the national geodata strategy (*"Alt skjer et sted"*), and
relates to this strategy through Geonorge, which is developed and operated by the Norwegian Mapping
Authority (*"Kartverket"*). GeoNorge, in turn, relates to the European Inspire Geoportal through the
Inspire directive. In particular, S-ENDA is responsible for *Action 20* of the Norwegian geodata
strategy.  The goal of action 20 is to *establish a distributed, virtual data center for use and
management of dynamic geodata*. S-ENDA's vision is that *everyone, from professional users to the
general public, should have easy, secure and stable access to dynamic geodata*. The below figure
illustrates S-ENDA's and Geonorge's position in the national and international context.

.. uml:: 

   @startuml S-ENDA context diagram
   !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Context.puml

   LAYOUT_LEFT_RIGHT

   System_Ext(edp, "European Data Portal")
   System_Ext(searchengine, "Web Search Engines")
   System_Ext(inspire, "Inspire Geoportal")
   System_Ext(datanorge, "Data Norge")
   System_Boundary(geonorge, "GeoNorge"){
      System_Ext(static_maps, "Static maps")
   }
   System(senda, "S-ENDA dynamical geodata")

   Rel(geonorge, senda, "Harvests metadata", "CSW")
   Rel(searchengine, geonorge, "Harvests metadata", "DCAT")
   Rel(inspire, geonorge, "Harvests metadata", "?")
   Rel(datanorge, geonorge, "Harvests metadata", "?")
   Rel(edp, datanorge, "Harvests metadata", "?")

   @enduml

The figure below illustrates the top level view of the architecture.
A mock of "S-ENDA Find" is the product of Sprint 1.
Data and service providers register their datasets or services via a WebUI,
console app or directly via requests against the web registration API.
The "S-ENDA Find" system exposes a CSW [#]_ interface for external portals, so that
they can harvest metadata information about datasets previously registered
with "S-ENDA Find". "S-ENDA Find" also interacts with the DataCite API when
a DOI needs to be created or updated.

   .. uml:: context.puml


Users
-----

The goal of the project is to make sure that all kinds of potential users of dynamical geodata will
be able to find and use the data. There is a broad spectrum of users with varying expertise in data
management and domain knowledge when it comes to dynamical geodata. In the context diagram, we focus
on *general* and *advanced users*. They are defined as follows:

* **General User:** Any user interested in dynamical geodata
* **Advanced User:** An experienced user who knows how to access and process data in their tool of choice (in addition to the WebUI portals they need a machine-to-machine interface, which they can integrate in their software or command line tools)

Providers
---------

* **Data Provider:** Produces (meta)data and wants to make the (meta)data discoverable and available to users
* **Service Provider:** Creates data services, and wants to make the data services discoverable and available to users


Container diagram
=================

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


  .. [#] https://en.wikipedia.org/wiki/Catalogue_Service_for_the_Web
