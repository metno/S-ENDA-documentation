===================
Catalog Service API
===================

The software library used to implement the Catalogue Service API is based on the `PyCSW <https://pycsw.org/>`__  python
library.

- The official software documentation is available at https://pycsw.org/docs/
- An overview of the PyCSW project can be also found at https://osgeo.github.io/OSGeoLive-doc/en/overview/pycsw_overview.html
- A quick-start based on the `OSGeo-Live <https://live.osgeo.org/en/index.html>`__ project is available at https://osgeo.github.io/OSGeoLive-doc/en/quickstart/pycsw_quickstart.html


The PyCSW implementation available on the `S-ENDA-Prototype <https://github.com/metno/S-ENDA-Prototype>`__  repository is composed by two main docker containers orchestrated by docker-compose.

* pycsw container: pycsw service running as a WSGI application under the apache web-server
* postgresql container:  PostgreSQL with PostGIS extension used by pycsw as backend database

There is a third, additional, container *hyrax* added for convenience if/when data-access based on the OpenDAP protocol is needed:

* hyrax container: Implementing the OpenDAP service

-------
Testing
-------

To **start** the `docker-compose` environment, from inside a cloned repository type:

.. code-block:: bash

    docker-compose up

To **stop** the `docker-compose` environment, from inside a cloned repository type


.. code-block:: bash

    docker-compose down

The CSW endpoint will be available on the host machine on port 8000 (e.g., http://localhost:8000/).

------------------------------------
Notes for S-ENDA related development
------------------------------------


* **Example PyCSW Driver**
    - `ISO reader <https://github.com/geopython/pycsw/blob/master/pycsw/plugins/profiles/apiso/apiso.py>`__
* **Example PyCSW Output Schema**
    - `DIF Output Schema <https://github.com/geopython/pycsw/blob/master/pycsw/plugins/outputschemas/dif.py>`__
       can be used as guideline to create a DCAT (or GeoDCAT) output from pycsw's core model
* Open GitHub Issue on PyCSW repository related the implementation of a Geo-DCAT output schema
    - `Support DCAT <https://github.com/geopython/pycsw/issues/257>`__ in pycsw
    - `ISO to GeoDCAT XSLT <https://github.com/SEMICeu/iso-19139-to-dcat-ap>`__


--------------------------------------------------------------
Acronyms and link to resources used in the PyCSW documentation
--------------------------------------------------------------

- `Web Mapping Service <https://www.opengeospatial.org/standards/wms>`__ (WMS)
- `Web Feature service <https://www.opengeospatial.org/standards/wfs>`__ (WFS)
- `Web Coverage Service <https://www.opengeospatial.org/standards/wcs>`__ (WCS)
- `Web Processing Service <https://www.opengeospatial.org/standards/wps>`__ (WPS)
- `Web Accessible Folders <https://ioos.github.io/catalog/pages/registry/waf_creation/>`__ (WAF)
- `Catalogue Services for the Web <https://www.opengeospatial.org/standards/cat>`__ (CSW)
- `Sensor Observation Service <https://www.opengeospatial.org/standards/sos>`__ (SOS)
- `Federal Geographic Data Committee <https://www.fgdc.gov/>`__ (FGDC)
- `FGDC Content Standard for Digital Geospatial Metadata <https://www.fgdc.gov/metadata/csdgm-standard>`__ (FGDC CSDGM)
- Directory Interchange Format (DIF)
- `GM03 <https://www.geocat.admin.ch/en/dokumentation/gm03.html>`__ metadata models
- `OGC Filter Encoding <https://www.opengeospatial.org/standards/filter>`__
-  `OGC Web Services <https://www.opengeospatial.org/standards/common.>`__ (OWS)
-  `Geography Markup Language <https://www.opengeospatial.org/standards/gml>`__ (GML)
-  `Simple Feature Access <https://www.opengeospatial.org/standards/sfs>`__ (OGC SFSQL)
- `OGC OpenSearch  1.0 <https://www.opengeospatial.org/standards/opensearchgeo>`__
- `Dublin Core 	1.1 <https://www.dublincore.org/specifications/dublin-core/dces/>`__ (DC)
- `Simple Object Access Protocol <https://www.w3.org/TR/soap/>`__ (SOAP)
- `ISO 19115:2003 <https://www.iso.org/standard/26020.html>`__
- `ISO 19139:2007 <https://www.iso.org/standard/32557.html>`__
- `ISO 19119:2005 <https://www.iso.org/standard/39890.html>`__
- `GM03  2.1 <https://www.geocat.admin.ch/en/dokumentation/gm03.html>`__
- `Search/Retrieval via URL search protocol <https://www.loc.gov/standards/sru/sru-1-1.html>`__  (SRU)
- `Open Archives Initiative Protocol for Metadata Harvesting <http://www.openarchives.org/OAI/openarchivesprotocol.html>`__ (OAI-PMH)
- `A9 OpenSearch 	1.1 <https://github.com/dewitt/opensearch/blob/master/opensearch-1-1-draft-6.md>`__
