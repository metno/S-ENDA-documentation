Klimafremskrivninger leveranse
"""""""""""""""""


Use Case Goal
=============

.. Required

   Brief description of the reason for and outcome of this Use Case, or a high-level description of
   the sequence of actions and the outcome of executing the Use Case.

Norsk klimaservicesenter skal beregne nye klima- og hydrologifremskrivninger (forventede endringer i fremtiden) for Norge.

Actors
======

.. Required

   An actor is a person or other entity, external to the system being specified, who interacts with
   the system (includes the actor that will be initiating this Use Case and any other actors who
   will participate in completing the Use Case). Different actors often correspond to different user classes, or roles, identified from the customer community that will use the product.

Norsk klimaservicesenter med partnere: MET, NVE, NORCE, Bjerknessenteret. Miljødirektoratet er bestiller.

Trigger
=======

.. Event that initiates the Use Case (an external business event, a system event, or the first step
   in the normal flow.

Miljødirektoratet bestiller oppdatering av rapporten Klima i Norge 2100, i kjølvannet av ny klimarapport fra FNs klimapanel som kommer i 2021. Ny rapport skal være klar i 2023.

Pre-conditions
==============

.. Activities that must take place, or any conditions that must be true, before the Use Case can be
   started.

-Nedskalerte og biasjuste atmosæfriske variable fra EURO-COREX (CMIP5 og CMIP6) for perioden 1971 (helst litt før) - 2100 på et 1x1 km grid tilsvarende senorge.no (fastlands-Norge).
-Hydrologisk modellering for beregning av hydrologiske variable for samme periode og på samme grid.
-Partnere i Norsk klimaservicesenter (MET, NVE, NORCE) har skrive- og lesetilgang til data
-Beregning av ulike klimaindekser basert på datasettene over
-Beregning av 30-års midler for midten og slutten av århundret
-Beregning av modellmedian
-Beregning av regionale verdier for fylker, landsdeler og muligens kommuner.
-Konvertering til andre filformater (fra netcdf)
-WMS system
-Nettside for presentasjon av data
-Nedlastningsløsning for nedlasting av data

Post-conditions
===============

.. The state of the system at the conclusion of the Use Case execution.

-Datasett (netcdf-filer) med klimafremskrivninger (f.eks. endring i temperatur) og relevante klimaindekser (f.eks. endring i antall hetebølger) på 1x1 km grid for analyse av forventede endringer i fremtiden. Disse skal være tilgjengelige for brukere på ulike filformater, modell for modell, samt modellmedian og 30-års midler for to fremtidsperioder. Man skal og kunne se verdier for regioner, landsdeler og muligens kommuner.  
-Resultater må visualiseres på en nettside.
-Data må være tilgjengelige for nedlasting til effektstudier, samt i wms-løsning for f.eks. kommuneansatte.

Normal Flow
===========

.. Detailed description of the user actions and system responses that will take place during
   execution of the Use Case under normal, expected conditions. This dialog sequence will ultimately lead to accomplishing the goal stated in the Use Case name and description. 

-Masterstudenten laster ned klimafremskrivninger for hver modell og for hele perioden
-Effektforskeren laster ned klimafremskrivninger som median av alle modeller og som middel over perioden 2071-2100.
-Journalisten velger parametre på nettsiden for å se kart over endringer i hetebølger og ekstremnedbør for midten av århundret (2041-2070), både for regioner, for hele landet og sesong for sesong.
-Kommunearbeideren får oppdatert GIS-kart av forventede endringer i flomstørrelse for sitt fylke gjennom en WMS-løsning.

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

Se klimaservicesenter.no under Klimafremskrivninger for å se hvordan dataene visualiseres og idag.
se use_case_klimafremskrivninger_bruker for beskrivelse av brukere av disse dataene.

Relevant software
=================

R and python for scripting
cdo and nco for "manipulering" av netcdf-filer

Relevant datasets
=================

seNorge2018 for biasjustering og grid-spesifikasjoner
EURO-CORDEX klimafremskrivninger som skal nedskaleres fra 12x12 km til 1x1 km for Norge
CMIP5 og CMIP6 klimafremskrivninger som skal nedskaleres til Norge
etc

UML diagram
===========

.. UML diagram, example;

UML diagram, example;

.. uml::

   @startuml
   Alice -> Bob: Hi!
   Alice <- Bob: How are you?
   @enduml
