.. _general-conventions:

*******************
General conventions
*******************

S-ENDA concerns both software development and generation of dynamic geodata. In line with the
recommendations from MET Norway and the FAIR principles, all S-ENDA relevant data and code shall
use the following licenses to foster reusability:

* Double licensing for data:
  
  * CC-BY 4.0 International (`<https://creativecommons.org/licenses/by/4.0/>`_), and 
  * The Norwegian Licence for Open Government Data (NLOD) (`<https://data.norge.no/nlod/en/2.0>`_)

* One of the following licenses for software:

  * `Apache License, Version 2.0 <https://www.apache.org/licenses/LICENSE-2.0>`_
  * `The MIT license <https://opensource.org/licenses/MIT>`_
  * `The GNU General Public License (GPL) version 2 
    <https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html>`_
    (all derivative work must be licensed with GPLv2)

All software repositories should also establish general guidelines/conventions, such as:

* Use version control, preferably git.
* Open-source code should be openly available, e.g., at GitHub or a similar open service.
* The coding style should be specified in a conventions section of the documentation of open-source
  software, e.g., specifying which standard is followed (e.g., PEP-8_ for Python), maximum line
  length, etc.
* All code should be tested (100% test coverage), i.e.,

  * Every function must be accompanied with a test suite
  * Tests should be both positive (testing that the function work as intended with valid data) and 
    negative (testing that the function behaves as expected with invalid data, e.g., that correct
    exceptions are thrown)
  * If a function has optional arguments, separate tests for all options should be created
  * Examples should be supported by doctests

* Discussions regarding the S-ENDA framework are kept in the issue-trackers of relevant git
  repositories at github or in public gitter chats linked from the respective README files

There is plenty of more online guides - see, e.g., `<https://opensource.guide/>`_.

.. _PEP-8: https://www.python.org/dev/peps/pep-0008/


Versioning
==========

Software tools should be properly versioned, following the `Semantic Versioning`_ principles.

The general principles of version increments, given a version number MAJOR.MINOR.PATCH, are:

1. MAJOR version when you make incompatible API changes,
2. MINOR version when you add functionality in a backwards compatible manner, and
3. PATCH version when you make backwards compatible bug fixes.

Additional labels for pre-release and build metadata are available as extensions to the
MAJOR.MINOR.PATCH format. (Reference: `<https://semver.org/>`_)

It is good practice to use ``0`` as the MAJOR version during the initial development stage, and
increment the MINOR number for each release up until it is ready for production use and a 1.0
release.

The main benefit of semantic versioning, when followed properly, is that other software that
depends on these software packages have some idea what to expect from the version numbers. It is
then possible for the developer to configure their own dependency requirements accordingly, using
version ranges and filters rather than version pinning or pinning to specific commits.

.. _Semantic Versioning: https://semver.org/


Python Packages
---------------

For Python projects, the version number should be available from a ``setup.py`` or ``setup.cfg``
file. The package's main ``__init__.py`` file should also define the ``__version__`` variable.

The setup files can generally extract the version number from the main ``__init__.py`` file.
See the `setuptools documentation`_.

This approach makes it significantly easier to use package tools like ``pip`` to deploy packages,
and to include them as dependencies in other packages.

When making a release of a Python project, increase the version number first, and then tag the
release with a tag matching that version number string. This makes it significantly easier to
handle automatic upgrades and installations of pacages both from the `Python Packaging Index`_ and
directly from the project's main repository.

.. _setuptools documentation: https://setuptools.readthedocs.io/en/latest/userguide/declarative_config.html
.. _Python Packaging Index: https://pypi.org/
