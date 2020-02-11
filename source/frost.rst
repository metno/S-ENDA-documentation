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

MET Norway, Department of Observation and Climate, Division for Observation quality and data processing.

Description (What?)
===================

.. Required. Short description of the system: 
   - what types of metadata is stored in this system.
   - how is the metadata stored
   - formats/language

Frost is a RESTful API that provides access to MET Norway's archive of historical weather and
climate data.  Frost does not actually contain any metadata itself. However, frost exposes metadata
about stations from ST-INFOSYS through various interfaces. And element metadata and the data istelf
from KDVH (Klimadatavarehuset). An element is for example temperature at 2m or wind speed at 10m at
a specific location and at a time.

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
* Dependecies: ST-INFOSYS and KDVH. In the future, frost will replace KDVH with ODA (Observation, Data, Access). For more information about ODA, see here: https://oda.pages.met.no/page/about/
* The dependencies do not support FAIR, but FROST provides translations, where possible, of element names following CF.
* ST-INFOSYS contains metadata of the MET Norway obervations stations. ST-INFOSYS does not support FAIR, becuse data is not Findable. Metadata is not findable for other than special users, the same for Accessable. The metadata do not follow cf standard i.e. not Interoperable. In St-INFOSYS metadata itself are Reusable.
* KDVH ( klimadatavarehuset) contains the element data. KDVH data is not Interoperable as the elements metadata are not CF compliant.
