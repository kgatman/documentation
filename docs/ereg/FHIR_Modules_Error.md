### FHIR Modules Error on Loading

We have observed an issue where some health facilities have a challenge with loading the FHIR2 and LabOnFHIR modules. If you come across such an error, please follow the steps below:

Download the scripts in [here](../../scripts/fhir_module_scripts/)

- Log in MySQL, choose the OpenMRS db and run `SET foreign_key_checks=0`
- Drop table fhir_reference
- Drop table fhir_task_based_on_reference
- Run the following scripts: `create_fhir_reference.sql`,`alter_fhir_reference.sql`,`fhir_task_based_on_reference.sql`
- Now the run these ones: `add_disa_to_fhir_concept_source_v2.sql`,`create_trigger.sql`
- Restart OpenMRS: `systemctl restart openmrs`