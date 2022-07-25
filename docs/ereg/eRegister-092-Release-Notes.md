### eRegister Release Notes

!!! warning
    * Please report issues here: [https://github.com/eRegister/bahmni_docker/issues](https://github.com/eRegister/bahmni_docker/issues) or [email](mailto:mm5093@cumc.columbia.edu)
## **[0.92](https://bahmni.atlassian.net/wiki/spaces/BAH/pages/20185103/Release+Notes)** - **Release Notes July 2022**
* ##### Clinical Module
    * content content
* ##### Reports Module
    * content content
* ##### Pharmacy Module
    * content content

## [0.92](https://bahmni.atlassian.net/wiki/spaces/BAH/pages/20185103/Release+Notes) - **Release Candidate (RC) #1**

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