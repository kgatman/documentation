#### Dispensing Module

Dashboard: Dispensing Menu and Invoicing Menu 

#### Dispensing
Dispensing sub-menus;

* ###### Clients
    * _all frontend changes done related to Odoo Customers, renamed to Clients_

* ###### Prescriptions
    * _all frontend changes done related to Odoo Quotations, renamed to Prescription_

* ###### Dispensing Orders
    * _all frontend changes done related to Odoo Sales Orders, renamed to Dispensing Orders_

* ###### Products
    * _all frontend changes done related to Odoo Products_


* #### Dispensing Updates
    * _Top Menu item (Sales) changed to Dispensing_ 
    * _Left Menu item under “Dashboard” (Sales) changed to Dispensing_ 
    * _Left Menu item under “Dispensing” (Customers) changed to Clients_
    * _Left Menu item under “Dispensing” (Quotations) changed to Prescriptions_ 
    * _Left Menu item under “Dispensing” (Sales Orders) changed to Dispensing Orders_ 
    * _Left Menu item under “Configuration” (Shop) changed to Dispensary_ 
    * _Confirm Sale button changed to confirm dispensing_
    * _Inside Prescriptions: New modified fields { `Prescription number`, `Prescription Date`, `Client, Dispensary`, `Pharmacy Staff`, `Provider name`, `Service Point and Status` }
    * _Inside Each Prescription: Locations changed to Pharmacy Locations, removal of Tax and other associated Costs_
    * _Inside Dispensing Orders: New modified fields { `Prescription number`, `Prescription Date`, `Client`, `Pharmacy Staff`}, sales buttons changed to Dispense and new medical kit icon_
    * _Files Changed: `Odoo_addons/sale/views/sale_views.xml`, `Odoo_addons/base/views/res_partner_view.xml`, `Bahmni_addons/views/sale/views/sales_order_views.xml` 



#### Invoicing
Invoicing sub-menus;
* ###### Sales to Invoice
    * _all frontend changes done related to Sales to Invoice_

* ###### Orders to Upsell
    * _all frontend changes done related to Orders to Upsell_