### eRegister Release Notes

!!! warning
    * this beta version is going to be deployed at selected pilot facilities. 
    * Please report issues here: [https://github.com/eRegister/bahmni_docker/issues](https://github.com/eRegister/bahmni_docker/issues)

## [0.92](https://bahmni.atlassian.net/wiki/spaces/BAH/pages/20185103/Release+Notes) 

## - *Release Notes December 2022*
* ##### Reports
    * ###### Bahmni 
          - *TB-025 | TB Data Quality Assessment Tool* - new report 
          - *PHARM-004 | Registered Clients Prescribed and Dispensed (List)* - New report
          - *PHARM-005 | Registered Clients Prescribed and Dispensed (Pivot)* - New report
          - *PHARM-001 | Pharmacy ARV Regimen* - Displays details and status of Regimens
    * ###### Openmrs
          - A new serialized object for the fix of pitc and citc reports in openmrs (They were not picking some clients and were duplicating others)






## - *Release Notes November 2022*
* ##### Reports
    * ###### Bahmni 
          - *ART-001 | Current on ART Detailed (List)* - Newly added ECID Identifier results in Zeros under MMD - Solved
          - *ART-001 | Current on ART Detailed (List)* - Clients who transferred out and came back under clients_missed_28days
          - *MCH-005 | Ante Natal Care (ANC) (List)* - Added Iron, Folate, Blood_Group
          - *TB-018 | TB Intakes (List)* - Corrected the report to pull patients correctly
          - *HTS-001 | HTS Final HIV Status (List)* - Eliminated some duplicates for clients who came more than twice a month
          - *HTS-002 | HTS Final HIV Status PITC (Pivot)* - Eliminated some duplicates for clients who came more than twice a month
          - *TB-007 | New and Relapse Enrolled on TB* - Exclude clients that are not new or relapse
          - *HTS-001 | HTS Final HIV Status (List)* - Added service points, and also considers start & endDates
          - *HTS-009 | HTS Data Quality Assessment Tool* - Considers start and end dates
          - *PHARM-003 | Dispensing Summary Report* -Provide labeling of medicines dispensed
          - *ART-036 | CXCA_SCRN (List)* - Added a New Report for Cervical Cancer Screening
          - *MCH-004 | Ante Natal Care (ANC) (Pivot)* - Added Muac and Suspected with TB Column
          - *PHARM-002 | Dispensing Orders report* - Clients dispensed, Age, Sex, Regimen, Quantity Dispensed, Batch
          - *PHARM-001 | Pharmacy ARV Regimen* - Displays details and status of Regimens
          - *PHARM-004 | Registered Clients Prescribed and Dispensed (List)* - New report
          - *PHARM-005 | Registered Clients Prescribed and Dispensed (Pivot)* - New report
## - *Release Notes October 2022*
* ##### Reports
    * ###### Bahmni 
          - *ART-026 | Ante Natal Care (ANC)* - The report now relies on the start and end dates picked by the user, instead it picked the month and year of the end Date
          - *ART-026 | Ante Natal Care (ANC)* - The gap between 2nd and 3rd trimester (25 weeks) is now included
          - *ART-026 | Ante Natal Care (ANC)* - Total ANC follow up visits 2nd, 3rd and 4th now picks subsequent visits
          - Added a category for MCH Reports
          - *TB-024 | TB Case Detection (list)* - Adjusted the report number from 23 to 24 because the report above is also 23
          - *MCH-005 | Ante Natal Care (ANC) (List)* - New Report
          - *TB-014 | TB Prevention Therapy (List)* - consider start and end dates not month(), year()
          - *TB-015 | TB Prevention Therapy (Pivot)* - consider start and end dates not month(), year()
          - *MCH-005 | Ante Natal Care (ANC) (List)* - Corrected the Syphilis_Screening_Results column to distinguish Reactive and Non Reactive results
          - *MCH-005 | Ante Natal Care (ANC) (List)* - Added Haemoglobin, HIV_Status_Known_Before_Visit, Final_HIV_Status, Subsequent_HIV_Test_Results, MUAC, Tuberculosis
          - *ART-087 | Weekly PPR (List)* - Shows missed clients,NLICs, defaulters and initiations within a specific week
          - *ART-088 | Weekly PPR (Pivot)* - Shows missed clients,NLICs, defaulters and initiations within a specific week
          - *ART-019 | Registered ART Clients with Intakes (List)* - picks ART clients, using either the follow-up form or the ART Number
          - *ART-020 | Registered ART Clients with Intakes (Pivot)* - picks ART clients, using either the follow-up form or the ART Number
          - *ART-021 | ART Client Without Intakes (List)* - Identifies all clients who have art follow up but no intakes, regardless of whether they have art number or not
          - *ART-021 | ART Client Without Intakes (List)* - Identifies all clients who have ART number but no intakes, regardless of whether they have ART follow-up form or not.
          - *ART-021 | ART Client Without Intakes (List)* - Addition of the column status; aimed at classifying as to whether the clients is 'active', 'missed', 'defaulted', 'LTFU' or does not have ART follow up form
          - *ART-021 | ART Client Without Intakes (List)* - Arranged the report in order of their status, starting with the active clients and ending with those without ART follow up form


## - *Release Notes September 2022*
* ##### Reports
    * ###### Bahmni 
          - *TB_Intake report(list)* - correction to pull correction patients
          - *ART-001 | Current on ART Detailed (List)* - the report to report clients seen and missed by the end of the reporting period as missed
          - *ART-002 | Current on ART Detailed (Pivot)* - the report to report clients seen and missed by the end of the reporting period as missed
          - *ART-053 | TX_CURR (Pivot)* - the report to report clients seen and missed by the end of the reporting period as missed
          - *ART-054 | TX_CURR (List)* - the report to report clients seen and missed by the end of the reporting period as missed
          - *ART-077 | PEADS Aging Out Analysis (Client Outcomes)* - changed to track the latest cohort which is Q2 2021
          - *ART-078 | PEADS Aging Out Analysis (Client Appointments)* - changed to track the latest cohort which is Q2 2021
          - *ART-059 | TX_RTT (List)* - Disaggregations changed from IIT> 3months to IIT3-5months and IIT6+months
          - *ART-060 | TX_RTT (Pivot)* - Disaggregations changed from IIT> 3months to IIT3-5months and IIT6+months
          - *ART-061 | TX_ML (List)* - Disaggregations changed from IIT> 3months to IIT3-5months and IIT6+months
          - *ART-062 | TX_ML (Pivot)* - Disaggregations changed from IIT> 3months to IIT3-5months and IIT6+months
          - *PIR-17 Tx_CURR TXML* - Modified to use new disaggregation IIT3-5months, IIT6+months instead of IIT>3months
          - *PIR-17 Tx_CURR Retention Report* - Modified to use new disaggregation IIT3-5months, IIT6+months instead of IIT>3months
          - *TB-010 | New and Relapse Enrolled on TB (List)* - Added TB history, Key populations, HIV Status, Active and Defaulted Clients
          - *TB-011 | DSD TB_ART* - Added TB history, Key populations, HIV Status, Active and Defaulted Clients
          - *ART-003 | Missed Appointments Status Report (List)* - Arranged clients with appointment missed
          - *TB-022 | TB Drug Resistant (list)* - New Report
          - *TB-003 | TB Notification (List)* - New Report 
    * ###### Openmrs
          - *PIR-17 Tx_CURR Retention Report Mapping 2022* - Maps part of PIR-17 Tx_CURR Retention Report to Txcurr Retention and Attrition Report in DHIS2(TxRTT Section)
          - *PIR-17 Tx_CURR TXML_2022* - Maps PIR-17 Tx_CURR TXML Report to Txcurr Retention and Attrition Report in DHIS2(TxML Section)
          - *2020_ADULT ARV REGIMEN Mapping* - now maps to Adult Regimen 1f (a)TDF 3TC /EFV (400mg) other months which was previously blank



* ##### Clinical Module
    * New Prep Follow-Up Form
    * New Prep Intake Form
    * Made Under 5 Base Doses Multi-select
    * Added a Reports name filter in Bahmni-Reports 
    * Added 'Weeks of current gestation by LMP method' to Obstetric History on ANC Program Form.
    * Auto Calculate Gestational Age from LNMP on The ANC Program Form
    * Visits for other services e.g., FP, Cervical Cancer Screening, Enhanced Adherence Counseling and Under5
___
**Note**

**Do the following to deploy the new visits on your server:**

- Pull or Clone the new bahmni_docker
- Restore the following files in to the database (emr):

       /bahmni_docker/misc/vist_types.sql

       /bahmni_docker/misc/new_vists_global_properties.sql

- Pull the new bahmni_configs
- Rebuild the search index
___  
## - *Release Notes August 2022*
* ##### Reports
    * ###### Bahmni 
          - *ART-022 | Data Quality Assessment tool* - was displaying a blank page
          - *ART-021 | ART Client Without Intakes (List)* - Added more columns(ArtNumber,age,gender,location)
          - *HTS-006 | Self Test Clients(List)* - Allow patient tested more than once in a month to appear more than once.
          - *TB-020  and  TB-021* - TB registration vs TB Consultation naming corrections
          - TxCurr report - include clients who do not have patient identifiers and use ECID identifiers in the report
          - Missed_defaulted_ltfu report - include service point in the report

* ##### Clinical Module
    * WHO staging made to disappear when T-staging is selected
    * Hid HIVST Results for primary when Secondary is Selected
    * SD Bioline is not available in most health centres at the moment so it should not be compulsory for indeterminate results

## - *Release Notes July 2022*

* ##### Reports
    * ###### Bahmni 
          - Reporting age groups have been modified to include the new age groups being 50-54, 55-59,60-64,65+.
          - *ART-022 | Data Quality Assessment tool* -  DQA Report had a bug after modification to include defaulted and lost to follow-up clients [Bug Fixed].
          - *ART-001 | Current on ART Detailed (List)* - Modified to include clients who do not have patient identifiers and use ECID identifiers in the report.
          - *ART-003 | Missed Appointments Status Report (List)* -  Added service point column in the report
    * ###### Openmrs 
          + *Created new children regimen reports that categorize children by weight:*
               - Children ARV Regimen_1stLine_2022
               - Children ARV Regimen_2ndLine_2022
               - Children ARV Regimen_3rdLine_2022
          + *2020_TB_Screening* - TB Screening previous report did not include all clients seen during period
          + *2020_TB_Screening* - Only clients that were seen physically at the facility. PreART clients. Clients that were physically seen and screened
* ##### Registration Module
    * Patient name now appears above maiden name in The Registration Module
* ##### Clinical Module
    * Fixed EDD Auto-Calculation
    * Hid PITC Results on CACX Form if The test has not been offered
    * The LPA susceptibility result is no longer compulsory because the result is not always available
    * Allow future Dates for Cervical Cancer Screening Follow up Date
    * Place of Delivery is Not Mandatory on ANC Form (While it remains Mandatory on the PNC Form)
* ##### Appointments Module
    * Fixed Column Headings of The Appointment Module List View
  
##- Release Candidate (RC) #1

* ##### Pharmacy Module
    * Customized core odoo addons and Bamni addons to fit Lesotho context
    * Changed workflow to suite Lesotho context
* ##### Reports
    * Ported all Bahmni 0.90 reports to Bahmni 0.92
    * Developed Informed Push Tool reports
* ##### Automated Deployment
    * Now supports auto deploying Bahmnni modules (apps), and odoo modules
* ##### Registration Module
    * National Search ported from 0.90 and improved
    * Rename gender to sex
    * Disabled camera and picture icon
    * Other Information: change contact to phone number
    * Hide PNC & ANC numbers for male patients
* ##### Clinical Module
    * Refactoring Bahmni App to align with 0.90
    * Improving the flow of order automation from observation to medication tab
    * Numbering on patient queue
    * Pregnancy status: use gender attribute to show and hide
    * Include both age and sex to the patient payload sent from bahmni to odoo
* ##### Atomfeed
    * Atom feed to allow concepts in Bahmni to automatically be pulled in odoo