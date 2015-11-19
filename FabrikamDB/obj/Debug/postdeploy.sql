/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

USE [FabrikamFiber-Express]
GO

IF NOT EXISTS (SELECT name FROM sys.server_principals WHERE name = 'IIS APPPOOL\DefaultAppPool')
BEGIN
    CREATE LOGIN [IIS APPPOOL\DefaultAppPool] 
      FROM WINDOWS WITH DEFAULT_DATABASE=[master], 
      DEFAULT_LANGUAGE=[us_english]
END
GO

CREATE USER [WebDatabaseUser] 
  FOR LOGIN [IIS APPPOOL\DefaultAppPool]
GO
EXEC sp_addrolemember 'db_owner', 'WebDatabaseUser'
GO

IF NOT EXISTS (SELECT name FROM sys.server_principals WHERE name = 'NT AUTHORITY\IUSR')
BEGIN
    CREATE LOGIN [NT AUTHORITY\IUSR] 
      FROM WINDOWS WITH DEFAULT_DATABASE=[master], 
      DEFAULT_LANGUAGE=[us_english]
END
GO

CREATE USER [NTWebDatabaseUser] 
  FOR LOGIN [NT AUTHORITY\IUSR]
GO
EXEC sp_addrolemember 'db_owner', 'NTWebDatabaseUser'
GO

SET IDENTITY_INSERT [dbo].[Customers] ON
GO

INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (1, N'Maria', N'Cameron', N'One Microsoft Way', N'Redmond', N'WA', N'98052')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (2, N'Antonio', N'Alwan', N'45 Greenbelt Way', N'Redmond', N'WA', N'98052')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (3, N'Patrick', N'Cook', N'123 Standard Street', N'Redmond', N'WA', N'98052')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (4, N'Jane', N'Dow', N'9342 2nd Street', N'Redmond', N'WA', N'98052')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (5, N'Michele', N'Martin', N'361 North Avenue', N'Redmond', N'WA', N'98052')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (6, N'Dan', N'Bacon', N'45 Greenbelt Way', N'Redmond', N'WA', N'98052')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (7, N'Johnson', N'Apacible', N'123 Standard Street', N'Redmond', N'WA', N'98052')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (8, N'Pilar', N'Ackerman', N'9342 2nd Street', N'Redmond', N'WA', N'98052')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (9, N'David', N'Alexander', N'361 North Avenue', N'Redmond', N'WA', N'98052')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (10, N'Jose', N'Auricchio', N'45 Greenbelt Way', N'Redmond', N'WA', N'98052')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (11, N'Ty', N'Carlson', N'123 Standard Street', N'Redmond', N'WA', N'98052')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO

SET IDENTITY_INSERT [dbo].[Employees] ON 

GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip], [Identity], [ServiceAreas]) VALUES (1, N'Jonathan', N'Carter', N'123 Standard Street', N'Redmond', N'WA', N'98052', NULL, NULL)
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip], [Identity], [ServiceAreas]) VALUES (2, N'Drew', N'Robbins', N'45 Greenbelt Way', N'Redmond', N'WA', N'98052', N'NORTHAMERICA\drobbins', NULL)
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip], [Identity], [ServiceAreas]) VALUES (3, N'Brian', N'Keller', N'361 North Avenue', N'Redmond', N'WA', N'98052', NULL, NULL)
GO
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip], [Identity], [ServiceAreas]) VALUES (4, N'James', N'Conard', N'9342 2nd Street', N'Redmond', N'WA', N'98052', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO

SET IDENTITY_INSERT [dbo].[EdmMetadata] ON 

GO
INSERT [dbo].[EdmMetadata] ([Id], [ModelHash]) VALUES (1, N'3625E7857CBAFE34AB55E19843CC439A6FFF542C32BB5BA365E5D0EC05E7599A')
GO
SET IDENTITY_INSERT [dbo].[EdmMetadata] OFF
GO

SET IDENTITY_INSERT [dbo].[ServiceTickets] ON 

GO
INSERT [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (1, N'Modem keeps resetting itself', N'About two months ago, I started getting randomly disconnected. My modem would lose its ONLINE green light, then the SEND light, then the RECEIVE, and then finally the POWER light would go and the modem would reset itself. I bought the new one wondering if it my old router might be the problem (it was fairly old). However, the problem still persists', 3, 1, CAST(N'2015-08-10 19:44:52.733' AS DateTime), NULL, 1, 1, 2)
GO
INSERT [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (2, N'Internet Upload speed slow from 11pm-11am', N'I''m extremely unhappy with the service I have recieved as of late from FabFiber. At night, my upload is garbage. I have the extreme 50 package and I''m only getting 1mb upload and anywhere from 1%-16% packetloss. This has been going on for a week and a half now.  I''ve had two techs come out here now and nobody seems to know what is going on.', 1, 2, CAST(N'2015-08-10 19:44:52.773' AS DateTime), CAST(N'2015-08-13 19:44:52.773' AS DateTime), 1, 2, 3)
GO
INSERT [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (3, N'FabFiber is the worst EVER!!!', N'You guys set up and no-showed two service appointments in a row. You call, they set the appointment, then reschedule it (without notifying me) and of course the guarantee no longer applies.', 0, 1, CAST(N'2015-08-11 18:49:52.773' AS DateTime), NULL, 2, 2, NULL)
GO
INSERT [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (4, N'changing channel by it self', N'TV changes channels by it self I even removed the batteries from remote and it still kept changing channels every couple of minutes what is going on this happen on only one tv out of 5 in the house?', 3, 1, CAST(N'2015-08-10 19:44:52.773' AS DateTime), NULL, 3, 2, 2)
GO
INSERT [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (5, N'Viewing Recorded Programs', N'I would like to know if it is possible to adjust the amount of "fast-forward" or "fast-rewind" time, using the remote, while viewing a recorded program.As the remote is set, the fast-forward goes somewhat too far ahead.', 3, 2, CAST(N'2015-08-10 19:44:52.773' AS DateTime), NULL, 4, 2, 3)
GO
INSERT [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (6, N'Issues with service', N'About a month ago I started having issues with the TV, internet and phone. The TV was pixelating and when this happened I would also lose the internet connection and phone. I called and a technician came, he said the issue was with with a lose connection with the wires outside in the apartment complex. After he came in and fixed it, the issue went away for a few weeks. Now it''s back', 3, 1, CAST(N'2015-08-11 18:49:52.773' AS DateTime), NULL, 5, 2, 1)
GO
INSERT [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (7, N'Poor Picture Quality', N'I just purchased a Fibrikam Fiber bundle and I am very dissatisfied with the picture quality to say the least. So far, two different service representatives have been out to look at the issue.  My picture is horribly fuzzy, grainy, blurry, and almost unwatchable.  The issue goes away when I hook the coax directly through my TV as opposed to using the provided cable box, but then I do not get as many channels.  The last service tech told me that you made some sort of change a while back and the picture quality has been poor ever since', 3, 1, CAST(N'2015-08-10 19:44:52.773' AS DateTime), NULL, 6, 2, 1)
GO
INSERT [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (8, N'Channels gone!', N'I got a digital set-top box 2 years ago. Since then I get all the HD channels, basic channels, and a bunch of channels in the 200''s. Since yesterday, when I turn to these stations in the 200s a gray box appears that says, "Subscription Service." Is this just a temporary problem? Why can I no longer access these channels? I am still paying the same amount, what is going on?', 3, 2, CAST(N'2015-08-10 19:44:52.773' AS DateTime), NULL, 7, 1, 3)
GO
INSERT [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (9, N'Not getting all my channels', N'I don''t have access to all the channels I supposedly get.  Every channel gives me the message that I need to contact Fabrikam Fiber to subscribe, even though it is on the lineup I print out.  I went to the local office and they said it starts November 1.  Well it is November 2 and still no access', 3, 1, CAST(N'2015-08-11 18:49:52.777' AS DateTime), NULL, 8, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[ServiceTickets] OFF
GO
SET IDENTITY_INSERT [dbo].[ScheduleItems] ON 

GO
INSERT [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (1, 2, 1, CAST(N'2011-05-16 08:00:00.000' AS DateTime), 1, CAST(N'2015-08-10 19:44:52.763' AS DateTime))
GO
INSERT [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (2, 2, 4, CAST(N'2011-05-16 09:30:00.000' AS DateTime), 1, CAST(N'2015-08-10 19:44:52.773' AS DateTime))
GO
INSERT [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (3, 1, 5, CAST(N'2011-05-16 10:00:00.000' AS DateTime), 1, CAST(N'2015-08-10 19:44:52.773' AS DateTime))
GO
INSERT [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (4, 1, 6, CAST(N'2011-05-16 13:00:00.000' AS DateTime), 1, CAST(N'2015-08-10 19:44:52.773' AS DateTime))
GO
INSERT [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (5, 1, 7, CAST(N'2011-05-16 14:00:00.000' AS DateTime), 1, CAST(N'2015-08-10 19:44:52.773' AS DateTime))
GO
INSERT [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (6, 3, 8, CAST(N'2011-05-16 08:00:00.000' AS DateTime), 1, CAST(N'2015-08-10 19:44:52.773' AS DateTime))
GO
INSERT [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (7, 3, 9, CAST(N'2011-05-16 12:00:00.000' AS DateTime), 1, CAST(N'2015-08-10 19:44:52.777' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ScheduleItems] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceLogEntries] ON 

GO
INSERT [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (1, CAST(N'2015-08-10 19:44:52.767' AS DateTime), N'Opened ticket for customer', 2, 1)
GO
INSERT [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (2, CAST(N'2015-08-10 19:44:52.773' AS DateTime), N'Opened ticket for customer', 2, 2)
GO
INSERT [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (3, CAST(N'2015-08-11 18:49:52.773' AS DateTime), N'Opened ticket for customer', 2, 3)
GO
INSERT [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (4, CAST(N'2015-08-10 19:44:52.773' AS DateTime), N'Opened ticket for customer', 2, 4)
GO
INSERT [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (5, CAST(N'2015-08-10 19:44:52.773' AS DateTime), N'Opened ticket for customer', 2, 5)
GO
INSERT [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (6, CAST(N'2015-08-11 18:49:52.773' AS DateTime), N'Opened ticket for customer', 2, 6)
GO
INSERT [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (7, CAST(N'2015-08-10 19:44:52.773' AS DateTime), N'Opened ticket for customer', 2, 7)
GO
INSERT [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (8, CAST(N'2015-08-10 19:44:52.777' AS DateTime), N'Opened ticket for customer', 2, 8)
GO
INSERT [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (9, CAST(N'2015-08-11 18:49:52.777' AS DateTime), N'Opened ticket for customer', 2, 9)
GO
SET IDENTITY_INSERT [dbo].[ServiceLogEntries] OFF
GO
