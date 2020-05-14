api.met.no
^^^^^^^^^^^

Heritage system: api.met.no
"""""""""""""""""""""""""""


Responsible (Who?)
==================

.. Required. Who is responsible for this heritage system. This can be a
   group, a role or an administrative unit. Try to avoid linking to specific
   persons.

MET Norway, IT Department, Team Punkt.

Description (What?)
===================

.. Required. Short description of the system:
   - what types of metadata is stored in this system.
   - how is the metadata stored
   - formats/language

api.met.no is system with three roles:
- API Gateway. E.g proxy for other REST services.
- Distribution of static files.
- Developer portal / service catalog.

The most used service proxied through api.met.no is locationforecast,
a REST service for requesting a forecast timeseries for a specific location on earth.

The metadata system used by api.met.no is the standard http://apisjson.org/.
This standard was created ca. at the same time as DCAT. api.met.no will support DCAT in the future,
but its not clear at the moment weather apis.json will co-exist with DCAT or be replaced.


Documentation(Where/how?)
=========================

.. Required. Links to system dokumentation as comments, mark links that are
   only available for internal users

api.met.no is documented with swagger and additional free text in html. See https://api.met.no for more information.

Conditions and dependencies(why?)
=================================

.. Required. Please add a short paragraph explaining in words why the system is as it is

.. Which users needs are this system ment to cover?
   Are there specific choices that has been made which sets important limitations to the system?
   Current dependencies: list of other systems (internal/external) currently connected to this system

* The primary users of api.met.no are yr.no, specific governmental partners and the general public.
* Its meant to be easy to use for people with no knowledge about meteorology.
* Its meant to handle large amounts of requests.
* Its not meant as an archive, only serving fresh data (data for the last 2-3 days).
* Dependencies: MET Infrastructure services, such as OpenStack, DNS, network.
* Dependencies 2: Since api.met.no proxy other services, those other services need to be operated separately.

