Biodiversity Data from NINA
""""""""""""""""""""""""""""

..

Use Case Goal
=============

.. Required

Biodiversity observation data shows species occurance in space and time.

**Goal:** Creation of a model for spatial distribution of the Arctic fox in Scandinavia. 

We follow the model presented in the :ref:`users-definition` section:

* **Producers:** the Norwegian Institute for Nature Research (NINA)

* **Consumers:** :ref:`advanced-consumers` (e.g., researchers), :ref:`intermediate-consumers`, and :ref:`simple-consumers`  (e.g., journalists)

Actors
======

.. Required

- Data owner (NINA)
- Data owner (observations)(Obsklim on behalf of different owners)
- Data Provider (NINA)
- Data provider (observations)(Obsklim)


Trigger
=======

.. Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

A researcher aims to investigate what factors determine the spatial 
distribution of Arctic fox (Vulpes lagopus; Linnaeus, 1758) in Scandinavia. 


Pre-conditions
==============

.. Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

* NINA biodiversity data is available / linked in S-Enda portal. 
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

Producer
""""""""

User actions:
1. Review the literature on Arctic fox distribution and identify plausible (ecologically) variables that could explain the distribution
2. Search for occurrence data for Arctic fox in the geographic region of interest could also be survey data (more robust estimates of presence or absence than ad hoc sighting data) 
   - Deduplicate the occcurence data
   - Indentify biases in the data generation. 
3. Find covariates that explain the distribution of Arctic fox. Particularly Climate data and observations.
   - Covariates could be e.g Red fox distribution or locations (from gbif or other); Small mammal records (line transect surveys carried out in Norway and Sweden), altitude (from a DEM), NOA (related to winter conditions), climate data, distance to forest line, etc.
   - Identify and mitigate for biases in covariates 
4. Model the distribution of Arctic fox in relation to the covariates taking into account the major bias (which is a lack of absence points) and time. Integrate ancillary information into the model (survival estimates, reproduction rates etc. climate change models) to develop predictive models. 

Consumer
""""""""

End users of the model could be wildlife managers and NINA researchers


Alternative Flows
=================

.. Other, legitimate usage scenarios that can take place within this Use Case.

- The occurence data is found on on gbif.org or on data repositories (usually a part of published papers that have archived data) - there are 410 records with location data on gbif. 
- The climate and weather observation data must still be found from MET. 

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

   @startuml Nina use case
   !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Container.puml

   LAYOUT_LEFT_RIGHT

   Person(researcher, "Biodiversity researcher")

   System(senda_search_interface, "S-ENDA Metadata Service/Central")

   Rel(senda_search_interface, researcher, "Returns applicable biodiversity and weather datasets.", "Web UI")
   Rel(researcher, senda_search_interface, "Searches for biodivesity data and related weather data for a region and time range.", "Web UI")
   @enduml
