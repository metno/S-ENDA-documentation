NINA metadata catalog
=====================

.. Insert the name of the heritage metadata system in the above heading. No
   other text should go under
   this heading.


Responsible(Who?)
=================

.. Required. Who is responsible for this heritage system. This can be a
   group, a role or an administrative unit. Try to avoid linking to specific
   persons.

NINA (Norwegian Institute for Nature Research) - Environmental data department (miljødata)


Description(What?)
==================

.. Required. Short description of the system:
   - what types of metadata is stored in this system.
   - how is the metadata stored
   - formats/language

NINA is building FAIR data infrastructures. The main data portal, under construction,
will serve mainly as a FAIR metadata catalog, with limited data sharing capabilities.

Most of the NINA datasets deal with Terrestrial ecology and Biodiveristy.
For example, species occurrences during field sampling events.

Discovery metadata will be exposed as RDF documents serialized using the Data Catalog vocabulary (DCAT).

DCAT is an RDF vocabulary designed to facilitate interoperability
between data catalogs on the Web.

Improved interoperability will be reached additionally by exposing metadata with the OAI-PMH exchange protocol



Documentation(Where/how?)
=========================

.. Required. Links to system dokumentation as comments, mark links that are
   only available for internal users

Documentation for the NINA data infrastructure are still under construction, and will be provided when ready.


Conditions and dependencies(why?)
=================================

.. Required. Please add a short paragraph explaining in words why the system is as it is

.. Which users needs are this system ment to cover?
   Are there specific choices that has been made which sets important limitations to the system?
   Current dependencies: list of other systems (internal/external) currently connected to this system

* Purpose of the main metadata catalog is to publicly share info about NINA sourced data
* The NINA metadata catalog is designed to share rich metadata exposed with international standards
* datasets may be described using controlled vocabularies
* part of the data is shared with community standards and workflows, such as GBIF for biodiversity data.
* data shared through GBIF are structured using the darwin core standards
* only part of the data from NINA can be considered dynamic geodata
* Geospatial data in NINA are shared with a Geodata portal, exposing OGC web-services endpoints
* Geospatial data provide additionally ISO 19135 metadata shared through a CSW service
* NINA metadata sharing facilities could be modified partially to comply with S-ENDS requirements
* Ad-hoc data sharing platforms could be designed to meet specific S-ENDA requirements for data sharing in case of specific selected datasets