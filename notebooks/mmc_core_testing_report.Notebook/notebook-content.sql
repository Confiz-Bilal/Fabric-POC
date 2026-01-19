-- Fabric notebook source

-- METADATA ********************

-- META {
-- META   "kernel_info": {
-- META     "name": "sqldatawarehouse"
-- META   },
-- META   "dependencies": {
-- META     "warehouse": {
-- META       "known_warehouses": []
-- META     }
-- META   }
-- META }

-- MARKDOWN ********************

-- #### Fact_Appointment

-- MARKDOWN ********************

-- ##### Count Match

-- CELL ********************

SELECT count(0) FROM DataHub_BRZ_Lakehouse.dbo.appointments

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

SELECT count(0) FROM appointments

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select count(0)
FROM [DataHub_GLD_Warehouse].[gold].[Fact_Appointment]

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- #### Dups Check

-- CELL ********************

SELECT Appointment_UID, count(0 )
FROM [DataHub_GLD_Warehouse].[gold].[Fact_Appointment]
group by Appointment_UID
having count(0)>1

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- #### Date Wise Count

-- CELL ********************

select Appointment_Date_FID, COUNT(0)
FROM [DataHub_GLD_Warehouse].[gold].[Fact_Appointment]
GROUP BY Appointment_Date_FID


-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- XXAMG_MMC_WEB_APPNTMNT_F itself has duplicates please check case below, Count of new fact accurate against raw mmc table

-- CELL ********************

select * from  DataHub_BRZ_Lakehouse.dbo.XXAMG_MMC_WEB_APPNTMNT_F
WHERE CAST(FORMAT(CAST(APPOINTMENTDATE AS DATE), 'yyyyMMdd') AS INT)=20260106 and
APPNTMENT_UID='5bd2c51c-7935-4d04-b398-6d274c509161'

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select APPNTMENT_UID , count(0) from  DataHub_BRZ_Lakehouse.dbo.XXAMG_MMC_WEB_APPNTMNT_F
WHERE CAST(FORMAT(CAST(APPOINTMENTDATE AS DATE), 'yyyyMMdd') AS INT)=20260106
group by APPNTMENT_UID
having count(0)>1

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- #### Orphans records check in Fact_Appointment table

-- MARKDOWN ********************

-- Orphan Customers

-- CELL ********************

select count(0) from  [DataHub_GLD_Warehouse].[gold].[Fact_Appointment]
where Customer_FID is null

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select distinct app.customer_account_id from  DataHub_BRZ_Lakehouse.dbo.appointments app
left join [DataHub_GLD_Warehouse].[dbo].[Dim_Customers] dc
    ON (
        app.customer_account_id = dc.Customer_ID
        OR (app.customer_account_id IS NULL AND dc.Customer_ID IS NULL)
    )

where dc.Customer_ID is null 

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select * from [DataHub_GLD_Warehouse].[dbo].[Dim_Customers]
where Customer_ID= 8740436


-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- Orphan Vehicle

-- CELL ********************

select distinct app.customer_vehicle_vin_number from  DataHub_BRZ_Lakehouse.dbo.appointments app
left join [DataHub_GLD_Warehouse].[dbo].[Dim_Vehicles] dv ON app.customer_vehicle_vin_number = dv.VIN_Number

where dv.VIN_Number is null 

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select * from [DataHub_GLD_Warehouse].[dbo].[Dim_Vehicles]
where VIN_Number= 'PA707067'



-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- Orphan Branches

-- CELL ********************

select distinct app.branch_emad_code from  DataHub_BRZ_Lakehouse.dbo.appointments app
left join [keys].[key_operation] op ON app.branch_emad_code = op.Operation_ID
where op.Operation_ID is null 


-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- Orphan Employees

-- CELL ********************

select distinct app.created_by_employer_number from  appointments app_s
 left join DataHub_BRZ_Lakehouse.dbo.appointments app on app_s.uid=app.appointment_uid
where app_s.created_by_employee_fid is null



-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- ## ticket

-- MARKDOWN ********************

-- ##### Count Match

-- CELL ********************

select count(0) from DataHub_BRZ_Lakehouse.dbo.XXAMG_MMC_QUEUING_TICKET

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

SELECT count(0) FROM DataHub_BRZ_Lakehouse.dbo.ticket

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select count(0) from [DataHub_GLD_Warehouse].[gold].Fact_Ticket

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

SELECT count(0) FROM ticket

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- ##### Dups Check

-- CELL ********************

SELECT ROW_FID, count(0 )
FROM [DataHub_GLD_Warehouse].[gold].[Fact_Ticket]
group by ROW_FID
having count(0)>1

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- ##### Date Wise Count Match

-- CELL ********************

select Titcket_Created_At_FID, COUNT(0)
FROM [DataHub_GLD_Warehouse].[gold].[Fact_Ticket]
GROUP BY Titcket_Created_At_FID


-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select TICKET_UID , count(0) from  DataHub_BRZ_Lakehouse.dbo.XXAMG_MMC_QUEUING_TICKET
-- WHERE CAST(FORMAT(CAST(TICKET_CREATED_AT AS DATE), 'yyyyMMdd') AS INT)=20260106
group by TICKET_UID
having count(0)>1

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- #### Orphan Records

-- MARKDOWN ********************

-- Orphan Customer

-- CELL ********************


select count(0) from  [DataHub_GLD_Warehouse].[gold].[Fact_Ticket]
where Customer_FID is null

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************


select distinct app.customer_account_id from  DataHub_BRZ_Lakehouse.dbo.ticket app
left join [DataHub_GLD_Warehouse].[dbo].[Dim_Customers] dc
    ON (
        app.customer_account_id = dc.Customer_ID
        OR (app.customer_account_id IS NULL AND dc.Customer_ID IS NULL)
    )
    
where dc.Customer_ID is null 

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select * from [DataHub_GLD_Warehouse].[dbo].[Dim_Customers]
where Customer_ID= 8741257

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- Orphan Vehicle

-- CELL ********************


select distinct app.customer_vehicle_vin from  DataHub_BRZ_Lakehouse.dbo.ticket app
left join [DataHub_GLD_Warehouse].[dbo].[Dim_Vehicles] dv ON app.customer_vehicle_vin = dv.VIN_Number

where dv.VIN_Number is null 

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select * from [DataHub_GLD_Warehouse].[dbo].[Dim_Vehicles]
where VIN_Number= 'PJ520501'

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- Orphan Operation

-- CELL ********************

select distinct app.branch_emad_code from  DataHub_BRZ_Lakehouse.dbo.ticket app
left join [keys].[key_operation] op ON app.branch_emad_code = op.Operation_ID
where op.Operation_ID is null 

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select distinct app.ticket_updated_by_employer_number from  ticket app_s
 left join DataHub_BRZ_Lakehouse.dbo.ticket app on app_s.uid=app.ticket_uid
where app_s.updated_by_employee_fid is null

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- ## service_Agreement

-- MARKDOWN ********************

-- ##### Count Check

-- CELL ********************

select count(0) from [DataHub_GLD_Warehouse].[gold].Fact_Service_Agreement

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select count(0) from service_agreement

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

SELECT count(0) FROM DataHub_BRZ_Lakehouse.dbo.service_agreement

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- ##### Dups Check

-- CELL ********************

SELECT ROW_FID, count(0 )
FROM [DataHub_GLD_Warehouse].[gold].[Fact_Service_Agreement]
group by ROW_FID
having count(0)>1

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- ##### Date Wise Count

-- MARKDOWN ********************

-- ##### Orphan Records

-- MARKDOWN ********************

-- Orphan Customer

-- CELL ********************

select count(0) from  [DataHub_GLD_Warehouse].[gold].[Fact_Service_Agreement]
where Customer_FID is null

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select distinct app.customer_account_id from  DataHub_BRZ_Lakehouse.dbo.service_agreement app
left join [DataHub_GLD_Warehouse].[dbo].[Dim_Customers] dc
    ON (
        app.customer_account_id = dc.Customer_ID
        OR (app.customer_account_id IS NULL AND dc.Customer_ID IS NULL)
    )

where dc.Customer_ID is null 

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select * from [DataHub_GLD_Warehouse].[dbo].[Dim_Customers]
where Customer_ID= 8741278

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- Orphan Employees

-- CELL ********************

select distinct app.service_agreement_created_by_employer_number from  service_agreement app_s
 left join DataHub_BRZ_Lakehouse.dbo.service_agreement app on app_s.uid=app.appointment_uid
where app_s.created_by_employee_fid is null

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- Orphan Vehicle

-- CELL ********************

select distinct app.customer_vehicle_vin from  DataHub_BRZ_Lakehouse.dbo.service_agreement app
left join [DataHub_GLD_Warehouse].[dbo].[Dim_Vehicles] dv ON app.customer_vehicle_vin = dv.VIN_Number

where dv.VIN_Number is null 

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************


select * from [DataHub_GLD_Warehouse].[dbo].[Dim_Vehicles]
where VIN_Number= 'LS4ASE2AOPJ100767'

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************


-- MARKDOWN ********************

-- ## Delivery_Note

-- MARKDOWN ********************

-- ##### Count Check

-- CELL ********************

select count(0) from [DataHub_GLD_Warehouse].[gold].Fact_Delivery_Note


-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select count(0) from delivery_note

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- ##### Dups check

-- CELL ********************

select ROW_FID , count(0) from [DataHub_GLD_Warehouse].[gold].Fact_Delivery_Note
group  by ROW_FID
having count(0)>1


-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- ##### Orphan Records Check

-- MARKDOWN ********************

-- orphan employees

-- CELL ********************

select distinct app.delivery_note_created_by_employer_number from  delivery_note app_s
 left join DataHub_BRZ_Lakehouse.dbo.delivery_note app on app_s.uid=app.delivery_note_uid
where app_s.created_by_employee_fid is null

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- orphan operation

-- CELL ********************

select distinct app.branch_emad_code from  DataHub_BRZ_Lakehouse.dbo.delivery_note app
left join [keys].[key_operation] op ON app.branch_emad_code = op.Operation_ID
where op.Operation_ID is null 

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- orphan customer

-- CELL ********************

select count(0) from  [DataHub_GLD_Warehouse].[gold].[Fact_Delivery_Note]
where Customer_FID is null

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

select distinct app.customer_account_id from  DataHub_BRZ_Lakehouse.dbo.delivery_note app
left join [DataHub_GLD_Warehouse].[dbo].[Dim_Customers] dc
    ON (
        app.customer_account_id = dc.Customer_ID
        OR (app.customer_account_id IS NULL AND dc.Customer_ID IS NULL)
    )

where dc.Customer_ID is null 

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************


select * from [DataHub_GLD_Warehouse].[dbo].[Dim_Customers]
where Customer_ID= 8741218

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }
