Catalog Service API
====================

The software library used to implement the Catalogue Service API is based on the `PyCSW <https://pycsw.org/>`__  python
library.

- The official software documentation is available at https://pycsw.org/docs/
- An overview of the PyCSW project can be also found at https://osgeo.github.io/OSGeoLive-doc/en/overview/pycsw_overview.html
- A quick-start based on the `OSGeo-Live <https://live.osgeo.org/en/index.html>`__ project is available at https://osgeo.github.io/OSGeoLive-doc/en/quickstart/pycsw_quickstart.html




Notes for S-ENDA related development
""""""""""""""""""""""""""""""""""""


* **Example Driver**
    - `ISO reader <https://github.com/geopython/pycsw/blob/master/pycsw/plugins/profiles/apiso/apiso.py>`__
* **Example Output**
    - `DIF Output Schema <https://github.com/geopython/pycsw/blob/master/pycsw/plugins/outputschemas/dif.py>`__
       can be used as guideline to create a DCAT (or GeoDCAT) output from pycsw's core model
* Open Issue about Geo-DCAT
    - `Support DCAT <https://github.com/geopython/pycsw/issues/257>`__ in pycsw
    - `ISO to GeoDCAT XSLT <https://github.com/SEMICeu/iso-19139-to-dcat-ap>`__
