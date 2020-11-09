============================================
Data Access for advanced use
============================================

-------------------------------------------------------------
Functionality
-------------------------------------------------------------
* Users should be able to produce a dataset and upload to the data access service without time-consuming transformations.
* Users must be able to download a copy of the entire dataset.
* Users must be able to stream and filter parts of the dataset.
* Users need access to enough metadata to be able to locally post-process, reproject etc. the dataset.
* The data access service must support the FAIR principles, in particular (meta)data interoperability and reusability.
* The transport mechanism used in the data access service need to be a widely adopted standard solution.
* The dataset need to be on a widely adopted open data format standard.
* The data access service as a whole need to be easy to use with familiar tools from the meteorological/climate/oceanographic domain, both for upload and download.
* The data access service must work together with an event-driven production system.
* The data acccess service should support the Harmonised Data API from European Weather Cloud.
* Users need to able to give feedback on the data access service and each individual dataset.

-------------------------------------------------------------
Quality attributes
-------------------------------------------------------------
* The total throughput and storage size for the data access service need to scale with massively increasing size of a dataset.
* The total throughput, storage size and number of objects of the data access service need to scale with massively increasing number of datasets.
* Scaling for increasing size of datasets and increasing number of datasets must not significantly increase latency or decrease throughput for individual requests.
* Response time for first-byte in a response should be low, e.g < 50ms.
* The relationship between response time and size of data requested should be predictable, and not worse than linear response time increase with data size.

-------------------------------------------------------------
Constraints
-------------------------------------------------------------
* The data access service has no search mechanism for datasets, and assumes that the datasets can be listed/found/searched
  through a separate metadata mechanism.