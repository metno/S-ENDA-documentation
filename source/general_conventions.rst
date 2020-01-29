General conventions
"""""""""""""""""""

All repositories should establish some general guidelines/conventions, e.g.,

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
