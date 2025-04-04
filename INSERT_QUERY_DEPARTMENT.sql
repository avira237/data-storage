USE [CA1_Database]
GO

INSERT INTO [dbo].[Dim_Department]
           ([department_id]
           ,[department_name])
     VALUES
           (101,'ambulatory'),
		   (102,'outpatient'),
		   (103,'wellness'),
		   (104,'urgentcare'),
		   (105,'inpatient'),
		   (106,'emergency')
GO


