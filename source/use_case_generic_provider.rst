
Generic Data Provider 
"""""""""""""""""""""""""""""

.. 

Use Case Goal
=============

.. 

A data provider wants to register their data / metadata so that it is accessible in the S-Enda portal. 


Actors
======

.. 

- An internal provider that creates aggregated or merged datasets
- An external provider that has datasets they wish to cross reference with weather data

Trigger
=======

.. 

- The provider has new data that they wish to make available. 


Pre-conditions
==============

- All data that this data is based on is available.


Post-conditions
===============

- The provider is able to register their data / metadata so that it is searchable in an appropriate manner.


Normal Flow
===========

.. 

- Learn about how to register data manually or automatically, read documentation.
- Initial setup of connection between two systems (if it is automatic).
- The provider connects to the S-Enda provider interface and sends their data / metadata for registration.
- The provider receives feedback about if the registration was sucessful. 


Alternative Flows
=================

.. 


Exceptions
==========

.. 

- The provider is unable to connect to the S-Enda interface


Includes
========

N/A

Notes and Issues
================

N/A

Relevant software
=================

N/A

Relevant datasets
=================

N/A

UML diagram
===========

.. UML diagram, example;

UML diagram, example;

.. uml::

   @startuml Provider use case
   !includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Context.puml

   LAYOUT_LEFT_RIGHT

   Person(data_provider, "Data provider")
   System(senda_provider_interface, "S-ENDA Data Provider interface")

   Rel(senda_provider_interface, data_provider, "Feedback about if the data was registered.", "Web UI")
   Rel(data_provider, senda_provider_interface, "Sends the data for registration.", "Web UI")
   @enduml
