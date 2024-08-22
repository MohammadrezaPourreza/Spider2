# `isb-cgc.TCGA_bioclin_v0.Annotations.md`

## Column details

* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; e.g. TCGA-OV, etc.
* [STRING]    `entity_barcode`
  - Barcode of the entity that this annotation applies to; often the same as the case barcode
* [STRING]    `entity_type`
  - Type of the entity that this annotation applies to; e.g. Shipped Portion, Aliquot, Patient (which has the same meaning as Case), Analyte, etc.
* [STRING]    `category`
  - Annotation category; one of a relatively short list of phrases from a controlled-vocabulary; e.g. Item is noncanonical, Item flagged DNU, Prior malignancy, etc.
* [STRING]    `classification`
  - Annotation classification; e.g. Notification, CenterNotification, Observation, or Redaction
* [STRING]    `notes`
  - Longer descriptive text about this annotation
* [STRING]    `date_created`
  - Date on which this annotation was originally created; includes time-stamp and time-zone, eg 2011-03-14T18:00:42-04:00  --  dates range between March 2009 and June 2016
* [STRING]    `date_edited`
  - Annotations were rarely edited, but if thery were (fewer than 10 out of over 6000 total annotations), this field indicates the date on which it was edited
* [STRING]    `case_gdc_id`
  - GDC case identifier for the patient/case associated with this specific annotation
* [STRING]    `case_barcode`
  - TCGA patient/case barcode; e.g. TCGA-06-0119
* [STRING]    `sample_barcode`
  - TCGA sample barcode; e.g. TCGA-06-0119-01A (note that this field will be null if the annotation applies at a higher level than sample)
* [STRING]    `aliquot_barcode`
  - TCGA aliquot barcode; e.g. TCGA-06-0119-01A-08D-0216-06 (note that this field will be null if the annotation applies at a higher level than aliquot)

