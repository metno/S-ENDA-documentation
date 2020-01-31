Catalog Service API
""""""""""""""""""""

The software library used to implement the Catalogue Service API is based on the PyCSW python
library.  PyCSW enables users to publish a catalogue of dataset descriptions (metadata) to the web,
using standard based interfaces and formats, such that it can be queried and updated by catalogue
clients. PyCSW is simple to install within an Apache web server (or any WSGI server) and can access
metadata records stored as XML files within a database.

Metadata is 'data about data', storing such things as creation-date, author, title,
area-of-interest, etc., and is usually encoded as XML files, following international standards such
as ISO 19115, ISO 19139 and FGDC CSDGM.  PyCSW is the software library used to provide a catalogue
service. PyCSW implements the  `OGC Catalogue Services for the Web (CSW) standard
<https://www.opengeospatial.org/standards/cat>`_. The project is certified `OGC Compliant`_, and is
an OGC Reference Implementation. The CSW standard defines common interfaces to discover, browse and
query metadata about spatial data, web services and related resources.

Core Features
===============

* Certified OGC Compliant and OGC Reference Implementation for OGC CSW 2.0.2 and CSW 3.0.0
* Harvesting support for WMS, WFS, WCS, WPS, WAF, CSW, SOS
* Implements the INSPIRE Discovery Services 3.0
* Implements the ISO Metadata Application Profile 1.0.0
* Implements the FGDC CSDGM Application Profile for CSW 2.0
* Implements Search/Retrieval via URL (SRU) search protocol
* Implements Full Text Search capabilities
* Implements the OGC OpenSearch Geo/Time extensions
* Implements the Open Archives Initiative Protocol for Metadata Harvesting
* Supports ISO, Dublin Core, DIF, FGDC, Atom and GM03 metadata models
* CGI or WSGI deployment
* Python 2 and 3 compatible
* Simple configuration
* Transactional capabilities (CSW-T)
* Flexible repository configuration
* GeoNode connectivity
* HHypermap connectivity
* Open Data Catalog connectivity
* CKAN connectivity
* Federated catalogue distributed searching
* Realtime XML Schema validation
* Extensible profile plugin architecture
* Very lightweight (Python + CGI)


Implemented Standards
==========================

**OGC Standards:**

* CSW 	2.0.2, 3.0.0
* Filter 	1.1.0, 2.0.0
* OWS Common 	1.0.0, 2.0.0
* GML 	3.1.1
* OGC SFSQL 	1.2.1
* OGC OpenSearch  1.0

**Metadata Standards:**

* Dublin Core 	1.1
* SOAP 	1.2
* ISO 19115:2003
* ISO 19139:2007
* ISO 19119:2005
* NASA DIF 9.7
* FGDC CSDGM 1998
* GM03  2.1
* SRU 	1.1
* OAI-PMH   2.0
* A9 OpenSearch 	1.1

Details
===========

**Website:** https://pycsw.org

**Licence:** `MIT`_

**Software Version:** 2.4.2

**Supported Platforms:** Windows, Linux, Mac

**API Interfaces:** Python

**Documentation:** https://pycsw.org/docs/

**Support:** https://pycsw.org/docs/support.html

Notes for S-ENDA development
==============================

* **Example Driver**
    - `ISO reader <https://github.com/geopython/pycsw/blob/master/pycsw/plugins/profiles/apiso/apiso.py>`__
* **Example Output**
    - `DIF Output Schema <https://github.com/geopython/pycsw/blob/master/pycsw/plugins/outputschemas/dif.py>`__
       can be used as guideline to create a DCAT (or GeoDCAT) output from pycsw's core model
* Open Issue about Geo-DCAT
    - `Support DCAT <https://github.com/geopython/pycsw/issues/257>`__ in pycsw
    - `ISO to GeoDCAT XSLT <https://github.com/SEMICeu/iso-19139-to-dcat-ap>`__

.. _`Python`: https://www.python.org/
.. _`MIT`: https://docs.pycsw.org/en/latest/license.html
.. _`OGC Compliant`: https://www.opengeospatial.org/resource/products/details/?pid=1374
.. _`OGC Reference Implementation`: http://demo.pycsw.org/

Disclaimer: This PyCSW documentation has been adapted from the `OSGEO-Live Documentation
<https://osgeo.github.io/OSGeoLive-doc/en/index.html>`__
