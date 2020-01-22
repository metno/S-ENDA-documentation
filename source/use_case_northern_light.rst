Use case Find latest satellite image describing cloud cover for visibility of Northern Light
"""""""""""""""""

..

   Insert the title of the use case template in the above heading. No other text should go under
   this heading.

Use Case Goal
=============

.. 

   Required

   Brief description of the reason for and outcome of this Use Case, or a high-level description of
   the sequence of actions and the outcome of executing the Use Case.

A user(tourist guide) want to see Northern light, but the current location is cloudy. Find information about cloud cover in the nearby areas to find places with less clouds. This can be done with infrared satellite imagerey and or analysed cloud products.

Actors
======

.. 

   Required

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user
   classes, or roles, identified from the customer community that will use the product.

- Random user with limited experience
- Random user (tourist guide) doing this every evening to plan an excursion
- Data owner (satellite)(Obsklim, FOU-FD)
- Data provider (satellite)(Obsklim, NBS)


Trigger
=======

.. 

   Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

- User experience cloudy conditions and wants to find nearby areas with less clouds.
- Use planning an excursion want to check the resent cloud cover information to plan the excursion.


Pre-conditions
==============

.. 

   Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

- Satellite product for visualisation clouds (gridded) at night must be available for WMS
- Satellite product for download in like netcdf(gridded) for a more experienced user to visualize in their prefered tool
- Meta data must be registered for the product for the user to be able to find it.

Post-conditions
===============

.. 

   The state of the system at the conclusion of the Use Case execution.

- User be able to zoom and pan in a WMS with the product overlayed some map to easy relate the data to a location.
- User be able to load the downloaded data into the desired visualisation tool

Normal Flow
===========

.. 

   Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately
   lead to accomplishing the goal stated in the Use Case name and description.

- 
Alternative Flows
=================

.. 

   Other, legitimate usage scenarios that can take place within this Use Case.

Exceptions
==========

.. 

   Anticipated error conditions that could occur during execution of the Use Case, and how the
   system is to respond to those conditions, or the Use Case execution fails for some reason.

Includes
========

.. 

   Other Use Cases that are included (“called”) by this Use Case (common functionality appearing in
   multiple Use Cases can be described in a separate Use Case included by the ones that need that
   common functionality).

Notes and Issues
================

.. 

   Additional comments about this Use Case and any remaining open issues that must be resolved. (It
   is useful to Identify who will resolve each such issue and by what date.)

Relevant software
=================

Relevant datasets
=================

UML diagram
===========

..

   UML diagram, example;

   .. uml::

      @startuml
      Alice -> Bob: Hi!
      Alice <- Bob: How are you?
      @enduml
