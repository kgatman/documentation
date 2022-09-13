### eRegister Release Notes

!!! warning
    * this beta version is going to be deployed at selected pilot facilities. 
    * Please report issues here: [https://github.com/eRegister/bahmni_docker/issues](https://github.com/eRegister/bahmni_docker/issues)

## [0.92](https://bahmni.atlassian.net/wiki/spaces/BAH/pages/20185103/Release+Notes) 
## - *Release Notes September 2022*
* ##### Reports
    * ###### Bahmni 
          - *TB_Intake report(list)* - correction to pull correction patients
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
* ##### Clinical Module
    * New Prep Follow-Up Form
    * New Prep Intake Form
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