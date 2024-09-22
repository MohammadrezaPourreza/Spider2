WITH PatientConditions AS (
  SELECT 
    P.id AS patientId,
    P.name[safe_offset(0)].family AS last_name,
    P.name[safe_offset(0)].given AS first_name,
    TIMESTAMP(P.deceased.dateTime) AS deceased_datetime,
    COUNT(DISTINCT MR.medication_code) AS med_count,
    STRING_AGG(DISTINCT C.condition_code, ", ") AS Codes,
    STRING_AGG(DISTINCT C.condition_desc, ", ") AS Conditions,
    COUNT(DISTINCT C.condition_code) AS condition_count -- Count of distinct conditions
  FROM `bigquery-public-data.fhir_synthea.patient` P
  JOIN (
    SELECT 
      subject.patientId AS patientId, 
      medication.codeableConcept.coding[safe_offset(0)].code AS medication_code
    FROM `bigquery-public-data.fhir_synthea.medication_request`
    WHERE status = 'active'
  ) MR ON P.id = MR.patientId
  JOIN (
    SELECT 
      subject.patientId AS patientId,
      code.coding[safe_offset(0)].code AS condition_code,
      code.coding[safe_offset(0)].display AS condition_desc
    FROM `bigquery-public-data.fhir_synthea.condition`
  ) C ON P.id = C.patientId
  WHERE P.deceased.dateTime IS NULL -- only alive patients
  AND P.name[safe_offset(0)].family LIKE 'A%' -- last names starting with 'A'
  GROUP BY P.id, P.name[safe_offset(0)].family, P.name[safe_offset(0)].given, P.deceased.dateTime
)
SELECT
  Conditions,
  Codes
FROM 
  PatientConditions
WHERE condition_count = 1 -- Only include patients with exactly one condition
GROUP BY 
  Conditions, 
  Codes
ORDER BY MAX(med_count) DESC
LIMIT 1;