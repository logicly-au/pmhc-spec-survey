.. _specifications:

Specifications
==============

.. _record-formats:

Record formats
--------------

.. _metadata-data-elements:

Metadata
^^^^^^^^

The Metadata table must be included in file uploads in order to identify
the type and version of the uploaded data.

.. csv-table:: Metadata record layout
   :file: record/metadata.csv
   :header-rows: 1

For this version of the specification the required content is shown in the
following table:

.. csv-table:: Metadata file
  :file: metadata-file.csv

----------

.. _provider-organisation-data-elements:

Provider Organisation
^^^^^^^^^^^^^^^^^^^^^

See :ref:`key-concepts-provider-organisation` for the definition of a provider
organisation.

Provider Organisation data is for administrative use within the PMHC MDS
system. It is managed by the PHN's via the PMHC MDS administrative interface,
it cannot be uploaded.

.. csv-table:: Provider Organisation record layout
  :file: record/organisation.csv
  :header-rows: 1

----------

.. _survey-data-elements:

Survey
^^^^^^

Survey data is managed by the PHN's or Provider Organisations via upload.

.. csv-table:: Survey record layout
  :file: record/survey.csv
  :header-rows: 1

---------

.. _instument-data-elements:

Instruments
^^^^^^^^^^^

.. _yes-phn-instrument-data-elements:

YES PHN
"""""""

YES PHN data is managed by the PHN's or Provider Organisations via upload.

.. csv-table:: YES PHN record layout
  :file: record/yes-phn-instrument.csv
  :header-rows: 1


-----

.. include:: include/definitions.rst


.. _data-specifications-download:

Download Specification Files
----------------------------

Available for software developers designing extracts for the PMHC MDS, please
click the link below to download the PMHC MDS YES PHN Specification files:

* `Specification zip <_static/pmhcmds-yes-phn-spec-meta.zip>`_
