
Modules with notable updates: Sales, Purchases 
Modules without notable updates: Point Of Sale, Inventory, Accounting

-	Odoo UI changes are stored on the two sub-repositories on eRegister repository namely: bahmni_addons and odoo_addons.
-	Bahmni_addons simlink creation must point to the directory: opt/bahmni-erp/bahmni-addons
-	Odoo_addons simlink creation must point to the directory: opt/bahmni-erp/odoo/addons
-	After creation of Sim links: “systemctl restart odoo.service” command updates the UI accordingly.


