-----
Users 
-----

There are 2 types of users:

1. Those that create / produce data
2. Those that consume data 

One can both consume data and produce it, or just have one of these roles.

We tried to use the levels described here: http://codes.wmo.int/wmdr/_LevelOfData

As well as the sources (at least automatic, manual, and human) described here: http://codes.wmo.int/wmdr/_SourceOfObservation


Producers
=========


=========  ================================================  ================================================  ================================================
  Level                       Automatic                                            Manual                                              Human
=========  ================================================  ================================================  ================================================
    1      * Weather station observation data                * Manual weather observations at a station
           * Car, bus, self driving vehicle data             * Crowdsourced observations                       * Crowdsourced observations
           * Vegvesen roadside sensors, webcameras           * Biodiversity data (NINA) - manual               * Biodiversity data (NINA) - fieldwork 
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
           * Calibrated products based on satelite data
           * Merged products based on level 1 data
    3      * Resampled time series                           * Producer manually resamples time series
           * Gridded datasets based on level 1 data
    4      * Weather model data                              * Warnings forecast                               * Climate predictions
           * Ocean model data                                * Avalanche forecast
           * Air quality model                               * Nowcast
           * Climate models                                   
=========  ================================================  ================================================  ================================================

**In situ observations:**

Observations can contain uncertainty and errors, and thus they may need to be linked to quality control information. It should also be possible for a producer or consumer to flag suspicious data. 


**Remote sensing observations:**

These observations can contain uncertainties and noise, and how this should be interpreted varies based on the use case.

 
**Modelling & forecast data:**

Models are often generic (for example: probabilistic), and thus their use needs to be tailored for the end user potentially with particular types of forecasts.


Consumers
=========

**Advanced:**

Advanced consumers require enough metadata (including provenance) to gain a full understanding of what data exists so they can choose the data appropriate for their use. 

Example questions:

* Need all historical weather data, that can be used to model / predict the weather in the future.

Specific consumers: 

* Researcher.

* Climate Predictions (klima i norge 2100).

**Intermediate:**

Intermediate consumers need enough metadata to understand if the data can answer their question(s), also they often want to cross reference a dataset with another dataset or metadata. 

Example questions:

* Is this observation a record / weather extreme (coldest, warmest, wettest...)?

* Amount of rain in last Month in a certain watershed.

Specific consumers: 

* Klimavakt (MET).

* Developer (app, website, control systems, machine learning, etc.).

* Energy sector (hydro, energy prices). 

* External partners. 

**Simple:**

Simple consumers are not able to understand all the metadata and are most likely looking for a derived product that more simply answers their question(s).

Example questions:
 
* Can the event take place, or will the weather impeed it?

* When should I harvest my crops?

Specific consumers: 

* Event organizer. 

* Journalist.

* Farmer, or other people who work with the land like tree planters. 


