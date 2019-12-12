Use Case Goal
=============

.. 

   Brief description of the reason for and outcome of this Use Case, or a high-level description of
   the sequence of actions and the outcome of executing the Use Case.

A user wants to compare the forecast wind conditions at 10 m height with those at 100 m height.
The weather forecast is produced with a (new) NWP model.

* The datasets are freely available for streaming
* The datasets are discoverable via a machine-machine search interface
* The IPython CLI is used to find, retrieve and plot the relevant parameters (e.g., temperature,
  wind speed and direction, humidity)


Actors
======

.. 

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user
   classes, or roles, identified from the customer community that will use the product.

* Data Provider (DP) 
* Service Provider (?)
* A random user with technical expertise (Python 3)

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

* Model output is gridded data stored on a server at MET Norway
* The user is familiar with NWP model data and Python 3
* The search metadata is compliant with the `MMD format <https://github.com/steingod/mmd>`_
* Discovery metadata is indexed in a spatial database
* OpenSearch is coupled to the spatial database, to provide search access from an external client (what about
  ElasticSearch?)
* The user knows that MET shares vm/docker configurations for efficient work with weather forecast
  data
* The user gets and installs the necessary software tools by downloading a docker image or a virtual machine configuration

Post-conditions
===============

.. 

   The state of the system at the conclusion of the Use Case execution.

The user is able to compare the wind speed and direction at 10 m and 100 m heights along a defined
transect, using Matplotlib. Only the relevant data, i.e., wind speed and direction at points along
the transect, is downloaded (streamed).

Normal Flow
===========

.. 

   Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

..

   The following seems to be from DP perspective...

* define dataset(s) (including cf-variable); 
* Update Data Management Plan for NWP; 
* (Director DP informs)
* (inform DM/SM); 
* build CF and ACDD compliant NetCDF files for the dataset(s) from the native files; 
* configure dataset(s) in TDS; 
* create MMD metadata (xml)
* ingest in metadata catalog (e.g., SolR); 
* make searchable in opensearch (like, e.g., https://colhub.copernicus.eu/userguide/ODataAPI?TWIKISID=b7b00ae74a4fc691a138709825f16fa3)
* make vm or docker container for the client software
* make the vm or docker configuration available on internet, for free download by users

..

   user actions and system responses

* 

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


