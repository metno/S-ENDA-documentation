.. _`user-analysis-context`:

-------
Context
-------

:Vision: Everyone, from professional users to the general public, should have easy, secure and stable access to dynamic geodata. S-ENDA shall achieve cross-sectoral coordination of data management and cost-effective use of resources on both the supplier and consumer side.

:Goals:

* Increased use of real-time and historical dynamic geodata at all user levels
* Information made available in the form of dynamic geodata must be verifiable and traceable (back to basic/raw data)
* Reduced costs for establishment and operation of effective management of dynamic geodata at the partner institutions

.. uml:: puml/user_analysis/information_to_knowledge.puml

As displayed in the above figure, data is processed and interpreted to generate knowledge (e.g., about the weather) for end users. The knowledge can be presented as information in the form of actual data, illustrations, text or other forms of communication. In this context, an illustration is a representation of data, whereas data means the numerical values needed to analyse and interpret a natural process (i.e., calibrated or with calibration information; it must be possible to understand the meaning of the numerical value from the available and machine-readable information).

:Definition: Data means the numerical values needed to analyse and interpret a natural process (i.e., calibrated or with calibration information; it must be possible to understand the meaning of the numerical value from the available and machine-readable information).

Users typically consume some type of data in order to process and interpret it, and produce knowledge, e.g., in the form of a new dataset or other information. Following the `WMO WIGOS definition for levels of data <http://codes.wmo.int/wmdr/_LevelOfData>`_, data comes at different levels (see the below table). The columns in the below table define the observation source (i.e., automatic, manual, human) of the data. The observation source definitions follow the `WMO WIGOS definition for source of observation <http://codes.wmo.int/wmdr/_SourceOfObservation>`_.

=========  ================================================  ================================================  ================================================
  Level                       Automatic                                            Manual                                              Human
=========  ================================================  ================================================  ================================================
    0      * Voltages from instrument readings
           * Satellite radiances
           * Water-vapour pressure
    1      * Weather station observation data (in            * Manual weather observations at a station
             appropriate physical units)                     * Crowdsourced observations
           * Car, bus, self driving vehicle data             * Biodiversity data (NINA) - manual               * Crowdsourced observations
           * Vegvesenet roadside sensors, webcameras                                                           * Biodiversity data (NINA) - fieldwork 
           * Private weather station data (Netatmo)
           * Boat, buoy, oil platform observation data
           * Drone, gliders (underwater) etc
           * Radiosonde data
           * Biodiversity data (NINA) - automatic
           * Radar and HF radar data
           * Satellite data
           * Lightning sensor data
    2      * Quality control system                          * Human quality control - manual control          * Human quality control - subjective control
           * Aggregated time series                          * Producer manually creates aggregated dataset    * Producer subjectively creates a dataset 
           * Lightning strike location data                  * Produce manually creates calibrated dataset
           * Calibrated products based on radar data         * Producer manually creates merge dataset 
           * Calibrated products based on satellite data
           * Merged products based on level 1 data
    3      * Resampled time series                           * Producer manually resamples time series
           * Gridded datasets based on level 1 data
    4      * Weather model data                              * Warnings forecast                               * Climate predictions
           * Ocean model data                                * Avalanche forecast
           * Air quality model                               * Nowcast
           * Climate models                                   
=========  ================================================  ================================================  ================================================

.. _`users-definition`:

----------------
Users definition
----------------

We define two types of users:

1. **Producers**: Those that create / produce data
2. **Consumers**: Those that consume data 

A consumer of one level of data is typically a producer of data at the next level. A user can both consume data and produce data, or just have one of these roles (i.e., at the start/end of the production chain).

.. uml:: puml/user_analysis/users.puml

Data Consumers
==============

.. _`advanced-consumers`:

Advanced consumers
------------------

:Definition: Advanced consumers require information in the form of data and metadata (including provenance) to gain a full understanding of what data exists and how to use it (discovery and use metadata), and to automatize the generation of derived data (new knowledge generation), verification (of information), and validation of data products.

Example questions:

* Need all historical weather data, that can be used to model / predict the weather in the future.

Specific consumers: 

* Researcher.

* Climate Predictions (klima i norge 2100).

.. _`intermediate-consumers`:

Intermediate consumers
----------------------

:Definition: Intermediate consumers need enough information to find data and understand if it can answer their question(s) (discovery and use metadata). Also, they often want to cross reference a dataset with another dataset or metadata for inter-comparative verification of information.

Example questions:

* Is this observation a record / weather extreme (coldest, warmest, wettest...)?

* Amount of rain in last Month in a certain watershed.

Specific consumers: 

* Klimavakt (MET).

* Developer (app, website, control systems, machine learning, etc.).

* Energy sector (hydro, energy prices). 

* External partners. 

.. _`simple-consumers`:

Simple consumers
----------------

:Definition: Simple consumers do not have any prior knowledge about the data. Information in the form of text or illustrations is sufficient for their decision making. They do not need to understand either data or metadata, and they are most likely looking for answers to simple questions.

Example questions:

* Will it be raining today?
 
* Can the event take place, or will the weather impeed it?

* When should I harvest my crops?

Specific consumers: 

* Event organizer. 

* Journalist.

* Farmer, or other people who work with the land like tree planters. 

.. note::

  An advanced consumer may discover information pertaining a role as a simple consumer. Such a user may, for some reason, be interested in tracking the data in order to use it together with other data (interoperability) or to verify the information. Therefore, it is important to have provenance metadata pointing to the basic data source(s) also at the simplest information level.


.. _`data-producers`:

Data Producers
==============

:Definition: A producer is an advanced consumer at one level of data that generate new information at a higher level. This new information could be in the form of actual data or simple information, such as an illustration or a text summary. It is essential that any information can be traced back to the source(s).
