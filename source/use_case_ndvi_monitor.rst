Routine monitoring of vegetation health using NDVI from Sentinel-2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Use Case Goal
=============

.. Required

   Brief description of the reason for and outcome of this Use Case, or a high-level description of
   the sequence of actions and the outcome of executing the Use Case.

Reindeer herders shall be able to assess vegetation health in relevant herding areas from continuous
NDVI monitoring with Sentinel-2.

Actors
======

.. Required

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user
   classes, or roles, identified from the customer community that will use the product.

* A general user (i.e., a reindeer herder) interacts with a web UI or a mobile app to check the vegetation state in relevant herding areas 

Trigger
=======

.. Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

* Users need to know where to lead reindeer herds to find fresh vegetation for food

Pre-conditions
==============

.. Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

* The *S-ENDA find* metadata store must be updated by the newest Sentinel-2 use and discovery metadata
  on data arrival
* The *S-ENDA access* system must provide access to the Sentinel-2 data
* A server side *NDVI Tool* must be available to calculate the NDVI from bands in a Sentinel-2 acquisition
* The NDVI results are available for streaming to user applications
* A simple description of how to interpret the NDVI must be available, or the NDVI must be presented
  in a way that is evident/self-describing
* A web page must present the latest NDVI and ability to browse back in time (e.g., with a slider)

Post-conditions
===============

.. The state of the system at the conclusion of the Use Case execution.

* The web page contains information about vegetation state based on the latest Sentinel-2 retrievals
* The user is able to find fresh vegetation

Normal Flow
===========

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

* The user accesses a web page containing information about the current and present vegetation state
* The user interprets the vegetation state in an extended region (relevant for herding) based on color codes and historic information (using, e.g., a slider)

Alternative Flows
=================

.. Other, legitimate usage scenarios that can take place within this Use Case.

* The user accesses a mobile app containing information about the current and present vegetation state
* The user interprets the vegetation state in an extended region (relevant for herding) based on color codes and historic information (using, e.g., a slider)

Exceptions
==========

.. Anticipated error conditions that could occur during execution of the Use Case, and how the
   system is to respond to those conditions, or the Use Case execution fails for some reason.

* OPeNDAP access could fail (due to, e.g., high server load?)

Includes
========

.. Other Use Cases that are included (“called”) by this Use Case (common functionality appearing in
   multiple Use Cases can be described in a separate Use Case included by the ones that need that
   common functionality).

* `Investigation of vegetation health variations in a given area based on measurements from Sentinel-2 <ndvi_use_case_investigate>`_

Notes and Issues
================

.. Additional comments about this Use Case and any remaining open issues that must be resolved. (It
   is useful to Identify who will resolve each such issue and by what date.)

* We need to make a simple web page to display the results
* We may want to demonstrate a mobile app

Relevant software
=================

* Python netCDF4 to access the OPeNDAP stream
* `Nansat <https://github.com/nansencenter/nansat>`_ could be used as basis for the NDVI tool and to
  access the Sentinel-2 data stream or any downloaded netCDF-CF files

Relevant datasets
=================

* NBS Sentinel-2

UML diagram
===========

.. UML diagram, example;

UML diagram, example;

.. uml::

   @startuml
   !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Context.puml

   LAYOUT_LEFT_RIGHT

   Boundary(providers, "Providers") {
      System_Ext(ndvi_tool, "NDVI Tool")
   }

   Boundary(users, "Users") {
      Person(general_user, "General user")
   }

   System_Boundary(portals, "Portals") {
      System_Ext(ndvi_web_app, "NDVI web app")
      System_Ext(ndvi_mobile_app, "NDVI mobile app")
   }

   System(senda_find, "S-ENDA Find")
   System(senda_access, "S-ENDA Access")

   Rel(general_user, portals, "Zooms into region of interest", "Web UI / Mobile app")
   Rel(ndvi_tool, senda_find, "Registers NDVI dataset", "API")
   Rel(senda_find, senda_access, "Makes data accessible", "API")
   Rel(senda_access, providers, "Sends usage statistics to provider", "Rest")
   Rel(senda_find, providers, "Sends (meta)data validation and search statistics to provider", "Rest")
   Rel(portals, senda_find, "Sends user feedback to provider", "Rest")
   Rel(senda_find, providers, "Sends user feedback to provider", "Rest")
   Rel(portals, senda_find, "Portals listen for new NDVI datasets", "CloudEvents")
   Rel(portals, senda_access, "Portals access NDVI data", "WMS")

   @enduml

