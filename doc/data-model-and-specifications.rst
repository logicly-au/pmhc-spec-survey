.. _data-model-and-specifications:

Data model and specifications
=============================

.. _data-model:

Data model
----------

The introductory wording on the YES PHN states "All information collected in 
this survey is anonymous. None of the information collected will be used to identify you."
In order to preserve this client anonymity, this specification uses a data model 
that stores the survey against a Provider Organisation, not a client.

.. _data-model-diagram:

.. figure:: figures/pmhc-mds-survey-data-model-v1.0.svg
   :alt: PMHC MDS Survey Specification Version 1.0 data model

   PMHC MDS Survey Specification Version 1.0 data model

.. note::
  * The above data model diagram is in the SVG format and can be enlarged 
    or zoomed by opening in a new tab or window or by downloading it.


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

See `Provider Organisation Key Concepts <https://docs.pmhc-mds.com/projects/data-specification/en/v4/data-model-and-specifications.html#provider-organisation>`_ 
for the definition of a provider organisation.

Provider Organisation data is for administrative use within the PMHC MDS
system. It is managed by the PHNs via the PMHC MDS administrative interface,
or upload.

.. csv-table:: Provider Organisation record layout
  :file: record/organisation.csv
  :header-rows: 1

----------

.. _survey-data-elements:

Survey
^^^^^^

Survey data is managed by the PHNs or Provider Organisations via upload.

.. csv-table:: Survey record layout
  :file: record/survey.csv
  :header-rows: 1

---------

.. _instument-data-elements:

Instruments
^^^^^^^^^^^

.. _yes-phn-data-elements:

YES PHN
"""""""

Further information about the YES PHN Survey is available from :ref:`introduction` and :ref:`resources`.

YES PHN data is managed by the PHNs or Provider Organisations via upload.

.. csv-table:: YES PHN record layout
  :file: record/yes-phn-instrument.csv
  :header-rows: 1


-----

.. _definitions:

.. include:: include/definitions.rst


.. _data-specifications-download:

Download Specification Files
----------------------------

Available for software developers designing extracts for the PMHC MDS, please
click the link below to download the PMHC MDS Specification files:

* `Specification zip <_static/pmhcmds-survey-spec-meta.zip>`_

These files conform to the CSV on the Web (CSVW) standard that is defined at https://csvw.org/.

They are used:

* to generate the :ref:`record-formats` and :ref:`definitions` sections of the data specification documentation
* in the first pass of upload validations
