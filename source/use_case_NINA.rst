Biodiversity Data from NINA
""""""""""""""""""""""""""""

..

Use Case Goal
=============

.. Required

NINA biodiversity data is available / linked in S-Enda portal. 
Biodiversity observation data shows species occurance in space and time.

Therefore a simple use of this data to search how many times was species X 
recorded in a given area, and also over a time range. By linking the data 
in with meteorological data it is hoped that it will be easier to cross reference
this data with weather observations, or potentially model data.

Actors
======

.. Required

- Data owner (NINA)
- Data owner (observations)(Obsklim on behalf of different owners)
- Data owner (model)(Director SUV, maybe on behalf of others)
- Data Provider (NINA)
- Data provider (observations)(Obsklim)
- Data provider (model)(SUV)


Trigger
=======

.. Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

A researcher needs data to answer their research questions. They might first go to https://www.gbif.org/ but 
then when they want to cross reference with weather data search and find MET services.  

Pre-conditions
==============

.. Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

* Model output is gridded data that are stored on a server at MET Norway
* Observations are stored on a server at MET Norway
* Observations must be made available and be well defined (with metadata)
* There is a high degree of standardisation for all types of data

Post-conditions
===============

.. The state of the system at the conclusion of the Use Case execution.

* User is able to find biodiversity data.
* User is able to cross reference biodiversity data with weather observation data.
* User is able to give feedback on quality of the data.

Normal Flow
===========

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

User actions:
- User searches to find all occurences of species X in and area over time.
- User tries to also find weather observations or other weather information for that area and time. 
- User examines data and wants finds sections that are of potentially low quality, they want to report this back to integrate with the data.

System responses:


Alternative Flows
=================

.. Other, legitimate usage scenarios that can take place within this Use Case.

- The user finds the biodiversity data on a different website, and then only wants to find relavant weather data from MET.

Exceptions
==========

.. Anticipated error conditions that could occur during execution of the Use Case, and how the
   system is to respond to those conditions, or the Use Case execution fails for some reason.

Location does not have data, the search is for an area outside our datasets:

- Understandable error message: "Observations not available for this point, closest point with observations is..."


Includes
========

N/A

Notes and Issues
================

N/A

Relevant software
=================

N/A

Relevant datasets
=================

N/A

UML diagram
===========

.. UML diagram, example;

UML diagram, example;

.. uml::

   @startuml

   LAYOUT_LEFT_RIGHT

   Person(researcher, "Biodiversity researcher")

   System(senda_search_interface, "S-ENDA Metadata Service/Central")

   Rel(senda_search_interface, researcher, "Returns applicable biodiversity and weather datasets.", "Web UI")
   Rel(researcher, senda_search_interface, "Searches for biodivesity data and related weather data for a region and time range.", "Web UI")
   @enduml
