Climate Projection of Yearly Air Temperature in Norway
======================================================
.. _`climate-projection-of-yearly-air-temperature-in-norway`:

Use Case Goal
-------------

.. Required

   Brief description of the reason for and outcome of this Use Case, or a high-level description of
   the sequence of actions and the outcome of executing the Use Case.

Various users who work with climate adaptation or products for climate adaptation must obtain relevant data on expected future climate change (climate projections), including hydrology and natural hazards. The Norwegian Climate Service Center will calculate new climate and hydrology projections (expected changes in the future) for Norway up to the year 2100.

Climate projections have a systematic bias for temperature and precipitation. Because of this they run climate models for 100 years or so, such that they have an overlap with observational gridded datasets for 30-40 years. The time period where the climate projections and observational datasets overlaps is used to compute systematic differences that are used to rescale climate projections such that the systematic differences are removed.

National services (such at MET) downscale and remove biases from the global projections to get it to fit more locally. MET downscales using both numerical models and stastical methods.

This use case focuses on the new projections for the yearly average and extreme air temperatures in Norway, forward in time to year 2100.

**Goal:** To produce new climate projections of yearly air temperatures in Norway.

We follow the model presented in the :ref:`users-definition` section:

* **Producers:** the Norwegian Climate Service Center

* **Consumers:** :ref:`advanced-consumers` (e.g., researchers), :ref:`intermediate-consumers`, and :ref:`simple-consumers`  (e.g., journalists)

The knowledge generation is described in the below figure. The data (see :ref:`user-analysis-context`) used to generate the air temperature projections is a combination of gridded historical weather observations (level 3) and model simulations (level 4). The processing and interpretation consists of using the weather observations to correct biases in the model results to produce a dataset of downscaled climate model data (from this, likely future scenarios can be estimated to provide general and specific information about the future climate).

.. uml:: puml/user_analysis/information_to_knowledge_klima_leveranse.puml

Actors
------

.. Required

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user
   classes, or roles, identified from the customer community that will use the product.


Producers
"""""""""

The Norwegian climate service centre and partners (MET, NVE, NORCE, Bjerknessenteret) will produce the new predictions for the average and extreme air temperatures in Norway, forward in time to year 2100.

.. uml:: puml/user_analysis/air_temperature_projection_producer.puml

Consumers
"""""""""

End users of the data might include: 

* A researcher that wants to use the data in their biology model to predict the effect on ticks. 
* A state agency that wants to investigate the effects temperature changes will have in each Norwegian kommune.
* A Journalist that wants write about the potential changes that Norway will experience. 

.. uml:: puml/user_analysis/users_klima_leveranse_og_bruker.puml

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

https://klimaservicesenter.no/faces/desktop/article.xhtml?uri=klimaservicesenteret/klima-og-hydrologiske-data/datagrunnlag-klimafremskrivninger


The following services should be used to present results:


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

* Gridded historical weather observations
* Climate model data
* Some specific time series may be used in post processing

Currently at MET the gridded observations can be found on both lustre and thredds.
The global climate models can be found in online portals which can potentially be searched, 
but its also possible that the users are being told exactly where the data they want is found.

2. The producer creates the climate projections, and other aggregated values / time series (e.g. fylke averages).

3. The data is made available to consumers. 

.. note::

   A significant challenge is that the creators of the data feel a need to have some control 
   over how the data is used and presented, since otherwise there is a potential for misinterpretation
   and/or misrepresentation. For example averages over larger areas / over longer time periods might be
   considered appropriate use, but using the finer scale data to make decisions about landuse (or zoom
   way in on a map) is likely innapropriate. Most simple consumers are unable to grasp the uncertainty 
   contained in the model data, and the varying quality for the different aggregation scales.

4. The report is written based on interpreting the predictions. 

Consumer
""""""""

1. The consumer searches for data
2. The consumer investigates and interprets data

  * The researcher investigates the data

    * Downloads the climate projection for temperature for the whole time range
    * Downloads the climate projection medians as an average over the period 2071-2100
    * Collocates the climate projections with their biology model simulation results
    * Runs an algorithm to predict the effect on ticks

  * The journalist chooses parameters on a website to see what the extreme temperatures will be in 2041-2070
  * The state agency updates their maps with expected changes, to reflect future changes in permafrost

3. The consumer concludes and summarizes their findings

  * The researcher publishes a scientific paper
  * The journalist publishes a newspaper article
  * The state agency establishes hazard zones due to melting permafrost

.. uml:: puml/user_analysis/information_to_knowledge_klima_bruker.puml

Alternative Flows
-----------------

.. Other, legitimate usage scenarios that can take place within this Use Case.

The journalist wants to know the temperature on 25th June, 2074. It must be clear from the discovery metadata that the projections cannot be used for that purpose.

Relevant datasets
-----------------

* seNorge2018 for adjusting bias and grid specifications
* EURO-CORDEX climate prediction data that will be downscaled from a 12x12 km grid to 1x1 km for Norway.
* CMIP5 og CMIP6 climate predictions that will be downscaled for Norway.


Current workflow(s)
-------------------

.. Additional comments about this Use Case and any remaining open issues that must be resolved. (It
   is useful to Identify who will resolve each such issue and by what date.)

Because it is very easy for consumers to misinterpret the data (see note above in under normal flow), 
the distribution of the data is somewhat limited. 

One can download particular aggregations of the data here:
https://klimaservicesenter.no/faces/desktop/scenarios.xhtml
https://nedlasting.nve.no/klimadata/kss

Some of the netcdf data can be found here: 
https://drive.google.com/drive/folders/1czjY8UR8RxUCwZsdsqNa-09cvRi5bVLB

See how the current data is used and visualized today:
https://klimaservicesenter.no/faces/desktop/scenarios.xhtml

**Relevant software:**

* CDI and NCO for netcdf file manipulation
* OGC Web Map Service (WMS) for presenting results


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

