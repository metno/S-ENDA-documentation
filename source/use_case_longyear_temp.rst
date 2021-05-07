Temperature from Longyearbyen
""""""""""""""""""""""""""""""


.. Insert the title of the use case template in the above heading. No other text should go under
   this heading.

Use Case Goal
=============

.. Required

A user shall extract observed and forecasted temperature time series data values over Longyearbyen. 
Data consumer perspective; tests the compliance of the data management model with the FAIR principles

(This use case is already described in MET DMH: UC4)

The user needs both observed and forecasted temperature for the same time period and same location
(longyearbyen area). 


Actors
======

.. Required

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user
   classes, or roles, identified from the customer community that will use the product.

- Data Consumer/Advanced User/Researcher (DC)
- Data owner (observations)(Obsklim on behalf of different owners)
- Data owner (model)(Director SUV, maybe on behalf of others)
- Data provider (observations)(Obsklim)
- Data provider (model)(SUV)
- Service provider (external dataservice)?

Trigger
=======

.. Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

The DC/user needs data for a project, searches for available data via some sort of web search engine. 

The user might search in a general web search engine, or he/she might use a data portal/service
known to them (e.g., geonorge, services from MET, etc.).

Pre-conditions
==============

.. Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

* Model output is gridded data that are stored on a server at MET Norway
* Observations are stored on a server at MET Norway
* Observations must be made available and be well defined (with metadata)
* There is a high degree of standardisation for all types of data
* Datasets (Observations and forecast data) are findable and accessible for general web search engines, and to more specialized portals. 


Post-conditions
===============

.. The state of the system at the conclusion of the Use Case execution.

- Relevant datasets are found (user defined timeperiod)
- Relevant metadata  for use and reference are found
- The user understands what types of datasets are available for their use (difference between observations, satellite data and model/forecast data)
- Full datasets or subsets have been downloaded/streamed
- Enough information (datasets + metadata) has been received to produce the results needed, and to reference the data.


Normal Flow
===========

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

- User searches for relevant datasets
- List of available datasets, with metadata, in given area and timeframe found and displayed to user 
- User downloads the datasets they want to use
- Enough information follows the dataset for:
  
  - The user to produce the products they need
  - The user to reference the data properly 


Alternative Flows
=================

.. Other, legitimate usage scenarios that can take place within this Use Case.

- User searches in generic search engine for datasets
- User searches with machine-to-machine API
- User searches for relevant sources for the types of datasets the user needs.

Exceptions
==========

.. Anticipated error conditions that could occur during execution of the Use Case, and how the
   system is to respond to those conditions, or the Use Case execution fails for some reason.

* **Anticipated error:** Data may be missing for the desired area, point or timeframe.
* **System response:** Displays understandable error messages.


Includes
========

.. Other Use Cases that are included (“called”) by this Use Case (common functionality appearing in
   multiple Use Cases can be described in a separate Use Case included by the ones that need that
   common functionality).

Notes and Issues
================

.. Additional comments about this Use Case and any remaining open issues that must be resolved. (It
   is useful to Identify who will resolve each such issue and by what date.)

Relevant software
=================

Relevant datasets
=================

- InSitu Observations: temperature data from datastorage at MET
- Satellite observations 
- Model data: temperature forcast data from ECMWF/EMEPS/MEPS

UML diagram
===========

..

   UML diagram, example;

   .. uml:: puml/user_analysis/use_case_longyear_temp.puml
