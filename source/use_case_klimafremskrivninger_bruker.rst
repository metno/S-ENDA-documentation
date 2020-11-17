.. _klimafremskrivninger-bruker:

Klimafremskrivninger bruker
"""""""""""""""""""""""""""


Use Case Goal
=============

.. Required

   Brief description of the reason for and outcome of this Use Case, or a high-level description of
   the sequence of actions and the outcome of executing the Use Case.

Ulike brukere som jobber med klimatilpasning eller produkter for klimatilpasning skal hente relevante data om forventede endringer i fremtidsklima  (klimafremskrivninger) fra Norsk klimaservicesenter. Dette inkluderer hydrologi og effekter på naturfare.

.. uml:: information_to_knowledge_klima_bruker.puml

Actors
======

.. Required

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user classes, or roles, identified from the customer community that will use the product.

* En planlegger i kommunen som ønsker kunnskap om klimaendringer i sitt område, og trenger kart over endringer i GIS-format
* En forsker som vil bruke klimafremskrivninger inn i en biologimodell for å undersøke effekten på flått
* En journalist som vil lage en visualisering av klimaendringer i alle norske kommuner
* En statlig myndighet som vil undersøke effekter av klimaendringer innen sitt ansvarsområde


Trigger
=======

.. Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

Se under Actors

Pre-conditions
==============

.. Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

* Klimafremskrivninger av relevante parametre og indekser på 1x1 km grid (a'la senorge)
* Netcdf-filene må kunne konvertering til andre filformater, f.eks GIS formater
* WMS system for distribusjon av kart
* Nettside for presentasjon av data
* Nedlastningsløsning for nedlasting av data, både for regioner, fylker, kommuner (?) og hele landet. Både klimamodell for klimamodell (for effektforskere) og 30-års midlede medianverdier (median av alle klimamodeller).

Post-conditions
===============

.. The state of the system at the conclusion of the Use Case execution.

* Datasett (netcdf-filer) med klimafremskrivninger (f.eks. endring i temperatur) og relevante klimaindekser (f.eks. endring i antall hetebølger) på 1x1 km grid for analyse av forventede endringer i fremtiden. Disse skal være tilgjengelige for brukere på ulike filformater, modell for modell, samt modellmedian og 30-års midler for to fremtidsperioder. Man skal og kunne se verdier for regioner, landsdeler og muligens kommuner.  
* Resultater må visualiseres på en nettside.
* Data må være tilgjengelige for nedlasting til effektstudier, samt i wms-løsning for f.eks. kommuneansatte.

Normal Flow
===========

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately lead to accomplishing the goal stated in the Use Case name and description. 

* Masterstudenten laster ned klimafremskrivninger for hver modell og for hele perioden
* Effektforskeren laster ned klimafremskrivninger som median av alle modeller og som middel over perioden 2071-2100.
* Journalisten velger parametre på nettsiden for å se kart over endringer i hetebølger og ekstremnedbør for midten av århundret (2041-2070), både for regioner, for hele landet og sesong for sesong.
* Kommunearbeideren får oppdatert GIS-kart av forventede endringer i flomstørrelse for sitt fylke gjennom en WMS-løsning.

Alternative Flows
=================

.. Other, legitimate usage scenarios that can take place within this Use Case.

Journalisten vil vite været 25.juni 2074, men det skal fremgå tydelig at våre data ikke kan brukes til det.

Exceptions
==========

.. Anticipated error conditions that could occur during execution of the Use Case, and how the
   system is to respond to those conditions, or the Use Case execution fails for some reason.



Includes
========

.. Other Use Cases that are included (“called”) by this Use Case (common functionality appearing in
   multiple Use Cases can be described in a separate Use Case included by the ones that need that
   common functionality).

Notes and Issues
================

.. Additional comments about this Use Case and any remaining open issues that must be resolved. (It
   is useful to Identify who will resolve each such issue and by what date.)

* Se klimaservicesenter.no under Klimafremskrivninger for å se hvordan dataene visualiseres og idag
* Se :ref:`klimafremskrivinger-leveranse` for beskrivelse av leveransen av disse dataene

Relevant software
=================

GIS, R, python

Relevant datasets
=================


UML diagram
===========

.. UML diagram, example;

