Find latest satellite image describing cloud cover for visibility of Northern Light
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

..

Use Case Goal
=============

.. 

A user(tourist guide) want to see Northern light, but the current location is cloudy. Find information about cloud cover in the nearby areas to find places with less clouds. This can be done with infrared satellite imagerey and or analysed cloud products.

Actors
======

.. 

- Random user with limited experience
- Random user (tourist guide) doing this every evening to plan an excursion
- Data owner (satellite)(Obsklim, FOU-FD)
- Data provider (satellite)(Obsklim, NBS)


Trigger
=======

.. 

- User experience cloudy conditions and wants to find nearby areas with less clouds.
- Use planning an excursion want to check the resent cloud cover information to plan the excursion.


Pre-conditions
==============

.. 

- Satellite product for visualisation clouds (gridded) at night must be available for WMS
- Satellite product for download in like netcdf(gridded) for a more experienced user to visualize in their prefered tool
- Meta data must be registered for the product for the user to be able to find it.

Post-conditions
===============

.. 

- User be able to zoom and pan in a WMS with the product overlayed some map to easy relate the data to a location.
- User be able to load the downloaded data into the desired visualisation tool

Normal Flow
===========

.. 

- User search for cloud cover Northern Norway (skydekke Nord-Norge)
- Return possible sources of cloud cover data.
  - cloud data from the model
  - satellite product visualize the cloud coverage
- The description must explain the strength of each product makeing the user able to choose the right product for his/her use.
- when selecting the satellite image this should be display in a wms display( on top of a map) makeing the user able to pan and zoom. Possible also switch between different times.


Alternative Flows
=================

.. 

- If a more experieced guide is using this, then then normal flow will be different as this user know what to search for. This user will go directly to the source and download the latest data. Then display this in his/her favorite display tool.

Exceptions
==========

.. 

- Satellite data is too old, ie. to relevasnt for the user
- wms display systems is not working
- thredds is not working

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

- MEPS model data
- gridded satellite cloud product for WMS
- gridded satellite cloud product for thredds

UML diagram
===========

..

   UML diagram, example;

   .. uml::

@startuml Use case #38
!includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Container.puml

LAYOUT_LEFT_RIGHT

Person(user, "Tourist guide")
System(senda, "S-ENDA")

Rel(user, senda, "Searches for information about clouds.", "Web UI")

@enduml
