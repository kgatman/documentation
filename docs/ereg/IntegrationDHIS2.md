# Bahmni DHIS2 Integration

## Installation
Install git
`$sudo yum update # update system packages`
`$sudo yum install git`

Install maven 
`$sudo yum install maven`

Install rpm-build
`$sudo yum install rpm-build`

Clone the source code from the repository
`$sudo git clone <repository url link>`

Build the plugin
`$sudo mvn -Dmaven.test.skip=true install`

Install the plugin
`$sudo yum install dhis-integration-1.0-1.noarch.rpm`

Configure the plugin - set application properties

Navigate to the application’s properties configuration file:
`cd /etc/dhis-integration/dhis-integration.yml`

Configure the application as follows:



## Testing

## Uninstallation