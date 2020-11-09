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


==========  ===================================  ===================================  ===================================
  Level                 Automatic                              Manual                               Human
==========  ===================================  ===================================  ===================================
    1    
    2
    3
    4
==========  ===================================  ===================================  ===================================

**In situ observations:**

Obeservations can contain uncertainty and errors, and thus they may need to be linked to quality control information. It should also be possible for a producer or consumer to flag suspicious data. 

*Primary Automatic* (sensors, etc.):

* Weather station observation data.

* Car, bus, self driving vehicle data.

* Private weather station data (Netatmo).

* Vegvesen (roadside weather stations, webcameras, and moving observations of road conditions).

* Boat, buoy, oil platform observation data. 
 
* Drone, gliders (underwater) or other drone like devices that observations.

* Radiosonde data.
 
* Biodiversity data (NINA) - automatic. 

*Secondary Automatic:*

* Quality control system.

*Primary Manual* (user observations / corrections):

* Manual weather observations for a specific station location.

* Crowdsourced observations.

* Biodiversity data (NINA) - manual / fieldwork. 

*Secondary Manual:*

* Human quality control.

**Remote sensing observations:**

These observations can contain uncertainties and noise, and how this should be interpreted varies based on the use case.

*Primary Automatic* (sensors, etc.):

* Radar and HF radar data.

* Satellite data. 
 
* Lightning strike data.

*Secondary Automatic* (calibrated, interpreted, merged products):

* A computer program accesses the raw data and processes or calibrates it in some way.

* A computer program accesses more than one source of data and creates an merged product. 

*Secondary Manual*:

* A user accesses the raw or processed data and calibrates it or interprets it in some way.

* This user shares data further on as a *data producer*.
 
**Modelling & forecast data:**

Models are often generic (for example: probabilistic), and thus their use needs to be tailored for the end user.

*Secondary Automatic* (computer software, input from observations and other data etc.):

* Weather model data.

* Ocean model data.
 
* Air quality model.
 
* Climate models.

*Secondary Partially Manual* (based on models, etc), may be more fully automatic in future:

* Warnings forecast.

* Avalanche forecast.


Consumers
=========

**Advanced:**

Example questions:

* Need all historical weather data, that can be used to model / predict the weather in the future.

Specific users: 

* Researcher.

* Climate Predictions (klima i norge 2100).

**Intermediate:**

Example questions:

* Is this observation a record / weather extreme (coldest, warmest, wettest...)?

* Amount of rain in last Month in a certain watershed.

Specific users: 

* Klimavakt (MET).

* Developer (app, website, control systems, machine learning, etc.).

* Energy sector (hydro, energy prices). 

* External partners. 

**Simple:**

Example questions:
 
* Can the event take place, or will the weather impeed it?

* When should I harvest my crops?

Specific users: 

* Event organizer. 

* Journalist.

* Farmer, or other people who work with the land like tree planters. 


