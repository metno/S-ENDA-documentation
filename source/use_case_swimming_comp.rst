Outdoor swimming competition
""""""""""""""""""""""""""""

Use Case Goal
=============

An outdoor swimming competition organizer wants to know sea surface temperature at the event location.

The organizer is interested in the sea surface temperature at the event location. As there is very few locations where sea-water temperature is measured, the result to the user should show both closest available in-situ measurement (which probably will be some distance away from the actual event location), the sea temperature from model, and derived from satellite measurements.


- How to find the right dataset(s) and service?
- How to find the correct variable
- Is there uptime guarantee for the service in case a system will be built on top of it that needs to  be available for future events?

For this use case the parameter sea surface temperature should be exchangable with any other parameter.


Actors
======

- Random user with limited experience
- Data owner (observations)(Obsklim on behalf of different owners)
- Data owner (model)(Director SUV, maybe on behalf of others)
- Data owner (satellite)(Obsklim, FOU-FD, maybe others)
- Data provider (observations)(Obsklim)
- Data provider (model)(SUV)
- Data provider (satellite)(Obsklim)

Trigger
=======

External privately organized sports event: needs information about sea surface temperature conditions for the competitors. (General information and safety considerations)

Pre-conditions
==============

Model output is gridded data that are stored on a server at MET Norway
Observations are stored on a server at MET Norway
Observations must be made available and be well defined(with metadata)
Satellite data is gridded data that are stored on a server at MET Norway
There is a high degree of standardisation for all types of data

Post-conditions
===============

A user is able to find all available sea temperature data.
A user is able to choose/access the data he/she is interrested in.
A user is able to visualize the data(or a compilation of data) for the competitors via WCS
A user is able to discern which data is available for the area the user is interrested in (and perhaps also information about what is not available. example: No sea surface temperature observations available for inner Oslo fjord. but closest is...)

Normal Flow
===========

User actions:
- User searches for "sea surface temperature oslofjord" in some generic search environment (google)

System respones:
- Responds with a list of possible datasets and the possible ways of accessing those datasets.
- Responds with existing services that may be useful for this request.
- Access to datasets should preferrably both be file download with liks to viewrs and perhaps an easier view for WCS


Alternative Flows
=================

- User searches in a known MET based search environment
- User uses Norwegian search frases (sjøtemperatur)

System responses should be the same.


Exceptions
==========

Parameter searched for is not found (typing error...) 

- Useable error message, with suggestions to correct. (Did you mean...)

Location does not have data, the search is for an area outside our datasets:

- Useable error message: "Observations not available for this point, closest point with observations is...)

Point in time/space not available in satellite data because of clouds(SST not possible to calculate from data)


Includes
========

.. 

   Other Use Cases that are included (“called”) by this Use Case (common functionality appearing in
   multiple Use Cases can be described in a separate Use Case included by the ones that need that
   common functionality).

Notes and Issues
================

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

   .. uml::

      @startuml
      Alice -> Bob: Hi!
      Alice <- Bob: How are you?
      @enduml
