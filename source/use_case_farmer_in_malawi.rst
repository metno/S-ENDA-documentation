Farmer in Malawi
""""""""""""""""

..

Use Case Goal
=============

.. 

A farmer in Malawi receives daily forecasts from METs open data services. The forecast must arrive on a relevant platform and be presented in a way that makes it usable for the farming work.
   
Actors
======

.. 

- Random user with limited experience (farmer in Malawi)
- Data owner nwps (SUV)

Trigger
=======

.. 

- The farmer need to follow the day to day based forecast to best plan how to get the most out of the crops
- This can either be triggered manually by the farmer going directly to a link with the latest relevant forecast for this purpose. Or the farmer has a script in a cronjob updating a netcdf file every morning.

Pre-conditions
==============

.. 

- Point data for forecast must be available for the actual point, ie the whole world
- Observation data could be available.
- Forcast fields for the actual place must be available, ie the whole world. This must be available to be view like a wms layer and/or available for download
- The wms view must be enhanced for farming purposes, ie relevant paramters for farmin
- Meta data must be registered for the products for the user to be able to find it.

Post-conditions
===============

.. 

- User be able to zoom and pan in a WMS with the products overlayd some map to easy relate the data to a location.
- User be able to make his decision from the data available
- User be able to download the data and visualize this in his desired tool

Normal Flow
===========

.. 

- User search for parameters/fields relevant for farming(temperature, precipitioan, evaporation, dew, wind, humidity and possible also other) in Malawi for today
- Return possible source of these data with the newest data available first
  - these parameters as one link to WMS with each paramteres as different layers.
  - these parameters with one link each to downloadable dataset
  - in the WMS view cycle over the available timesteps for each parameter

Alternative Flows
=================

.. 

N/A

Exceptions
==========

.. 

- Newest expected model results are delayed or for some other reason is missing. This can couse the user to get old results when he expects new as he check this every day.
  
Includes
========

.. 

N/A

Notes and Issues
================

.. 

N/A

Relevant software
=================

N/A

Relevant datasets
=================

- ECMWF model datasets, one dataset for each paramter for each timestep(?) available on for display WMS
- The same data available for download(thredds, opendap)
- Observations

UML diagram
===========

..

   .. uml::

      @startuml Use case #2
      !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Container.puml

      LAYOUT_LEFT_RIGHT

      Person(malawi_farmer, "Farmer in Malawi")
      System_Ext(search_interface, "Search Engine", "Google or met interface")

      Rel(malawi_farmer, search_interface, "Searches for information relevant for farming.", "Web UI")
      Rel(search_interface, malawi_farmer, "Web interface returns links to nwp paramters to WMS and links to relevant parameters for download.", "Web UI")

      System(senda, "S-ENDA Find+Access/Central")
      Rel(search_interface, senda, "Find and access weather prediction", "CSW and WMS")

      @enduml
