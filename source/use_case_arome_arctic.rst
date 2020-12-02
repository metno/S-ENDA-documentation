Arome Arctic NWP model
""""""""""""""""""""""

..

Use Case Goal
=============

Run an artic weather model, this is used to create weather forecasts for the artic region as well as used as input data for other products.


Actors
======

.. 

* **Producers:** the Norwegian Meteorological institute (department: Development centre for weather forecasting)

* **Consumers:** :
  - Arome artic post-production: input for SIMRA model i longyearbyen (a dedicated turbulence model that is used by Avinor)
  - The oceam model uses it as input data
  - PhD students / researchers
  - Yr
  - Services such as: fiskinfo, barentswatch 


There are mostly advanced and intermediate consumers of this data, because the simple users actually use a product 
derived from this data (for example: Yr).


Trigger
=======

.. 

The model runs every **X** hours. 


Pre-conditions
==============

Observations for the area are available as input into the model. 


Post-conditions
===============

The data is available to users on lustre and thredds. 
- https://thredds.met.no/thredds/catalog/aromearcticlatest/catalog.html

The data is also available through `api.met.no <https://api.met.no/>`_ along with other model data (such as MEPS) which covers the rest of Norway and Scandinavia. 


Normal Flow
===========

.. 

The users retrieve the data as netcdf files from thredds, or potentially get the data through opendap (mostly researchers).
Yr retrieves the data via api.met.no in xml or json format.  


Alternative Flows
=================

.. 

The user wants historical data. The data is available as seperate files for each model run, so if the user wants a time series for a particular point over a time range they must
retrieve the part of the data they need from each dataset. 
- https://thredds.met.no/thredds/catalog/aromearcticarchive/catalog.html


Exceptions
==========

.. 



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


UML diagram
===========

   .. uml::

      @startuml Use case #38
      !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Container.puml

      LAYOUT_LEFT_RIGHT

      Person(Researcher, "Researcher looking at arctic conditions")
      System(senda_search_interface, "S-ENDA Metadata Service/Central")
      System(thredds, "Thredds")

      Rel(Researcher, senda_search_interface, "Searches for artic weather data.", "Web UI")
      Rel(senda_search_interface, Researcher, "Returns metadata on arome artic and links to datasets.", "Web UI")
      Rel(thredds, senda_search_interface, "Harvest metadata and links to datasets.")
      @enduml
