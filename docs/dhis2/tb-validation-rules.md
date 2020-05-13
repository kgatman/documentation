## TB Program Validation Rules

### To ensure optimal quality of data, the following validation rules were setup. We have named them according to which dataset they apply
* Unsorted list of all validation rules. We'll later sort the according to which datasets they're meant to apply to. This is meant for you to deal better with these validation rules when they pop out.

| Dataset| Validation Rules |
| --- | --- |
| foo | TB-2018_1 Total number of NEW patients tested for Rifampicin susceptibility  should be greater than or equal to Number of patients tested for rifampicin susceptibility |
| foo | TB-2018_2 Total PREVIOUSLY TREATED DR-TB Patients should be greater than or equal to Number of PREVIOUSLY TREATED patients tested for rifampicin susceptibility who are laboratory confirmed RR-TB |
| foo | TB-2018_3 Total NEW DR-TB Patients should be greater than or equal to number of NEW patients tested for rifampicin susceptibility who are laboratory confirmed MDR-TB |
| foo | TB-2018_4 Total Previously Treated DR-TB Patients should be greater or equal to Number of patients tested for rifampicin susceptibility who are laboratory confirmed MDR-TB |
| foo | TB-2018_5 Total NEW DR-TB Patients should be greater than or equal to Number of laboratory confirmed RR-TB or MDT patients started on second-line treatment |
| foo | TB-2018_6 Total Previously Treated DR-TB Patients should be greater then or equal to Number of laboratory confirmed RR-TB or MDT patients started on second-line treatment|
| foo | TB-2018_7 Xpert MTB/RIF + LPA + Phenotypic DST (Block 2) should be less than or equal to Total New patients + Total Previously treated (Block 1) |
| foo | TB-2018_8 Total number of patients resistant to Isoniazid should be less than or equal to Total number of PTB bacteriologically confirmed cases |
| foo | TB-2018_9 Total Number resistant to Rifampicin only should be less than or equal to Total number of PTB bacteriologically confirmed cases |
| foo | TB-2018_10 Total Number resistant to Rifampicin and Isoniazid should be less than or equal to Total number of PTB bacteriologically confirmed cases |
| foo | TB-2018_12 Total Number resistant to Rifampicin and Isoniazid should be less than or equal to Total of Number of patients tested for Rifampicin susceptibility who are laboratory confirmed MDR-TB |
| foo | TB-2018_13 Total of RR or MDR-TB (block 3) should be equal to Total row "c" plus total row "d" (Block 2) |
| foo | TB-2018_14 Total of RR or MDR-TB (Block 4) should be equal to Total of row "c" + row "d" (Block 2) |
| foo | TB-2018_15 Total number of clients screened for TB (column (a), row (total) - Block 1) should be greater than or equal to Clients with signs and symptoms (Column (b), row (total) - Block 1) |
| foo | TB-2018_15a [Total] Total TB Screening greater_than_or_equal_to TB Screening Total Clients with signs and symptoms |
| foo | TB-2018_16 Total Referred by CHW (column(a)) should be greater than or equal to Referred by CHW Clients with signs and symptoms (column (b)) |
| foo | TB-2018_16a [Referred by CHW] Total TB Screening greater_than_or_equal_to Referred by CHW Clients with signs and symptoms |
| foo | TB-2018_17 [Referred by CSO] Total TB Screening greater_than_or_equal_to Referred by SCO Clients with signs and symptoms |
| foo | TB-2018_18 [Children] Total TB Screening greater_than_or_equal_to Children (0-14 years) Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_19 [Mine Workers] Total TB Screening greater_than_or_equal_to Mine Workers Clients with signs and symptoms |
| foo | TB-2018_20 [Ex-mine workers] Total TB Screening greater_than_or_equal_to Ex-Mine Workers Clients with signs and symptoms |
| foo | TB-2018_21 [HHCM] Total TB Screening greater_than_or_equal_to HHCM Clients with signs and symptoms |
| foo | TB-2018_22 [HHXM] Total TB Screening greater_than_or_equal_to HHXM Clients with signs and symptoms |
| foo | TB-2018_23 [Factory Workers] Total TB Screening greater_than_or_equal_to Factory Workers Clients with signs and symptoms |
| foo | TB-2018_24 [Correctional Staff] Total TB Screening greater_than_or_equal_to Correctional Staff or Inmate Clients with signs and symptom |
| foo | TB-2018_25 [Health Workers] Total TB Screening greater_than_or_equal_to Health Workers Clients with signs and symptoms |
| foo | TB-2018_26 [Public Transport Ops] Total TB Screening greater_than_or_equal_to Public Transport Operators Clients with signs and symptoms |
| foo | TB-2018_27 [Total] Total TB Screening greater_than_or_equal_to TB Screening Total Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_28 [Referred by CHW] Total TB Screening greater_than_or_equal_to Referred by CHW Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_29 [Referred by CSO] Total TB Screening greater_than_or_equal_to Referred by SCO Total number of diagnosed |
| foo | TB-2018_30 [Children] Total TB Screening greater_than_or_equal_to Children (0-14 years) Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_31 [Mine Workers] Total TB Screening greater_than_or_equal_to Mine Workers Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_32 [Ex-mine workers] Total TB Screening greater_than_or_equal_to Ex-Mine Workers Total number of diagnosed |
| foo | TB-2018_33 [HHCM] Total TB Screening greater_than_or_equal_to HHCM Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_34 [HHXM] Total TB Screening greater_than_or_equal_to HHXM Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_35 [Factory Workers] Total TB Screening greater_than_or_equal_to Factory Workers Total number of diagnosed |
| foo | TB-2018_37 [Health Workers] Total TB Screening greater_than_or_equal_to Health Workers Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_38 [Public Transport Ops] Total TB Screening greater_than_or_equal_to Public Transport Operators Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_39 TB Screening Total Total number of diagnosed greater_than_or_equal_to TB Screening Total Number started on ant-TB treatment |
| foo | TB-2018_40 Referred by CHW Total number of diagnosed greater_than_or_equal_to Referred by CHW Number started on ant-TB treatment |
| foo | TB-2018_41 Referred by SCO Total number of diagnosed greater_than_or_equal_to Referred by SCO Number started on ant-TB treatment |
| foo | TB-2018_42 Children (0-14 years) Total number of diagnosed greater_than_or_equal_to Children (0-14 years) Number started on ant-TB treatment |
| foo | TB-2018_43  Mine Workers Total number of diagnosed greater_than_or_equal_to Mine Workers Number started on ant-TB treatment |
| foo | TB-2018_44 Ex-Mine Workers Total number of diagnosed greater_than_or_equal_to Ex-Mine Workers Number started on ant-TB treatment |
| foo | TB-2018_45 HHCM Total number of diagnosed greater_than_or_equal_to HHCM Number started on ant-TB treatment |
| foo | TB-2018_46 HHXM Total number of diagnosed greater_than_or_equal_to HHXM Number started on ant-TB treatment |
| foo | TB-2018_47 Factory Workers Total number of diagnosed greater_than_or_equal_to Factory Workers Number started on ant-TB treatment |
| foo | TB-2018_48 Correctional Staff or Inmate Total number of diagnosed greater_than_or_equal_to Correctional Staff or Inmate Number started on ant-TB treatment |
| foo | TB-2018_49 Health Workers Total number of diagnosed greater_than_or_equal_to Health Workers Number started on ant-TB treatment |
| foo | TB-2018_50 Public Transport Operators Total number of diagnosed greater_than_or_equal_to Public Transport Operators Number started on ant-TB treatment |
| foo | TB-2018_51 TB Screening Total Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to TB Screening Total Total number of diagnosed |
| foo | TB-2018_52 Referred by CHW Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Referred by CHW Total number of diagnosed |
| foo | TB-2018_53 Referred by SCO Total number of diagnosed greater_than_or_equal_to Referred by SCO Total number of diagnosed |
| foo | TB-2018_54 Children (0-14 years) Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Children (0-14 years) Total number of diagnosed |
| foo | TB-2018_55 Mine Workers Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to  Mine Workers Total number of diagnosed |
| foo | TB-2018_56 Ex-Mine Workers Total number of diagnosed greater_than_or_equal_to Ex-Mine Workers Total number of diagnosed |
| foo | TB-2018_57 HHCM Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to HHCM Total number of diagnosed |
| foo | TB-2018_58 HHXM Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to HHXM Total number of diagnosed |
| foo | TB-2018_59 Factory Workers Total number of diagnosed greater_than_or_equal_to Factory Workers Total number of diagnosed |
| foo | TB-2018_60 Correctional Staff or Inmate Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Correctional Staff or Inmate Total number of diagnosed |
| foo | TB-2018_61 Health Workers Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Health Workers Total number of diagnosedm |
| foo | TB-2018_62 Public Transport Operators Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Public Transport Operators Total number of diagnosed |
| foo | TB-2018_63 TB Screening Total Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to TB Screening Total Number started on ant-TB treatment |
| foo | TB-2018_64 Referred by CHW Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Referred by CHW Number started on ant-TB treatment |
| foo | TB-2018_65 Referred by SCO Total number of diagnosed greater_than_or_equal_to Referred by SCO Number started on ant-TB treatment |
| foo | TB-2018_66 Children (0-14 years) Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Children (0-14 years) Number started on ant-TB treatment |
| foo | TB-2018_67 Mine Workers Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Mine Workers Number started on ant-TB treatment |
| foo | TB-2018_68 Ex-Mine Workers Total number of diagnosed greater_than_or_equal_to Ex-Mine Workers Number started on ant-TB treatment |
| foo | TB-2018_69 HHCM Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to HHCM Number started on ant-TB treatment |
| foo | TB-2018_70 HHXM Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to HHXM Number started on ant-TB treatment |
| foo | TB-2018_71 Factory Workers Total number of diagnosed greater_than_or_equal_to Factory Workers Number started on ant-TB treatment |
| foo | TB-2018_72 Correctional Staff or Inmate Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Correctional Staff or Inmate Number started on ant-TB treatment |
| foo | TB-2018_73 Health Workers Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Health Workers Number started on ant-TB treatment |
| foo | TB-2018_74 Public Transport Operators Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Public Transport Operators Number started on ant-TB treatment |
| foo | TB-2018_75 TB Screening Total Clients with signs and symptoms greater_than_or_equal_to TB Screening Total Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_76 Referred by CHW Clients with signs and symptoms greater_than_or_equal_to Referred by CHW Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_77 Referred by SCO Clients with signs and symptoms greater_than_or_equal_to Referred by SCO Total number of diagnosed |
| foo | TB-2018_78 Children (0-14 years) Patients with signs and symptoms who tested bacteriologically greater_than_or_equal_to Children (0-14 years) Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_79 Mine Workers Clients with signs and symptoms  greater_than_or_equal_to Mine Workers Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_80 Ex-Mine Workers Clients with signs and symptoms greater_than_or_equal_to Ex-Mine Workers Total number of diagnosed |
| foo | TB-2018_81 HHCM Clients with signs and symptoms  greater_than_or_equal_to HHCM Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_82 HHXM Clients with signs and symptoms greater_than_or_equal_to HHXM Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_83 Factory Workers Clients with signs and symptoms greater_than_or_equal_to Factory Workers Total number of diagnosed |
| foo | TB-2018_84 Correctional Staff or Inmate Clients with signs and symptom greater_than_or_equal_to Correctional Staff or Inmate Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_85 Health Workers Clients with signs and symptoms greater_than_or_equal_to Health Workers Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_86 Public Transport Operators Clients with signs and symptoms greater_than_or_equal_to Public Transport Operators Patients with signs and symptoms who tested bacteriologically |
| foo | TB-2018_87 TB Screening Total Number who died anti-TB treatment less_than_or_equal_to TB Screening Total Total number of diagnosed |
| foo | TB-2018_88 Referred by CHW Number who died anti-TB treatment less_than_or_equal_to Referred by CHW Total number of diagnosed |
| foo | TB-2018_89 Referred by SCO Number who died anti-TB treatment less_than_or_equal_to Referred by SCO Total number of diagnosed |
| foo | TB-2018_90 Children (0-14 years) Number who died anti-TB treatment less_than_or_equal_to Children (0-14 years) Total number of diagnosed |
| foo | TB-2018_91 Mine Workers Number who died anti-TB treatment less_than_or_equal_to  Mine Workers Total number of diagnosed |
| foo | TB-2018_92 Ex-Mine Workers Number who died anti-TB treatment less_than_or_equal_to Ex-Mine Workers Total number of diagnosed |
| foo | TB-2018_93 HHCM Number who died anti-TB treatment less_than_or_equal_to HHCM Total number of diagnosed |
| foo | TB-2018_94 HHXM Number who died anti-TB treatment less_than_or_equal_to HHXM Total number of diagnosed |
| foo | TB-2018_95 Factory Workers Number who died anti-TB treatment less_than_or_equal_to Factory Workers Total number of diagnosed |
| foo | TB-2018_96 Correctional Staff or Inmate Number who died anti-TB treatment less_than_or_equal_to Correctional Staff or Inmate Total number of diagnosed	 |
| foo | TB-2018_97 Health Workers Number who died anti-TB treatment less_than_or_equal_to Health Workers Total number of diagnosed |
| foo | TB-2018_98 Public Transport Operators Number who died anti-TB treatment less_than_or_equal_to Public Transport Operators Total number of diagnosed |
| foo | TB-2018_99 TB Screening Total Number who died anti-TB treatment less_than_or_equal_to TB Screening Total Number started on ant-TB treatment |

>please click on each validation rules to learn how to handle them

