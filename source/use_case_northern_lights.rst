Find latest satellite image describing cloud cover for visibility of Northern Lights
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

..

Use Case Goal
=============

.. 

A user (tourist guide) wants to see Northern lights, but the current location is
cloudy. Find information about cloud cover in the nearby areas to find places
with less clouds. This can be done with infrared satellite imagery and or
analysed cloud products.

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

- User experiences cloudy conditions and wants to find nearby areas with less clouds.
- User planning an excursion wants to check the recent cloud cover information to plan the excursion.


Pre-conditions
==============

- Satellite product for visualising clouds (gridded) at night must be available as WMS
- Satellite data (gridded) must be accessible for an experienced user to visualize in their preferred tool
- Metadata must be registered for the user to be able to find the dataset

Post-conditions
===============

- User is able to zoom and pan in a WMS with the product overlayed some map to easily relate the data to a location
- User is able to load the downloaded or streamed data into a desired visualisation tool.

Normal Flow
===========

.. 

- User search for cloud cover over Northern Norway (skydekke Nord-Norge)
- Return possible sources of cloud cover data

  - cloud data from a model
  - satellite product showing the current cloud coverage

- The data description must explain the strength of each product to enable the user to choose the right product for his/her needs
- When selecting the satellite image this should be display in a wms display (on top of a map) enabling the user to pan and zoom, and possibly also to switch between different times.


Alternative Flows
=================

.. 

- If a more experienced guide is using this, then the normal flow will be different as this user know what to search for. This user will go directly to the source and download the latest data. Then display this in his/her favorite display tool.

Exceptions
==========

.. 

- Satellite data is too old to be relevant for the user
- WMS display system is not working
- Thredds server is failing

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

- MEPS model data
- Gridded satellite cloud product from ... (available in WMS and OPeNDAP)

UML diagram
===========

   .. uml::

      @startuml Use case #38
      !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Container.puml

      LAYOUT_LEFT_RIGHT

      Person(tourist_guide, "Tourist guide")
      System_Ext(search_interface, "Search Engine", "Google or met interface")

      Rel(tourist_guide, search_interface, "Searches for information about clouds.", "Web UI")
      Rel(search_interface, tourist_guide, "Web interface returns links to nwp clouds, satellite products describing clouds(WMS) or cloud observations.", "Web UI")

      @enduml
