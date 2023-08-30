.. _validation-rules:

Validation Rules
================

This document defines validation rules between items and record types.
The domain of individual items is defined in :ref:`record-formats`.

.. _current-validations:

Current Validations
-------------------

.. _key-current-validations:

Keys
~~~~

The following rules apply to the key fields in all records:

  1. All key fields are case sensitive
  2. All key fields must be valid unicode characters

.. _organisation-current-validations:

Organisation
~~~~~~~~~~~~

  1. Refer to :ref:`key-current-validations` for Provider Organisation Key validations
  2. The :ref:`dfn-organisation_start_date`

     * must not be before 1 January 2014
       or before a commissioning organisation's start date
     * and must not be after the earliest :ref:`dfn-collection_date`
     * and must not be in the future

  3. The :ref:`dfn-organisation_end_date`

     * must not be before 1 January 2014
       or after a commissioning organisation's end date
     * and must not be before the latest :ref:`dfn-collection_date`
     * can be in the future

   4. The :ref:`dfn-organisation_abn` must adhere to the format defined by the Australian Business 
      Register at https://abr.business.gov.au/Help/AbnFormat
