-- Create Table fhir_task_based_on_reference
CREATE TABLE fhir_task_based_on_reference (
    task_id INT NOT NULL,
    reference_id INT NOT NULL UNIQUE,
    PRIMARY KEY (task_id),
    CONSTRAINT task_based_on_fk FOREIGN KEY (task_id) REFERENCES fhir_task(task_id),
    CONSTRAINT reference_based_on_fk FOREIGN KEY (reference_id) REFERENCES fhir_reference(reference_id)
);
