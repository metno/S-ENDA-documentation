Architecture of S-ENDA Find
"""""""""""""""""""""""""""

S-ENDA architecture is described using the C4 model (https://c4model.com/)
C4 does not define any properties based on the directionality
of the used arrows so each arrow should have a textual
description to avoid disambiguity.

We draft the initial version of the architecture with emphasis
on the goal and use cases of the first sprint of the project.

The goal
========
To draft the architecture for S-ENDA find and access,
and establish metadata handling to lift the user experience
in finding dynamic geodata to a new level


The use cases
=============
- An outdoor swimming competition organizer
  wants to know sea-water temperature at the event location #37
- A user shall extract observed and forecasted temperature
  time series data values over Longyearbyen #35
- Farmer in Malawi use case #2
- En bruker ved miljødirektoratet vil undersøke
  vegetasjonstilstand i et gitt område basert på målinger fra Sentinel-2 #31
- Miljødirektoratet skal bruke dynamiske geodata
  data i sitt beslutningssystem #16
- A tourist guide wants to look at the cloud for a specific
  region at night for the visibility of Northern lights #38

Context diagram
===============

The figure below illustrates the top level view of the architecture.
A mock of "S-ENDA Find" is the product of Sprint 1. The system interfaces
with data and service providers via a Web UI and a console app. The
"S-ENDA Find" system exposes a CSW interface for external portals, so that
they can harvest metadata information about datasets previously registered
with "S-ENDA Find". "S-ENDA Find" also interacts with the DataCite API when
a DOI needs to be created or updated.

   .. uml:: context.puml


Users
-----

The goal of the project is to make sure that all kinds of potential users
of dynamical geodata will be able to find and use the data. There is a broad
spectrum of users with varying expertise in data handling and domain knowledge
when it comes to dynamical geodata.

General user
############
Any user interested in dynamical geodata.

Advanced user
#############
An experienced user who knows how to access and process data in their tool
of choice. Besides the WebUI portals they need a machine-to-machine interface,
so that they can integrate with their code or command line tools.

Providers
---------

Data provider
#############
Produces data with respective metadata and wants to make them discoverable
available to the users.

Service Provider
#########
Creates services that serve data and wants to make them discoverable and
available to the users.


Container diagram
=================

  .. uml:: container.puml

Data and service providers interact with WebUI or console applications that
via an API communicate with the Metadata store. The contents of
the metadatastore are served as CSW using pyCSW API.

New datasets and services can be added or modified in the Metadata store via
an API or using WebUI or command lines tools that interact with the API.
