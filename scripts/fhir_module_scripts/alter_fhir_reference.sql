-- Add Column
ALTER TABLE fhir_reference
ADD COLUMN target_uuid CHAR(38) UNIQUE;
