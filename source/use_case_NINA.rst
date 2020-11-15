Biodiversity Data from NINA
"""""""""""""""""""""""

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

A researcher needs data to answer their research questions. They might first go to gbif.org but 
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

Normal Flow
===========

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

User actions:
- User searches to find all occurences of species X in and area over time.
- User tries to also find weather observations or other weather information for that area and time. 

System responses:


Alternative Flows
=================

.. Other, legitimate usage scenarios that can take place within this Use Case.

Exceptions
==========

.. Anticipated error conditions that could occur during execution of the Use Case, and how the
   system is to respond to those conditions, or the Use Case execution fails for some reason.

Location does not have data, the search is for an area outside our datasets:

- Understandable error message: "Observations not available for this point, closest point with observations is..."


Includes
========

.. Other Use Cases that are included (“called”) by this Use Case (common functionality appearing in
   multiple Use Cases can be described in a separate Use Case included by the ones that need that
   common functionality).

Notes and Issues
================

.. Additional comments about this Use Case and any remaining open issues that must be resolved. (It
   is useful to Identify who will resolve each such issue and by what date.)

Relevant software
=================

Relevant datasets
=================

UML diagram
===========

.. UML diagram, example;

UML diagram, example;

.. uml::

   @startuml
   Alice -> Bob: Hi!
   Alice <- Bob: How are you?
   @enduml
