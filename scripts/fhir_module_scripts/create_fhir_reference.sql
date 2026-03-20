-- Create Table
CREATE TABLE fhir_reference (
    reference_id INT AUTO_INCREMENT,
    target_type VARCHAR(255) NOT NULL,
    reference VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    creator INT NOT NULL,
    date_created DATETIME NOT NULL,
    changed_by INT,
    date_changed DATETIME,
    name VARCHAR(255) NOT NULL,
    retired BOOLEAN DEFAULT false NOT NULL,
    retired_by INT,
    date_retired DATETIME,
    retire_reason VARCHAR(255) DEFAULT NULL,
    uuid VARCHAR(38) NOT NULL,
    PRIMARY KEY (reference_id),
    CONSTRAINT fhir_reference_creator_fk FOREIGN KEY (creator) REFERENCES users(user_id),
    CONSTRAINT fhir_reference_changed_by_fk FOREIGN KEY (changed_by) REFERENCES users(user_id),
    CONSTRAINT fhir_reference_retired_by_fk FOREIGN KEY (retired_by) REFERENCES users(user_id)
);


