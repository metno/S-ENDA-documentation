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

MET Norway. Department of Observation and Climate. Division for Observation quality and data processing.

Description (What?)
===================

.. Required. Short description of the system: 
   - what types of metadata is stored in this system.
   - how is the metadata stored
   - formats/language

Frost is a RESTful API that provides access to MET Norway's archive of historical weather and climate data.
Frost don't actually contains any metadata itself, but through various interfaces expose metdata about stations from ST-INFOSYS. And element metadata and the data istelf from KDVH.

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

* The Frost API is primarily for developers who need to develop scripts or applications that access MET Norway's archive of historical weather and climate data.
* Dependecies: ST-INFOSYS and KDVH. In the future frost will replace KDVH with ODA.
