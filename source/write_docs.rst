Writing documentation
"""""""""""""""""""""

All code should be documented. Integration with readthedocs is an easy an effective way
of publishing the documentation. This can be integrated with GitHub in order to stay up-to-date.

In the following, we summarise the requirements for both software and service documentation.

Software documentation
======================

Software should contain both user documentation and developer documentation.

User documentation
^^^^^^^^^^^^^^^^^^^^^^^

User documentation refers to the documentation provided to the end users. The user documentation is
designed to assist end users to use the software.

User documentation is important because it provides an avenue for users to learn:

* how to use your software
* features of your software
* tips and tricks of your software
* how to resolve common problems with your software

Without user documentation, a user may not know how to do the above things. See, e.g.,
https://computersciencewiki.org/index.php/User_documentation for more information.

Developer documentation
^^^^^^^^^^^^^^^^^^^^^^^

Developer documentation refers to the documentation provided to developers. The developer
documentation is designed to assist developers to contribute to the software development.

Developer documentation is important because it provides an avenue for developers to adhere to the
basic principles and guidelines used in collaborative software development:

* coding language and style
* version control
* testing
* how to handle issues and bugs

Developer documentation may help other developers to contribute more efficiently to your code.

Service documentation
=====================

Placeholder for possible service documentation...

Compiling the documentation locally
===================================

We use sphinx to build the S-ENDA documentation. To build the S-ENDA documentation locally, the best is to create
a virtual environment with sphinx and plantuml installed. With 
`conda <https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html>`_, this can be done as follows:

.. code-block:: bash

   sudo apt-get install graphviz
   sudo apt-get install plantuml
   conda env create -f source/env.yml   
   conda activate docs
   make clean
   make html

Then, open `build/html/index.html` in a web browser.
