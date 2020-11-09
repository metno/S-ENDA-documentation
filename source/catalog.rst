============================================
Discovery and Configuration Metadata Catalog
============================================

The S-ENDA Discovery Metadata Catalog is a catalog consisting of MMD xml records describing the datasets that are shared through the S-ENDA project platforms. The Discovery Metadata will be made available for harvesting by other data centers through OAI-PMH and for searching by users (machine to machine) through OpenSearch. Documentation on how to search these discovery metadata can be found in :ref:`search-context`.

The S-ENDA Discovery and Configuration Metadata Catalog is set up to use the MET Norway discovery and configuration metadata standard (MMD) maintained by the Norwegian Meteorological institute. The full documentation and tools for using the MMD standard can be found at https://github.com/metno/mmd.

Python scripts for translating MMD metadata files to and from DIF and ISO, and scripts to create MMD metadata xml files from NetCDF files can be found in mmd_utils folder in the MMD-git repository (they will be gradually moved to a new repository at https://github.com/metno/py-mmd-tools).

The Discovery and Configuration Metadata Catalog is not openly available but its interfaces are.

-------------------------------------------------------------
Structure of the Discovery and configuration metadata catalog
-------------------------------------------------------------

The Discovery and Configuration Metadata Catalog is a git repository of xml files on METs Gitlab. Gitlab is used because some dataset metadata is restricted and cannot be exposed to the public.

The metadata repository is divided into separate folders containing MMD discovery metadata files for different types of data. Some of the folders are divided into subfolders. New folders may be added if needed. The current folder structure is as follows:

* Model: Metadata files for results from model simulations. Datasets from different models can be sorted into subfolders
* Remote-Sensing: Metadata files from satellites, radars and other remote sensing instruments. Subfolders may be different satellites and/or different technologies/instruments.
* In-situ: Metadata files from insitu measurements. This might be observations made on land or in the ocean. The measurements may have been made by stationary or moving stations. Stationary and moving data are divided into separate subfolders.


