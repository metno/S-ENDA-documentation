Model of Arctic Fox Distribution in Scandinavia
================================================

..

Use Case Goal
-------------

.. Required

**Goal:** Creation of a model for spatial distribution of the Arctic fox in Scandinavia. 

Biodiversity observation data shows species occurrences in space and time. 
This can be found from many different sources (including from outside NINA), and combined into a distribution model.

We follow the model presented in the :ref:`users-definition` section:

* **Producers:** the Norwegian Institute for Nature Research (NINA)

* **Consumers:** :ref:`advanced-consumers` (e.g., researchers), :ref:`intermediate-consumers`, and :ref:`simple-consumers`  (e.g., journalists)

.. uml:: puml/user_analysis/arctic_fox_model_producer.puml


Actors
------

.. Required

- Biodiversity occurrence data owner (NINA & other Institutes / sources)
- Model of Arctic fox distribution Provider (NINA)
- Climate and weather observation data owner (Obsklim on behalf of different owners)
- Climate and weather observation data owner (observations)(Obsklim)


Trigger
-------

.. Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

A researcher aims to investigate what factors determine the spatial 
distribution of Arctic fox (Vulpes lagopus; Linnaeus, 1758) in Scandinavia. 


Pre-conditions
--------------

.. Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

* NINA biodiversity discovery metadata is available in S-Enda catalogue endpoint (& thus is also available in Geonorge). 
* Observations are stored on a server at MET Norway
* Observations must be made available and be well defined (with metadata)
* Producer is able to cross reference biodiversity data with climate and weather observation data.
* There is a high degree of standardisation for all types of data

Post-conditions
---------------

.. The state of the system at the conclusion of the Use Case execution.

* Consumer is able to find the distribution model results in the S-enda catalogue endpoint.
* The consumer is able to find and access the underlying datasets used for creating the model (provenance). 
* Producer and consumer are able to give feedback on quality of the data.

Normal Flow
-----------

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

Producer
""""""""

User actions:

1. Review the literature on Arctic fox distribution and identify plausible (ecologically) variables that could explain the distribution.
2. Search for occurrence data for Arctic fox in the geographic region of interest could also be survey data (more robust estimates of presence or absence than ad hoc sighting data). Note: This search could be carried out using the s-enda catalogue endpoint.

  - Deduplicate the occcurence data, since different sources of data can contain the same data record. 
  - Identify biases in the data generation.

3. Find covariates that explain the distribution of Arctic fox. Particularly Climate data and observations.

  - Covariates could be e.g Red fox distribution or locations (from gbif or other); Small mammal records (line transect surveys carried out in Norway and Sweden), altitude (from a DEM), NOA (related to winter conditions), climate data, distance to forest line, etc.
  - Identify and mitigate for biases in covariates 

4. Model the distribution of Arctic fox in relation to the covariates taking into account the major bias (which is a lack of absence points) and time. Integrate ancillary information into the model (survival estimates, reproduction rates etc. climate change models) to develop predictive models. 
5. Model results are made available in the s-enda catalogue.

  - Check licensing of each of the underlying datasets.
  - Give appropriate license to newly created dataset. 

Consumer
""""""""

End users of the model could be wildlife managers and NINA researchers.

Wildlife management authorities might use the results as a base for their policy decisions. 
Other scientists might create similar models and compare them, or create a model for a different species and cross reference. 


Alternative Flows
-----------------

.. Other, legitimate usage scenarios that can take place within this Use Case.

- The occurence data is found on on `gbif.org <https://www.gbif.org/>`_ or on data repositories (usually a part of published papers that have archived data)
- The climate and weather observation data must still be found from MET. 

UML diagram
-----------

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
