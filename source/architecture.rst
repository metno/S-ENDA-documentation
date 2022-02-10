===================
S-ENDA Architecture
===================

About the architecture drafts:

- They are described using the C4 model (https://c4model.com/). C4 does not define any properties based on the directionality of the used arrows so each arrow should have a textual description to avoid disambiguity
- They are work in progress, and many updates are expected as we dig into the details
- They are to a high degree based on the use cases outlined in :ref:`use-cases-section`

----------------
General Contexts
----------------

S-ENDA is part of a larger effort within the national geodata strategy (*"Alt skjer et sted"*), and relates to this strategy through Geonorge, which is developed and operated by the Norwegian Mapping Authority (*"Kartverket"*). GeoNorge, in turn, relates to the European Inspire Geoportal through the Inspire directive. In particular, S-ENDA is responsible for *Action 20* of the Norwegian geodata strategy.  The goal of action 20 is to *establish a distributed, virtual data center for use and management of dynamic geodata*. S-ENDA's vision is that *everyone, from professional users to the general public, should have easy, secure and stable access to dynamic geodata*. 

The vision of S-ENDA and the goal of action 20 are aligned with international guidelines, in particular the `FAIR Guiding Principles for scientific data management and stewardship <https://www.nature.com/articles/sdata201618>`_.

..
  .. note::
  
     Relations in the C4 diagrams illustrate protocol and standard in brackets as [<protocol>: <standard>].
     
     When the protocol/standard is represented by several instances divided by a forward slash "/", the final solution may contain several protocols/standards or is still open for discussion.
  
S-ENDA in a national and international context
==============================================

Dynamic geodata is weather, environment and climate-related data that changes in space and time and is thus descriptive of processes in nature. Examples are weather observations, weather forecasts, pollution (environmental toxins) in water, air and sea, information on the drift of cod eggs and salmon lice, water flow in rivers, driving conditions on the roads and the distribution of sea ice. Dynamic geodata provides important constraints for many decision-making processes and activities in society. 

Geonorge is the national website for map data and other location information in Norway. Here, users of map data can search and access such information. Dynamic geodata is one such information type. S-ENDA extends Geonorge by taking responsibility for harmonising the management of dynamic geodata in a consistent manner.

The below figure illustrates S-ENDA's position in the national and international context. As illustrated, GeoNorge CSW harvesting should also make S-ENDA datasets findable by other systems.

.. uml:: puml/architecture/national_and_international_context.puml

..
  Context with a distributed S-ENDA Discovery Metadata Service solution
  ---------------------------------------------------------------------
  
  An alternative solution to the central catalogue system, is a system based on a gossip protocol [2]_. In this system, the distributed data centres use peer-to-peer *gossip* to ensure that metadata is disseminated to all members of the *S-ENDA Discovery Metadata Service* system. In this setting, there is no dependence on a central catalog, and the external systems can connect to any internal node in order to discover all of them. This would be a more truly *distributed system* but is challenging to get to work in practice. The context diagram for such a solution is shown below.
  
  .. uml:: context-gossip.puml
  

-------------------------
S-ENDA C4 Context Diagram
-------------------------

The below diagram describes the S-ENDA system in the boundary for dynamic geodata above. The data consumers are defined in :ref:`users-definition`.

.. uml:: puml/architecture/S-ENDA-context-diagram.puml

S-ENDA Discovery Metadata Service - C4 container diagram
========================================================

.. uml:: puml/architecture/S-ENDA-discovery-metadata-service-container-diagram.puml

Dataset catalog service API - C4 component diagram
--------------------------------------------------

..
  .. uml:: puml/architecture/pyCSW_MMD_component_diagram.puml

..
  For the MMD variant we would need to write the MMD plugin and output schema. See pyCSW docs at https://docs.pycsw.org/en/2.4.2/introduction.html.

Production Hubs - C4 container diagram
======================================

.. uml:: puml/architecture/S-ENDA-production-container-diagram.puml

.. See commented code in puml/architecture/S-ENDA-discovery-metadata-service-context-diagram.puml


Distribution Systems - C4 container diagram 
===========================================

.. See commented code in puml/architecture/S-ENDA-discovery-metadata-service-context-diagram.puml

.. uml:: puml/architecture/S-ENDA-data-distribution-container-diagram.puml
