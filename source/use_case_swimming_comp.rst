Outdoor swimming competition
""""""""""""""""""""""""""""

.. Insert the title of the use case template in the above heading. No other text should go under
   this heading.


Use Case Goal
=============

.. Required

An outdoor swimming competition organizer wants to know sea surface temperature at the event location.

The organizer is interested in the sea surface temperature at the event location. As there is very few locations where sea-water temperature is measured, the result to the user should show both closest available in-situ measurement (which probably will be some distance away from the actual event location), the sea temperature from model, and derived from satellite measurements.


- How to find the right dataset(s) and service?
- How to find the correct variable
- Is there uptime guarantee for the service in case a system will be built on top of it that needs to  be available for future events?

For this use case the parameter sea surface temperature should be exchangable with any other parameter.


Actors
======

.. Required

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user
   classes, or roles, identified from the customer community that will use the product.

- Random user with limited experience
- Data owner (observations)(Obsklim on behalf of different owners)
- Data owner (model)(Director SUV, maybe on behalf of others)
- Data owner (satellite)(Obsklim, FOU-FD, maybe others)
- Data provider (observations)(Obsklim)
- Data provider (model)(SUV)
- Data provider (satellite)(Obsklim)

Trigger
=======

.. Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

External privately organized sports event: needs information about sea surface temperature conditions for the competitors. (General information and safety considerations)

Pre-conditions
==============

.. Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

Model output is gridded data that are stored on a server at MET Norway
Observations are stored on a server at MET Norway
Observations must be made available and be well defined(with metadata)
Satellite data is gridded data that are stored on a server at MET Norway
There is a high degree of standardisation for all types of data

Post-conditions
===============

.. The state of the system at the conclusion of the Use Case execution.

A user is able to find all available sea temperature data.
A user is able to choose/access the data he/she is interrested in.
A user is able to visualize the data(or a compilation of data) for the competitors via WCS
A user is able to discern which data is available for the area the user is interrested in (and perhaps also information about what is not available. example: No sea surface temperature observations available for inner Oslo fjord. but closest is...)


Normal Flow
===========

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

User actions:
- User searches for "sea surface temperature oslofjord" in some generic search environment (google)

System respones:
- Responds with a list of possible datasets and the possible ways of accessing those datasets.
- Responds with existing services that may be useful for this request.
- Access to datasets should preferrably both be file download with liks to viewrs and perhaps an easier view for WCS


Alternative Flows
=================

.. Other, legitimate usage scenarios that can take place within this Use Case.

- User searches in a known MET based search environment
- User uses Norwegian search frases (sjøtemperatur)

System responses should be the same.


Exceptions
==========

.. Anticipated error conditions that could occur during execution of the Use Case, and how the
   system is to respond to those conditions, or the Use Case execution fails for some reason.

Parameter searched for is not found (typing error...) 

- Useable error message, with suggestions to correct. (Did you mean...)

Location does not have data, the search is for an area outside our datasets:

- Useable error message: "Observations not available for this point, closest point with observations is...)

Point in time/space not available in satellite data because of clouds(SST not possible to calculate from data)


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

* Observations: sea surface temperature from data storage at MET (Maritime data)
* Satellite: Calculated SST from satellite data.
* Model data: MEPS/ECMWF sea surface temperature    


UML diagram
===========

..

   UML diagram, example;

   .. uml:: use_case_swimming_comp.puml
