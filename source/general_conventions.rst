.. _general-conventions:

General conventions
"""""""""""""""""""

S-ENDA concerns both software development and generation of dynamic geodata. In line with the recommendations from MET Norway and the FAIR principles, all S-ENDA relevant data and code shall use the following licenses to foster reusability:

* Double licensing for data:
  
  * CC-BY 4.0 International (`<https://creativecommons.org/licenses/by/4.0/>`_), and 
  * The Norwegian Licence for Open Government Data (NLOD) (`<https://data.norge.no/nlod/en/2.0>`_)

* One of the following licenses for software:

  * `Apache License, Version 2.0 <https://www.apache.org/licenses/LICENSE-2.0>`_
  * `The MIT license <https://opensource.org/licenses/MIT>`_
  * `The GNU General Public License (GPL) version 2 <https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html>`_ (all derivative work must be licensed with GPLv2)

All software repositories should also establish general guidelines/conventions, such as:

* Use version control, preferably GIT
* Open-source code should be openly available, e.g., at GitHub or a similar open service
* The coding style should be specified in a conventions section of the documentation of open-source
  software, e.g., specifying which standard is followed (e.g., PEP-8 for Python), maximum line length, etc.
* All code should be tested (100% test coverage), i.e.,

  * Every function must be accompanied with a test suite
  * Tests should be both positive (testing that the function work as intended with valid data) and negative (testing that the function behaves as expected with invalid data, e.g., that correct exceptions are thrown)
  * If a function has optional arguments, separate tests for all options should be created
  * Examples should be supported by doctests

* Discussions regarding the S-ENDA framework are kept in the issue-trackers of relevant git
  repositories at github or in public gitter chats linked from the respective README files

There is plenty of more online guides - see, e.g., `<https://opensource.guide/>`_.
