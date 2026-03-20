insert into fhir_concept_source (name, concept_source_id, url, creator, date_created, uuid)
            select name, concept_source_id, 'http://health.gov.ls/laboratory-services/', 1, now(), '7cfc3369-4ec4-4376-b65e-5ac41d527b74'
            from concept_reference_source
            where name = 'LSMOH DISA' and retired = false;
