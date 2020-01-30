Investigation of vegetation health variations in a given area based on measurements from Sentinel-2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


Use Case Goal
=============

.. Required

   Brief description of the reason for and outcome of this Use Case, or a high-level description of
   the sequence of actions and the outcome of executing the Use Case.

An advanced user shall be able to define a time span and region of interest in an NDVI tool in order
to assess the temporal and spatial variations of vegetation health in the given region.

Actors
======

.. Required

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user
   classes, or roles, identified from the customer community that will use the product.

An advanced user interacts with an external NDVI tool (on his/her local system), which interacts
with the S-ENDA find and access systems via machine-machine APIs. The advanced user is able to
interpret the (NDVI) index with respect to vegetation health.

Trigger
=======

.. Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

* Abnormal deterioration of vegetation health in the region of interest triggers the need to investigate NDVI changes in time

Pre-conditions
==============

.. Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

* The *S-ENDA find* metadata store must be populated by Sentinel-2 use and discovery metadata
* The *S-ENDA access* system must provide OPeNDAP access to Sentinel-2 data
* A simple *NDVI Tool* must be available on the user side to calculate the NDVI from bands in a
  Sentinel-2 acquisition

Post-conditions
===============

.. The state of the system at the conclusion of the Use Case execution.

The user is presented with a timeseries of gridded NDVI (i.e., a 3D dataset of temporal and
horizontal dimensions) which can be further analysed in the external system.

Normal Flow
===========

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

* [*External system*] The advanced user defines time and region of interest for the NDVI timeseries
* NDVI Tool searches the *S-ENDA find* system via the machine-machine API for the data of interest
* NDVI Tool retrieves use and discovery metadata from *S-ENDA find*
* NDVI Tool accesses the *S-ENDA access* system via OPeNDAP using the http address provided in the
  metadata
* NDVI Tool extracts spatial subsets of the found Sentinel-2 data
* Subsets of the Sentinel-2 data are streamed to the NDVI Tool
* [*External system*] The NDVI Tool creates an NDVI timeseries
* [*External system*] The advanced user analyses and interprets the 3D NDVI dataset

Alternative Flows
=================

.. Other, legitimate usage scenarios that can take place within this Use Case.

None

Exceptions
==========

.. Anticipated error conditions that could occur during execution of the Use Case, and how the
   system is to respond to those conditions, or the Use Case execution fails for some reason.

* OPeNDAP access could fail

  * The system must offer an opportunity to download full files as a replacement for the OPeNDAP stream

* The search API could fail(?)

Includes
========

.. Other Use Cases that are included (“called”) by this Use Case (common functionality appearing in
   multiple Use Cases can be described in a separate Use Case included by the ones that need that
   common functionality).

None

Notes and Issues
================

.. Additional comments about this Use Case and any remaining open issues that must be resolved. (It
   is useful to Identify who will resolve each such issue and by what date.)

* We need to make a simple NDVI tool which calculates the NDVI from two bands in Sentinel-2

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

.. uml::

   @startuml NDVI context diagram
   !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Context.puml

   LAYOUT_LEFT_RIGHT

   Boundary(users, "Users") {
      Person(professional, "Advanced user")
      System_Ext(ndvi_tool, "NDVI Tool")
   }

   System(senda, "S-ENDA Find/Central")

   Rel(professional, ndvi_tool, "Defines time and region of interest", "GUI / text based UI")
   Rel(ndvi_tool, senda, "Searches Sentinel-2 data covering region of interest", "API")
   Rel(ndvi_tool, senda, "Reads spatial subset of Sentinel-2 data", "OPeNDAP")

   @enduml
