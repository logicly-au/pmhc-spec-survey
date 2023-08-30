.. _identifier_management:

Identifier management
=====================

.. include:: shared/key.rst

.. _PO_key:

Managing Provider Organisation Keys
-----------------------------------

Provider Organisations will be created and managed by Primary Health
Networks (PHNs) via upload or data entry. Each PHN must either create their own
Provider Organisations before any data can be uploaded, or if the PHN is
uploading the data, the Provider Organisation must be included in the upload.

Each Provider Organisation will need to be assigned a unique key. It is the
responsibility of the PHN to assign and manage these keys.

.. _unique_keys:

Managing all other entity keys
------------------------------

The following entity keys will be created and managed by Provider Organisations:

* :ref:`Survey Key <survey-data-elements>`,
* :ref:`YES PHN Instrument Key <yes-phn-instrument-data-elements>`,

The PMHC MDS specification requires each of these keys to be unique and
stable at the Provider Organisation level.

Each record needs to be assigned a unique key in order to facilitate
adding/updating/deleting each item when uploading/entering data. These keys will
be created and managed by the Provider Organisation.

*If you still have questions after reading this information, please visit
the Department's responses
to* `Questions about Unique Identifiers and ‘Keys’ <http://docs.pmhc-mds.com/en/v1/faqs/concepts-processes/identifiers.html#identifier-and-key-faqs>`_
