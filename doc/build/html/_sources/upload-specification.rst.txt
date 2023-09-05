.. _upload_specification:

Upload specification
====================

Files can be uploaded to the PMHC MDS manually via the web interface at https://pmhc-mds.net/ or
by using the API which is available at https://api.pmhc-mds.net/.

.. _file-requirements:

File requirements
-----------------
Uploads will be rejected by our incoming data scanning system if they do not
meet the following requirements:

* Must be either an :ref:`Excel Workbook (.xlsx) <excel-workbook>`,
* OR a :ref:`zip (.zip) file containing CSV files <csv-zip>`,
* AND must be :ref:`less than 512MB <file-size>`

.. _excel-workbook:

Excel Workbook (XLSX)
^^^^^^^^^^^^^^^^^^^^^
Excel files must be in XLSX format. Excel 2007 (v12.0) and above support this
file format.

One XLSX file must be uploaded containing multiple worksheets - one worksheet
for each format described :ref:`below <files-to-upload>`.

When saving your file, please choose the filetype 'Excel Workbook (.xlsx)'.

The filename of the Excel file doesn't matter as long as it has the file
extension .xlsx

.. _csv-zip:

Zip file containing Comma Separated Values (CSV)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The CSV files must conform to `RFC 4180 <https://www.ietf.org/rfc/rfc4180.txt>`__.

In addition, CSV files must be created using UTF-8 character encoding.

CSV files must have the file extension .csv

Multiple CSV files must be uploaded - one CSV file for each format described
:ref:`below <files-to-upload>`.

The CSV files must be compressed into a single file by zipping before upload. The
filename of the zip file doesn't matter as long as it has the file
extension .zip

.. _file-size:

File size
^^^^^^^^^
Files must be less than 512MB. The file size restriction prevents our systems
from becoming unstable if extremely large files are uploaded. We will monitor
if this limit causes issues for anyone and adjust it if necessary.

.. _files-to-upload:

Files or worksheets to upload
-----------------------------

All files must be internally consistent. An example of what this means
is that for every YES PHN Instrument in an upload file,
there must be a corresponding Survey in the Survey file/worksheet.
It also means that for every row in the Survey file/worksheet, there must be a
corresponding Organisation in the Organisations file/worksheet.

The following files/worksheets can be uploaded to the PMHC MDS:

.. csv-table:: Summary of files to upload
  :file: upload-file-types.csv
  :header-rows: 1

.. _file-format:

File format
-----------

Requirements for file formats:

- The first row must contain the column headings as defined for each file type.
- Data elements for each file/worksheet are defined at :ref:`record-formats`.
- Each item is a column in the file/worksheet. The 'Field Name' as defined in
  :ref:`record-formats` must be used for
  the column headings. The columns must be kept in the same order.
- The second and subsequent rows must contain the data.
- All files must be internally consistent. An example of what this means is
  that for every row in the episode file/worksheet, there must be a
  corresponding client in the client file/worksheet.
- For data elements that allow multiple values, each value should be separated
  by a space; for example: `1 3 6`.
- All  data uploads must include a Metadata file/worksheet.
  See :ref:`metadata-format`.

.. _metadata-format:

Metadata file
^^^^^^^^^^^^^

All uploads must include a Metadata file/worksheet.

- In the first row, the first cell must contain 'key' and the second cell
  must contain 'value'
- In the second row, the first cell must contain 'type' and the second
  cell must contain 'YES-PHN'
- In the third row, the first cell must contain 'version' and the second
  cell must contain '1.0'

i.e.:

.. csv-table:: Metadata file
  :file: metadata-file.csv

Data elements for the metadata upload file/worksheet are defined at
:ref:`metadata-data-elements`.

Example Metadata files can be found at :ref:`example-upload-files`.

.. _organisation-format:

Organisation file format
^^^^^^^^^^^^^^^^^^^^^^^^
This file is for PHN use only. The organisation file/worksheet is optional. It can
be included to upload Provider Organisations in bulk or if there is a change in
Provider Organisation details. There is no harm in including it in every upload.

Data elements for the Provider Organisation upload file/worksheet are defined at
:ref:`provider-organisation-data-elements`.

Example Organisation files can be found in any of the example files at :ref:`example-upload-files`.

.. _survey-format:

Survey file format
^^^^^^^^^^^^^^^^^^
The survey file/worksheet is required to be uploaded each time. 

Data elements for the survey upload file/worksheet are defined at
:ref:`survey-data-elements`.

Example Survey files can be found in any of the example files at :ref:`example-upload-files`.

.. _yes-phn-instrument-format:

YES PHN Instrument file format
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The YES PHN instrument file/worksheet is required to be uploaded each time. 

Data elements for the YES PHN instrument upload file/worksheet are defined at
:ref:`yes-phn-instrument-data-elements`.

Example YES PHN Instrument files can be found in any of the example files at :ref:`example-upload-files`.

.. _deleting-records:

Deleting records
----------------

All records except for Organisation records can be deleted via upload.
Please email support@pmhc-mds.com if you need to delete an organisation.

* An extra optional "delete" column can be added to each of the supported
  upload files/worksheets.

* If included, this column must be the third column in each file, after the organisation
  path and the record's entity key.

* To delete a record, include its organisation path and its entity key, leave
  all other fields blank and put "delete" in the "delete" column. Please note
  that case is important. "DELETE" will not be accepted.

* Marking a record as deleted will require all child records of that record also
  to be marked for deletion. For example, marking a survey as deleted will
  require all YES PHN records associated with that survey to be marked for deletion.

* While deletions can be included in the same upload as insertions/updates,
  we recommend that you include all deletions in a separate upload that is
  uploaded before the insertions/updates.

Example files showing how to delete records can be found the example files at :ref:`example-upload-files`.

.. _example-upload-files:

Example Upload files
--------------------

Each of the example files assumes the following organisation structure:

+--------------------------+------------------------------------------------+---------------------------------------------+---------------------+
| Organisation Key         | Organisation Name                              | Organisation Type                           | Parent Organisation |
+==========================+================================================+=============================================+=====================+
| PHN999                   | Test PHN                                       | Primary Health Network                      | None                |
+--------------------------+------------------------------------------------+---------------------------------------------+---------------------+
| PHN999:NFP01             | Example Treatment Organisation                 | Private Allied Health Professional Practice | PHN999              |
+--------------------------+------------------------------------------------+---------------------------------------------+---------------------+
| PHN999:NFP02             | Example Treatment Organisation                 | Private Allied Health Professional Practice | PHN999              |
+--------------------------+------------------------------------------------+---------------------------------------------+---------------------+

.. csv-table:: Summary of example upload files
  :file: example-files.csv
  :header-rows: 1

Frequently Asked Questions
--------------------------

Please also refer to `Uploading data <http://docs.pmhc-mds.com/en/v1/faqs/system/uploading.html#uploading-data-faqs>`_ for answers to frequently
asked questions about uploading data.
