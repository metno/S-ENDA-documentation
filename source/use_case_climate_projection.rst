Climate Projection (Temperature) - producers and consumers
==========================================================

Use Case Goal
-------------

.. Required

   Brief description of the reason for and outcome of this Use Case, or a high-level description of
   the sequence of actions and the outcome of executing the Use Case.


The Norwegian climate service centre wants to produce new predictions for the average and extreme
temperatures, as well for many other weather parameters and their effects. This will try to model the 
weather Norway will experience in the future (forward in time to 2100).

.. uml:: information_to_knowledge_klima_leveranse.puml

Consumers of this data will include other researchers as well as simpler users like a journalist.

Actors
------

.. Required

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user
   classes, or roles, identified from the customer community that will use the product.

The Norwegian climate service centre and partners (MET, NVE, NORCE, Bjerknessenteret) will create the data.
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

* Bias adjusted time series from EURO-COREX (CMIP5 og CMIP6).
* Calculated climate indexes, averages over certain time periods, etc.
* Gridded historical weather observations.
* Calculations of averages for fylke, kommune, and other regions.


Post-conditions
---------------

.. The state of the system at the conclusion of the Use Case execution.

* A dataset is created that contains climate predictions forward in time until 2100.
* This dataset includes predictions about temperature, as well as many other variables.
* The results of this dataset are distilled into the report - Climate in Norway 2100.

Normal Flow
-----------

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

* A masters student downloads the climate predictions for temperature for the whole time range.
* A researcher downloads the climate prediction medians as an average over the period 2071-2100.
* A journalist choses parameters on a website to se what the extreme temperatures will be in 2041-2070.
* A state agency updates their maps with expected changes, to reflect future changes in water flow.

.. uml:: information_to_knowledge_klima_bruker.puml

Alternative Flows
-----------------

.. Other, legitimate usage scenarios that can take place within this Use Case.

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

