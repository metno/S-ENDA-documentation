Climate Projection of Yearly Air Temperature in Norway
======================================================

Use Case Goal
-------------

.. Required

   Brief description of the reason for and outcome of this Use Case, or a high-level description of
   the sequence of actions and the outcome of executing the Use Case.

Various users who work with climate adaptation or products for climate adaptation must obtain relevant data on expected future climate change (climate projections), including hydrology and natural hazards. The Norwegian Climate Service Center will calculate new climate and hydrology projections (expected changes in the future) for Norway up to the year 2100.

This use case focuses on the new projections for the yearly average and extreme air temperatures in Norway, forward in time to year 2100.

**Goal:** To produce new climate projections of yearly air temperatures in Norway.

We follow the model presented in the :ref:`users-definition` section:

* **Producers:** the Norwegian Climate Service Center

* **Consumers:** :ref:`advanced-consumers` (e.g., researchers), :ref:`intermediate-consumers`, and :ref:`simple-consumers`  (e.g., journalists)

The knowledge generation is described in the below figure. The data (see :ref:`user-analysis-context`) used to generate the air temperature projections is a combination of gridded historical weather observations (level 3), aggregated time series (level 2), and model simulations (level 4; BUT WHAT EXACTLY?). The information generated from this data is statistics of historical air temperature and simulations of future air temperature using an ensemble of climate models. From this, likely future scenarios can be estimated (knowledge) to provide general and specific information about the future climate. 

.. uml:: information_to_knowledge_klima_leveranse.puml

Actors
------

.. Required

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user
   classes, or roles, identified from the customer community that will use the product.

.. note::

  We need to understand the data flow - what is used, what is produced at intermediate levels (if anything), and what is the end product. Then, the interfaces between each stage are important:

  * do they comply with the FAIR principles?
  * are there any bottlenecks?
  * what can be done to remove the bottlenecks?

Producers
"""""""""

The Norwegian climate service centre and partners (MET, NVE, NORCE, Bjerknessenteret) will produce the new predictions for the average and extreme air temperatures in Norway, forward in time to year 2100.

.. uml:: air_temperature_projection_producer.puml

Consumers
"""""""""

End users of the data might include: 

* A researcher that wants to use the data in their biology model to predict the effect on ticks. 
* A state agency that wants to investigate the effects temperature changes will have in each Norwegian kommune.
* A Journalist that wants write about the potential changes that Norway will experience. 

.. uml:: users_klima_leveranse_og_bruker.puml

Trigger
-------

.. Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

Norwegian Environment Agency orders the report - Climate in Norway 2100. 
The climate model data is needed to write this report. 


Pre-conditions
--------------

.. Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

The following datasets must be available to the producer:

* Bias adjusted time series from EURO-COREX (CMIP5 og CMIP6).
* Calculated climate indexes, averages over certain time periods, etc.
* Gridded historical weather observations.
* Calculations of averages for fylke, kommune, and other regions.

The following services should be used to present results:

* OGC Web Map Service (WMS)
* A solution for getting data

Post-conditions
---------------

.. The state of the system at the conclusion of the Use Case execution.

* A dataset is created that contains climate predictions forward in time until 2100.
* The data should be stored on netcdf on a 1x1 km grid (follow-up: why netcdf?)
* This dataset includes predictions about temperature, as well as many other variables.
* The results of this dataset are distilled into a report (e.g., pdf) - Climate in Norway 2100.

Normal Flow
-----------

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

Producer
""""""""

1. The producer searches and accesses the following data:

* Aggregated time series
* Gridded historical weather observations
* Climate model data

2. The producer runs an algorithm to produce climate projections

3. The producer stores the results and discovery and configuration metadata on a netcdf file

4. The netcdf file is registered on `<https://thredds.met.no>`_

5. The data is made available via OPeNDAP and visualised through WMS

Consumer
""""""""

1. The consumer searches for data
2. The consumer investigates and interprets data

  * The researcher investigates the data

    * Downloads the climate projection for temperature for the whole time range
    * Downloads the climate projection medians as an average over the period 2071-2100
    * Collocates the climate projections with their biology model simulation results

  * The journalist chooses parameters on a website to see what the extreme temperatures will be in 2041-2070
  * The state agency updates their maps with expected changes, to reflect future changes in permafrost

3. The consumer concludes and summarizes their findings

  * The researcher publishes a scientific paper
  * The journalist publishes a newspaper article
  * The state agency establishes hazard zones due to melting permafrost

.. uml:: information_to_knowledge_klima_bruker.puml

Alternative Flows
-----------------

.. Other, legitimate usage scenarios that can take place within this Use Case.

* The journalist wants to know the temperature on 25th June, 2074. It must be clear from the discovery metadata that the projections cannot be used for that purpose.

Exceptions
----------

.. Anticipated error conditions that could occur during execution of the Use Case, and how the
   system is to respond to those conditions, or the Use Case execution fails for some reason.

Includes
--------

.. Other Use Cases that are included (“called”) by this Use Case (common functionality appearing in
   multiple Use Cases can be described in a separate Use Case included by the ones that need that
   common functionality).

Notes and Issues
----------------

.. Additional comments about this Use Case and any remaining open issues that must be resolved. (It
   is useful to Identify who will resolve each such issue and by what date.)

See how the current data is used and visualized today:

* https://klimaservicesenter.no/faces/desktop/scenarios.xhtml

Relevant software
-----------------

* cdi and nco for netcdf file manipulation

Relevant datasets
-----------------

* seNorge2018 for adjusting bias and grid specifications
* EURO-CORDEX climate prediction data that will be downscaled from a 12x12 km grid to 1x1 km for Norway.
* CMIP5 og CMIP6 climate predictions that will be downscaled for Norway.

UML diagram
-----------

.. uml::

   @startuml Use case #38
   !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Container.puml

   LAYOUT_LEFT_RIGHT

   Person(researcher, "Researcher producing climate predictions")
   System(senda_search_interface, "S-ENDA Metadata Service/Central")
   System(senda_provider_interface, "S-ENDA Provider UI")

   Rel(researcher, senda_search_interface, "Searches relevant data for the climate models.", "Web UI")
   Rel(senda_search_interface, researcher, "Returns links to relevant data.", "Web UI")
   Rel(researcher, senda_provider_interface, "Registers their new dataset and metadata.", "Web UI")
   Rel(senda_provider_interface, researcher, "Confirms registration.", "Web UI")
   @enduml

