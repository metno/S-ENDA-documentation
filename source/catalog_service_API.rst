Catalog Service API
""""""""""""""""""""

The software library used to implement the Catalogue Service API is based on the `PyCSW <https://pycsw.org/>`__  python
library.  PyCSW enables users to publish a catalogue of dataset descriptions (metadata) to the web,
using standard based interfaces and formats, such that it can be queried and updated by catalogue
clients. PyCSW is simple to install within an Apache web server (or any WSGI server) and can access
metadata records stored as XML files within a database.

Metadata is 'data about data', storing such things as creation-date, author, title,
area-of-interest, etc., and is usually encoded as XML files, following international standards such
as ISO 19115, ISO 19139 and Federal Geographic Data Committee (FGDC) Content Standard for Digital Geospatial Metadata (CSDGM).  PyCSW is the software library used to provide a catalogue
service. PyCSW implements the  `Open Geospatial Consortium (OGC) Catalogue Services for the Web (CSW) standard
<https://www.opengeospatial.org/standards/cat>`_. The project is certified `OGC Compliant`_, and is
an OGC Reference Implementation. The CSW standard defines common interfaces to discover, browse and
query metadata about spatial data, web services and related resources.

Core Features
===============

* Certified OGC Compliant and OGC Reference Implementation for OGC CSW 2.0.2 and CSW 3.0.0
* Harvesting support for the following standards:

   * `Web Mapping Service <https://www.opengeospatial.org/standards/wms>`__ (WMS)
   * `Web Feature service <https://www.opengeospatial.org/standards/wfs>`__ (WFS)
   * `Web Coverage Service <https://www.opengeospatial.org/standards/wcs>`__ (WCS)
   * `Web Processing Service <https://www.opengeospatial.org/standards/wps>`__ (WPS)
   * `Web Accessible Folders <https://ioos.github.io/catalog/pages/registry/waf_creation/>`__ (WAF)
   * `Catalogue Services for the Web <https://www.opengeospatial.org/standards/cat>`__ (CSW)
   * `Sensor Observation Service <https://www.opengeospatial.org/standards/sos>`__ (SOS)

* Implements the `INSPIRE <https://inspire.ec.europa.eu/>`__ Discovery Services 3.0
* Implements the ISO Metadata Application Profile 1.0.0
* Implements the Federal Geographic Data Committee (FGDC) `Content Standard for Digital Geospatial Metadata <https://www.fgdc.gov/metadata/csdgm-standard>`__ (CSDGM) Application Profile for CSW 2.0
* Implements Search/Retrieval via URL (SRU) search protocol
* Implements Full Text Search capabilities
* Implements the OGC OpenSearch Geo/Time extensions
* Implements the Open Archives Initiative Protocol for Metadata Harvesting (OAI-PMH)
* Supports ISO, Dublin Core, Directory Interchange Format (DIF), FGDC, Atom and `GM03 <https://www.geocat.admin.ch/en/dokumentation/gm03.html>`__ metadata models
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

* `CSW 	2.0.2, 3.0.0 <https://www.opengeospatial.org/standards/cat>`__
* `Filter 	1.1.0, 2.0.0 <https://www.opengeospatial.org/standards/filter>`__
* `OWS Common 	1.0.0, 2.0.0 <https://www.opengeospatial.org/standards/common.>`__
* `GML 	3.1.1 <https://www.opengeospatial.org/standards/gml>`__
* `OGC SFSQL 	1.2.1 <https://www.opengeospatial.org/standards/sfs>`__
* `OGC OpenSearch  1.0 <https://www.opengeospatial.org/standards/opensearchgeo>`__

**Metadata Standards:**

* `Dublin Core 	1.1 <https://www.dublincore.org/specifications/dublin-core/dces/>`__
* `SOAP 	1.2 <https://www.w3.org/TR/soap/>`__
* `ISO 19115:2003 <https://www.iso.org/standard/26020.html>`__
* `ISO 19139:2007 <https://www.iso.org/standard/32557.html>`__
* `ISO 19119:2005 <https://www.iso.org/standard/39890.html>`__
* NASA DIF 9.7
* `FGDC CSDGM 1998 <https://www.fgdc.gov/standards/projects/metadata/base-metadata/index_html>`__
* `GM03  2.1 <https://www.geocat.admin.ch/en/dokumentation/gm03.html>`__
* `SRU 	1.1 <https://www.loc.gov/standards/sru/sru-1-1.html>`__
* `OAI-PMH   2.0 <http://www.openarchives.org/OAI/openarchivesprotocol.html>`__
* `A9 OpenSearch 	1.1 <https://github.com/dewitt/opensearch/blob/master/opensearch-1-1-draft-6.md>`__

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
