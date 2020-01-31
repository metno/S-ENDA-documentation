Heritage system: Frost
""""""""""""""""""""""

.. Insert the name of the heritage metadata system in the above heading. No   
   other text should go under
   this heading.


Responsible (Who?)
==================

.. Required. Who is responsible for this heritage system. This can be a 
   group, a role or an administrative unit. Try to avoid linking to specific  
   persons.

Department of Observation and Climate. Division for Observation quality and data processing.

Description (What?)
===================

.. Required. Short description of the system: 
   - what types of metadata is stored in this system.
   - how is the metadata stored
   - formats/language

Frost is a RESTful API that provides access to MET Norway's archive of historical weather and climate data.

Documentation(Where/how?)
=========================

.. Required. Links to system dokumentation as comments, mark links that are 
   only available for internal users

Frost is documented with swagger. See https://frost.met.no/api.html for more information.

Conditions and dependencies(why?)
=================================

.. Required. Please add a short paragraph explaining in words why the system is as it is

.. Which users needs are this system ment to cover? 
   Are there specific choices that has been made which sets important limitations to the system? 
   Current dependencies: list of other systems (internal/external) currently connected to this system

* Data and queries are currently managed through the kvalobs system
* In the future frost will fetch data from ODA
