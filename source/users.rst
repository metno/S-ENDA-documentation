-----
Users 
-----

There are 2 types of users:

1. *Producers*: Those that create / produce data
2. *Consumers*: Those that consume data 

Users typically consume some type of data in order to do something and produce a new type of data. We refer to these data types as levels, following the `WMO WIGOS definition for levels of data <http://codes.wmo.int/wmdr/_LevelOfData>`_. The typical workflow is reflected by the below table, where a consumer of one level of data is the producer of the next level of data. The columns of this table define the observation source (i.e., automatic, manual, human) of datasets covered by the user analysis. The observation source definitions follow the `WMO WIGOS definition for source of observation <http://codes.wmo.int/wmdr/_SourceOfObservation>`_.

A user can both consume data and produce data, or just have one of these roles (i.e., at the start/end of the production chain).


Producers
=========


=========  ================================================  ================================================  ================================================
  Level                       Automatic                                            Manual                                              Human
=========  ================================================  ================================================  ================================================
    1      * Weather station observation data                * Manual weather observations at a station
           * Car, bus, self driving vehicle data             * Crowdsourced observations                       * Crowdsourced observations
           * Vegvesenet roadside sensors, webcameras         * Biodiversity data (NINA) - manual               * Biodiversity data (NINA) - fieldwork 
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


Consumers
=========

.. _`advanced-consumers`:

Advanced consumers
------------------

**Definition:** Advanced consumers require information in the form of data and metadata (including provenance) to gain a full understanding of what data exists and how to use it (discovery and use metadata), and to automatize the generation of derived data (new knowledge generation), verification (of information), and validation of data products.

Example questions:

* Need all historical weather data, that can be used to model / predict the weather in the future.

Specific consumers: 

* Researcher.

* Climate Predictions (klima i norge 2100).

.. _`intermediate-consumers`:

Intermediate consumers
----------------------

**Definition:** Intermediate consumers need enough information to find data and understand if it can answer their question(s) (discovery and use metadata). Also, they often want to cross reference a dataset with another dataset or metadata for inter-comparative verification of information.

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

**Definition:** Simple consumers do not have any prior knowledge about the data. Information in the form of text or illustrations is sufficient for their decision making. They do not need to understand either data or metadata, and they are most likely looking for answers to simple questions.

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
