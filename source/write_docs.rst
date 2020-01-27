Writing and compiling the docs
""""""""""""""""""""""""""""""

We use sphinx to build the documentation. To build the documentation locally, the best is to create
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
