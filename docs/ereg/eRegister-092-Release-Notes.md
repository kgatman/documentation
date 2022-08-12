### eRegister Release Notes

!!! warning
    * Please report issues here: [https://github.com/eRegister/bahmni_docker/issues](https://github.com/eRegister/bahmni_docker/issues)

## [0.92](https://bahmni.atlassian.net/wiki/spaces/BAH/pages/20185103/Release+Notes) - **Release Notes July 2022**

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

  
## [0.92](https://bahmni.atlassian.net/wiki/spaces/BAH/pages/20185103/Release+Notes) - Release Candidate (RC) #1

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