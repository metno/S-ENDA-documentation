Creation of seNorge gridded observation dataset
===============================================

Use Case Goal
-------------

.. Required

   Brief description of the reason for and outcome of this Use Case, or a high-level description of
   the sequence of actions and the outcome of executing the Use Case.

The seNorge dataset is produced based on historical observations. The objective is to create a high resolution (1k) gridded data set of 
temperature and precipitation for the Norwegian mainland. 

**Goal:** To produce observational gridded datasets over Norway.

https://github.com/metno/seNorge_docs/wiki/seNorge_2018

These are used in other analyses, such as the one described in :ref:`climate-projection-of-yearly-air-temperature-in-norway` use case.

We follow the model presented in the :ref:`users-definition` section:

* **Producers:** the Norwegian Meterological Institute (MET)

* **Consumers:** :ref:`advanced-consumers` (e.g., researchers), :ref:`intermediate-consumers`, and :ref:`simple-consumers`  (e.g., journalists)

Actors
------

.. Required

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user
   classes, or roles, identified from the customer community that will use the product.

* Researchers at MET and externally
* Data processing and production (PPI)
* Data storage (thredds and lustre)


Producers
"""""""""

Norwegian meteorological instutute.

.. uml:: senorge_producer.puml

Consumers
"""""""""

End users of the data might include: 

* A researcher that wants to use the data to remove biases in a global climate prediction model.
* NVE uses the data in their hydrological and snow modeling.
* A Journalist that wants to create visualizations of climate changes.


Trigger
-------

.. Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

An update of the dataset is produced daily and the data is made available on thredds.  
Less often a full rerun of the interpolation is done, and this dataset is published with more traceability (DOI). 
It also benefits from and updates or improvements in the quality control routines.


Pre-conditions
--------------

.. Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

The following datasets must be available to the producer:

* Historical weather observations for Scandinavia.
* Fine resolution map data for the area of interest. 


Post-conditions
---------------

.. The state of the system at the conclusion of the Use Case execution.

* A dataset is created and stored on lustre and thredds.
* The dataset is also used to create visualizations on seNorge. 

Normal Flow
-----------

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

Producer
""""""""

1. The producer uses the following data sources:

* Norwegian Meteorological Institute’s Climate Database (via the Frost API)
* wedish Meteorological and Hydrological Institute Open Data API
* Finnish Meteorological Institute open data API
* Maps created by NVE based on a fine digital elevation model (/lustre/storeB/project/metkl/klinogrid/geoinfo)

2. The producer then uses the data as input and runs the code found here: 
https://github.com/metno/seNorge2


3. The data is stored at MET. 


Consumer
""""""""

1. The consumer searches for data
2. The consumer investigates and interprets data

  * The researcher downloads the whole dataset off thredds to investigate different parameters. 
  * NVE uses the atmospheric data to initialize the hydrological and snow simulations for modeling.
  * The journalist chooses parameters on a website like http://www.senorge.no to look at the data through visualizations

3. The consumer concludes and summarizes their findings

  * The researcher publishes a scientific paper
  * Hydrological and snow model data is produced. 
  * The journalist publishes a newspaper article


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


Relevant software
-----------------


Relevant datasets
-----------------


UML diagram
-----------

.. uml::

   @startuml Use case #38
   !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Container.puml

   LAYOUT_LEFT_RIGHT

   Person(researcher, "Researcher creating gridded datasets")
   System(senda_search_interface, "S-ENDA Metadata Service/Central")

   Rel(researcher, senda_search_interface, "Searches for gridded observations.", "Web UI")
   Rel(senda_search_interface, researcher, "Returns links to relevant data.", "Web UI")
   @enduml

