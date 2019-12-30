Use Case Goal
=============

.. 

   Brief description of the reason for and outcome of this Use Case, or a high-level description of
   the sequence of actions and the outcome of executing the Use Case.

Datasets produced from a new NWP model are freely available for 

* File download as NetCDF

* Streaming via OPeNDAP

* Visualisation via WMS

* Visualisation in Diana(?)

The datasets are discoverable via

* MET Norway catalogue web search interface

* Google?

* Machine-machine search interface


Actors
======

.. 

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user
   classes, or roles, identified from the customer community that will use the product.

* Data Provider (DP) 

* Data Owner (Director SUV)

* A random user with technical expertise (Python and Jupyter)

* A random user with limited expertise who is just browsing the web

Trigger
=======

.. 

   Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.


Pre-conditions
==============

.. 

   Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

* Model output is gridded data that are stored on a server at MET Norway

* NWP model data are well-known

* There is a high degree of standardisation


Post-conditions
===============

.. 

   The state of the system at the conclusion of the Use Case execution.

A user is able to visualise the wind speed and direction in

* WMS in a web browser

* Jupyter Notebook


Normal Flow
===========

.. 

   Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

* define dataset(s) (including cf-variable); 

* Update Data Management Plan for NWP; 

* (Director DP informs)

* (inform DM/SM); 

* build CF and ACDD compliant NetCDF files for the dataset(s) from the native files; 

* configure dataset(s) in TDS; 

* create MMD metadata 

* ingest in metadata catalog (e.g., SolR); 

* make searchable in, e.g., opensearch (like, e.g., https://colhub.copernicus.eu/userguide/ODataAPI?TWIKISID=b7b00ae74a4fc691a138709825f16fa3)

* add to existing portals (or check that it is made automatically available)


Alternative Flows
=================

.. 

   Other, legitimate usage scenarios that can take place within this Use Case.

Exceptions
==========

.. 

   Anticipated error conditions that could occur during execution of the Use Case, and how the
   system is to respond to those conditions, or the Use Case execution fails for some reason.

Includes
========

.. 

   Other Use Cases that are included (“called”) by this Use Case (common functionality appearing in
   multiple Use Cases can be described in a separate Use Case included by the ones that need that
   common functionality).

Notes and Issues
================

.. 

   Additional comments about this Use Case and any remaining open issues that must be resolved. (It
   is useful to Identify who will resolve each such issue and by what date.)


