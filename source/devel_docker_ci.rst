=============================
Docker CI with GitHub Actions
=============================

.. _Docker Hub: https://hub.docker.com/
.. _Docker: https://www.docker.com/
.. _GitHub: https://github.com/
.. _Continuous integration: https://en.wikipedia.org/wiki/Continuous_integration
.. _GitHub Actions Documentation: https://help.github.com/en/actions
.. _GitHub Actions: https://github.com/features/actions
.. _Overview of Docker Compose: https://docs.docker.com/compose/
.. _Automated repository tests: https://docs.docker.com/docker-hub/builds/automated-testing/
.. _Semantic Versioning 2.0.0: https://semver.org/
.. _Travis CI: https://travis-ci.org/
.. _Coveralls: https://coveralls.io/

All docker containers, and all code should be tested. `Continuous integration`_, CI, with `GitHub Actions`_ takes care of this for repositories that has a Docker_ container. Repositories that comes without a Docker container can be tested with, e.g., `Travis CI`_ and Coveralls_ for monitoring test coverage.

------------------------------------
Set up automatic Build of Containers
------------------------------------

Linking repositories to `Docker Hub`_ and let the Docker site build containers is excruciating slow. Lately GitHub_ has started to provide a CI system called GitHub Actions which integrate CI into the repository. GitHubs' integrated CI is up to 10 times faster than Dockers' system with free accounts. Read more about GitHub Actions at `GitHub Actions Documentation`_.

Docker Hub has already a recommended way of running test suites on a container. We reuse this with GitHub actions. We also reuse Dockers' way of building and setting up services with ``docker-compose``. Two files will be needed in our repositories containing containers.

* ``docker-compose.yml``, see `Overview of Docker Compose`_.

    Containing definitions for building and running one or more containers.

* ``docker-compose.test.yml``, see `Automated repository tests`_.

    Containing definitions for building and testing one or more containers.


Day to day usage
================

This will produce containers on Docker Hub where GitHub master branch is marked with tag ``dev``. A release tag in GitHub, example ``1.0.0``, will be marked with the tags ``1.0.0`` and ``1.0``, ``1`` and ``latest`` if it is the latest release.

Release tag is on the semantic versioning format without prefixed *v*, see `Semantic Versioning 2.0.0`_.

1. Set environment variable ``LATEST_TAG`` in ``.github/workflows/docker.yml`` with repository release tag.

2. Add new release tag under ``jobs.schedule-push.strategy.matrix.ref`` in ``.github/workflows/docker.yml``.

3. Commit changes to repository and merge.

  * Commit changes and push to branch.

    .. code-block:: bash

       git commit -m "new release" .github/workflows/docker.yml
       git push

  * Merge changes to master repository.

4. Add release tag to repository after merge.

  .. code-block:: bash

     git checkout master
     git pull
     git tag 1.0.0
     git push --tags

Configure GitHub Actions
========================

Our goals.

1. Reuse existing workflow with ``docker-compose``.
2. Run test suite on every pull request.
3. Automatic publish latest container as ``name:dev`` to Docker Hub registry. ``name`` is replaced with your container name.
4. Automatic publish releases as ``name:1.0.0``, ``name:1.0``, ``name:1`` and ``name:latest``. ``name`` is replaced with your container name, and tag version is replaced with your version.
5. Automatic rebuild all container every night to ensure security patches are added for all tagged versions and master branch.

Live example at GitHub `metno/pycsw-container <https://github.com/metno/pycsw-container>`_ and result at Docker Hub `metno/pycsw <https://hub.docker.com/repository/docker/metno/pycsw>`_.

Authentication to Docker Hub
----------------------------

Before we start we need link a Docker Hub repository with the GitHub repository. We're using a loose coupling, meaning we don't actually link it. We only provide the GitHub with our Docker Hub credentials.

1. Create a Docker Hub application credential for this GitHub repository.

  * Go to Docker Hubs' `Account Settings / Security <https://hub.docker.com/settings/security>`_ page.

  * Click **New Access Token**.

    * As **Access Token Description** write the name of your repository, e.g. ``username/reponame``, press **Create**.

    * Copy your Access Token to a safe place. Keep it ready for the next step.

2. Adding Docker Hub credentials to GitHub repository. This will be used in the CI file.

  * Go to the **Settings** page for the repository, cogwheel icon.

  * Left menu, under **Options**, click on **Secrets**.

  * Add two new secrets.

    * ``DOCKER_HUB_USER``

        Add login name for Docker Hub here.

    * ``DOCKER_HUB_PASS``

        Add the application credential you created in step one here.

Minimum repository content
--------------------------

This is an example. Replace repository content with your content.

* ``Dockerfile``, we use a minimal file for example.

  .. code-block:: Dockerfile

     FROM alpine:latest

* ``docker-compose.yml``

  .. code-block:: yaml

     ---
     version: '3.4'
     services:
       image:
         image: docker.io/username/image:${VERSION:-dev}
         build:
           context: .

* ``docker-compose.test.yml``

  .. code-block:: yaml

     ---
     version: '3.4'
     services:
       sut:
         build:
           context: .
         command: echo Start test script here e.g. ./run_tests.sh

Add CI definition file
----------------------

Add the following file in the repository as ``.github/workflows/docker.yml``.

Make a note of ``FIXME`` and ``TODO``. ``TODO`` marks where you need to update with every release. ``FIXME`` is what could be improved at a later point.

.. code-block:: yaml

    name: docker

    # FIXME: add yaml anchors when GitHub supports it, strange that they don't

    on:
      push:
        # publish image as master=dev or on new tag
        # except on document and ci changes
        branches:
          - master
        tags:
          - '*'
        paths-ignore:
          - '**.md'
          - '.github/workflows/*yml'

      # always run tests on merge
      # except on document and ci changes
      pull_request:
        paths-ignore:
          - '**.md'
          - '.github/workflows/*yml'

      # schedule full rebuild and push on schedule, see todos
      schedule:
        - cron:  '13 3 * * *'

    env:
      # TODO: remember to update version on new tag
      LATEST_TAG: 1.0.0
      DOCKER_HUB_USER: ${{ secrets.DOCKER_HUB_USER }}
      DOCKER_HUB_PASS: ${{ secrets.DOCKER_HUB_PASS }}

    jobs:
      shcedule-push:
        runs-on: ubuntu-latest
        if: github.event_name == 'schedule'
        strategy:
          matrix:
            # FIXME: is it possible to automatic parse refs?
            # TODO: remember to add new tags to schedule
            ref:
              - master
              - 1.0.0
        steps:
          - uses: actions/checkout@v2
            with:
              ref: ${{ matrix.ref }}
          - run: echo $DOCKER_HUB_PASS | docker login docker.io -u $DOCKER_HUB_USER --password-stdin
          - run: |
              export VERSION=${{ matrix.ref }}
              [ "$VERSION" == "master" ] && export VERSION=dev

              echo VERSION=$VERSION
              docker-compose build
              docker-compose push

              # tag and push versions X.X and X and latest
              if echo "$VERSION" | grep -qE '^\w+\.\w+\.\w+$' && [ "$LATEST_TAG" == "$VERSION" ]; then
                for VERSION in $(echo $VERSION | cut -d. -f1,2) $(echo $VERSION | cut -d. -f1) latest; do
                  export VERSION
                  echo VERSION=$VERSION
                  docker-compose build
                  docker-compose push
                done
              fi

      test:
        runs-on: ubuntu-latest
        if: github.event_name != 'schedule'
        steps:
          - uses: actions/checkout@v2
          - run: |
              docker-compose --file docker-compose.test.yml build
              #docker-compose --file docker-compose.test.yml run sut

      push:
        needs: test
        runs-on: ubuntu-latest
        if: github.event_name == 'push'
        steps:
          - uses: actions/checkout@v2
          - run: echo $DOCKER_HUB_PASS | docker login docker.io -u $DOCKER_HUB_USER --password-stdin
          - run: |
              export VERSION=$(echo "${{ github.ref }}" | sed -e 's,.*/\(.*\),\1,')
              [[ "${{ github.ref }}" == "refs/tags/"* ]] && export VERSION=$VERSION
              [ "$VERSION" == "master" ] && export VERSION=dev

              echo VERSION=$VERSION
              docker-compose build
              docker-compose push

              # tag and push versions X.X and X and latest
              if echo "$VERSION" | grep -qE '^\w+\.\w+\.\w+$' && [ "$LATEST_TAG" == "$VERSION" ]; then
                for VERSION in $(echo $VERSION | cut -d. -f1,2) $(echo $VERSION | cut -d. -f1) latest; do
                  export VERSION
                  echo VERSION=$VERSION
                  docker-compose build
                  docker-compose push
                done
              fi


-------------------
Set Up Unit Testing
-------------------

Unit testing can be done in the same way as building containers. Please see a working example in the repository `steingod / mmd <https://github.com/steingod/mmd>`_.

Take note of the following files in the repository:

* ``Dockerfile.unittests``
* ``.github/workflows/unittests.yml``
* ``docker-compose.unittests.yml``
* ``run_unittests.sh``

The setup can also be tested locally by running ``vagrant up``.

.. Note::

   To work locally, the ``Vagrantfile`` should contain the following:

   .. code-block:: ruby

      config.vm.provision "shell", "run": "always", inline: <<-SHELL
         docker-compose -f docker-compose.unittests.yml up --build --exit-code-from unittests
      SHELL

------------------------
Set Up Coverage Testing
------------------------

Coverage testing can be done in the same way as building containers and unit testing. Please see the same working example in the repository `steingod / mmd <https://github.com/steingod/mmd>`_.

Take note of the following files in the repository:

* ``Dockerfile.coverage``
* ``.github/workflows/coverage.yml``
* ``docker-compose.coverage.yml``
* ``tests-coverage.sh``

The setup can also be tested locally by running ``vagrant up`` .

.. Note::

   To work locally, the ``Vagrantfile`` should contain the following:

   .. code-block:: ruby

      config.vm.provision "shell", "run": "always", inline: <<-SHELL
         docker-compose -f docker-compose.coverage.yml up --build --exit-code-from coverage
      SHELL


..
  # vim: set spell spelllang=en:
