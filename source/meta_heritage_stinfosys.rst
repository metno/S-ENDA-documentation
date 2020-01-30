Heritage system: Stinfosys
"""""""""""""""""""""""""""

.. Insert the name of the heritage metadata system in the above heading. No   
   other text should go under
   this heading.
 
Responsible(Who?)
==================

.. Required. Who is responsible for this heritage system. This can be a 
   group, a role or an administrative unit. Try to avoid linking to specific  
   persons.

* System owner: Leader, divisjon for observation quality and data processing
* Maintenance group
 * Technical management: IT-Geo-Drift, OKD
 * Content management: OKD

Description(What?)
==================

.. Required. Short description of the system: 
   - what types of metadata is stored in this system.
   - how is the metadata stored
   - formats/language

Postgres database with site metadata for weather stations. Near complete information for METNorway owned stations, a good amount of information for Norwegian weather stations with other owners, a small amount of information for some stations outside the border of Norway.

**Main information groups:**

* Stations: a collection of measurements (on a given location)
* People: Someone who has a role in connection with a station or stinfosys in general
* Equipment: Something that is/can be set up on a station
* Message: communication of data from station to MET



Documentation(Where/how?)
=========================

.. Required. Links to system dokumentation as comments, mark links that are 
   only available for internal users

The system documentation for stinfosys is only available for internal (MET) users and is (mainly) written in Norwegian.

.. GUI for stinfosys
   - link to https://stinfosys.met.no/

   Operational documentation
   - link to https://internwiki.met.no/driftsdok/stinfosys/start

   Full system documentation at gitlab
   - link to https://gitlab.met.no/obs/stinfosys
   for the database model, go to the database folder in the gitlab    repository and find the stinfosys.dia file


Conditions and dependencies(why?)
=================================

.. Required. Please add a short paragraph explaining in words why the system is as it is

.. Which users needs are this system ment to cover? 
   Are there specific choices that has been made which sets important limitations to the system? 


**Stinfosys is build to adress the needs of:**

* Forecasters: Co-location of observations, visualization and quality management for stations.
* Climate statistics: Management of long (high quality) time series.
* Maintenance management: logistic needs

**Data from stinfosys is currently used in:**

* KRO: logistic management system for weather stations at MET
* Kvalobs: Quality control system for observations at MET
* KDVH/ODA: Data storage at MET
* Obsinn: System for handling incoming observations at MET
* Frost.met.no: API for observations, externally available
* Seklima.met.no: GUI for observations, externally available

**External connections to stinfosys:**
  
None is currently(Jan 2020) operationalized, but there is work being done on these fronts:

* M2M connection to the Public Roads Administration(SVV)'s metadatabase for measurement stations (Målestasjonsregisteret)
* External metadata registration software/gui for the Norwegian Institute for Bioeconomy Research (NIBIO)
* M2M interaction with the OSCAR/Surface database (WMO metadatabase for surfae based weather stations)
