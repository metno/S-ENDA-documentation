How-to
""""""

Preparing a Dataset
===================
Below, the steps required to prepare and expose a dataset are briefly overviewed, together with the steps necessary to have a DOI assigned by METNO's DOI registration agency, i.e. DataCite. 
The focus here is on netCDF data. Guidance on how to create dataset in netCDF format can be found online, and will not be included in this documentation. 

Supplying the right Metadata
----------------------------
According to the FAIR principle: 

- F2: Data are described with rich metadata

Metadata, i.e. data that describes data, should be as extensive and comprehensive as possible. The concept of rich metadata can vary, depending on area of research as well as on 
the community in which the data are produced and used. Generally speaking, metadata should be able to allow interested people, even with different background and experience, to be
able to find and understand what the data are about, just using the metadata provided. Being compliant with this principle allows people to find data, the correct access information, 
possible restrictions on use, how to cite the data and so on, thus enabling re-use as well as correct citation.

A key point is to provide metadata following standards, i.e. that specific set of rules and conventions that communities have agreed upon, so that definitions and meaning are clearly stated
and cannot be confused or even worse, misinterpreted. 

Metadata falls in different categories, for which an overview is presented below:


.. table:: Types of metadata
   :widths: auto

   ======================== =================== ======================================================================================== =================== 
    Type                     Purpose             Description                                                                              Example
   ======================== =================== ======================================================================================== =================== 
    Discovery metadata      Used to find        Discovery metadata are also called index metadata and are a digital version of the        ISO19115, GCMD DIF
                            relevant data       library index card. It describes who did what, where and when, how to access data
                                                and potential constraints on the data. It shall also link to further information on the
                                                data like site metadata. 
                            
    Use metadata            Used to understand  Use metadata are describing the actual content of a dataset and how it is encoded.        Climate and Forecast 
                            found data          The purpose is to enable the user to understand the data without any further              Convention,
                                                communication. It describes content of variables using standardised vocabularies,         BUFR,
                                                units of variable, encoding of missing values, map projections etc.                       GRIB,
                                                                                                                                          Darwin Core Archive

    Configuration metadata  Used to tune        Configuration metadata are used to improve the services offered through a portal          Used locally by data
                            portal services for to the user community. This can be e.g. how to best visualise a product.                  centers
                            datasets for users  
                                                 
    Site metadata           Used to             Site metadata are used to describe the context of observational data. It describes       WIGOS, OGC O&M
                            understand found    the location of an observation, the instrumentation, procedures etc. To a certain
                            data                extent it overlaps with discovery metadata, but more so it really extends discovery
                                                metadata. Site metadata can be used for observation network design.
   ======================== =================== ======================================================================================== =================== 

Delivering ACDD and CF compliant data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
As mentioned above, discovery metadata are those information which are used to find what a user is looking for. Following the Attribute Convention for Data Discovery (`ACDD <http://wiki.esipfed.org/index.php/Attribute_Convention_for_Data_Discovery_1-3>`_), there are no mandatory fields, although some are highly recommended, and as general rule, the more information is given, the easier 
for a potential data user to find relevant data. It is recommended to use ACDD in version 1.3 or higher.  

Once the data are found, it is essential to be able to understand  unequivocally its content. The `CF conventions <http://cfconventions.org/>`_ define metadata that provide a definitive description of what the data in each variable represents, and the spatial and temporal properties of the data. This enables users of data from different sources to decide which quantities are comparable, and facilitates building applications with powerful extraction, regridding, and display capabilities. It is recommended to use CF in version 1.6 or higher.

When correct, all information can be valuable. 

Compliance with the above mentioned standard can be checked using online validation tools. 

Make a Dataset available
------------------------
Once data are prepared, with necessary metadata as described above, these data should be made available, as for example through THREDDS or HYRAX data servers. 
Data should be structured to allow for aggregation if needed, to reflect a useful granularity, and selected services, depending on the data provided, should be 
exposed on the data server, as for example OPeNDAP access to data to allow remote data stream. 

Creation of MMD files and storage
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Once a data provider has requested a DOI for a specific dataset (or collection), metadata information are extracted. The creation of an xml file containing metadata entries,
using the MET Norway Metadata Format Specification (`mmd <https://github.com/steingod/mmd/blob/master/doc/mmd-specification.pdf>`_), can be extracting using for example the 
conversion script `nc_to_mmd.py <https://github.com/steingod/mmd/blob/master/src/nc_to_mmd.py>`_ when CF/ACDD compliant netCDF files are provided. 
The files containing the provided metadata will be stored in a version controlled repository, which will be the authoritative source of metadata and can also be used to index 
the dataset in searchable resources. 

Compiling the metadata collection webform (not recommended)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
When automatic extraction of metadata cannot be done, it is possible to fill in a `webform <https://adc.met.no/metadata-collection-form>`_ to supply metadata for a specific dataset, or data collection.
Metadata information are then extracted automatically on the adc.met.no portal, and translated into mmd format, using an xslt transformation (see. mmd repository). 

Creation of landing pages and assignment of DOI
===============================================

In order for the DOI registration agency (DataCite) to assign a DOI, METNO has to send: 

1. A metadata file containing at least the DataCite mandatory elements
2. A URL of the landing page, which will be the persistent URL to which the DOI resolves

The first point is covered by the information above, while the second one can be covered generally by creating a landing page, which can be customized 
according to users needs. 

Currently, landing pages for datasets which require a DOI will be automatically created on the https://adc.met.no/ data portal starting from the 
available metadata, upon request from the data provider. Only administrators of the data portal has access to this service and are thus the only ones 
who can finalize the process of assigning DOI. 

A Drupal 7 module has been developed, implemented and configured on the https://adc.met.no/ data portal. The source code with detailed explanation 
on how to implement this solution is openly available at: 

https://github.com/ferrighi/landing_page_creator

Examples of landing pages created using this approach are available at: 

https://adc.met.no/landing-page-collector


.. note:: Further reading and resources

 - `Submit data as NetCDF/CF <https://adc.met.no/node/4>`_
 - `DOI at MET <https://adc.met.no/sites/adc.met.no/files/articles/DOIs-at-METNO.pdf>`_

