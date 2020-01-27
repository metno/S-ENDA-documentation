S-ENDA Architecture
"""""""""""""""""""""""""""

S-ENDA architecture is described using the C4 model (https://c4model.com/).
C4 does not define any properties based on the directionality
of the used arrows so each arrow should have a textual
description to avoid disambiguity.

We draft the initial version of the architecture with emphasis
on the goal and use cases of the first sprint of the project.

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
  wants to know sea-water temperature at the event location `#37 <https://github.com/metno/S-ENDA-documentation/issues/37>`_
- A user shall extract observed and forecasted temperature
  time series data values over Longyearbyen `#35 <https://github.com/metno/S-ENDA-documentation/issues/35>`_
- Farmer in Malawi use case `#2 <https://github.com/metno/S-ENDA-documentation/issues/2>`_
- A user at the Environment Directorate wants to investigate the vegetation state in a given area
  based on measurements from Sentinel-2 and use the results in their decision making system 
  `#31 <https://github.com/metno/S-ENDA-documentation/issues/31>`_
- A tourist guide wants to look at the cloud for a specific
  region at night for the visibility of Northern lights `#38
  <https://github.com/metno/S-ENDA-documentation/issues/38>`_

Context diagram
===============

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
handling and domain knowledge when it comes to dynamical geodata. In the context diagram, we focus
on *general* and *advanced users*. They are defined as follows:

* **General user:** Any user interested in dynamical geodata.
* **Advanced user:** An experienced user who knows how to access and process data in their tool of choice. Besides the WebUI portals they need a machine-to-machine interface, so that they can integrate with their code or command line tools.

Providers
---------

* **Data provider:** Produces data with respective metadata and wants to make them discoverable and available to the users
* **Service Provider:** Creates services that serve data and wants to make them discoverable and available to the users


Container diagram
=================

  .. uml:: container.puml

Data and service providers interact with a Web data/service registration User Interface (UI) or
command line (console) registration tool to register their data/service. These tools communicate
with the Metadata store via a web data/service registration API. The contents of the
metadata store are served as CSW using pyCSW API.

  .. [#] https://en.wikipedia.org/wiki/Catalogue_Service_for_the_Web
