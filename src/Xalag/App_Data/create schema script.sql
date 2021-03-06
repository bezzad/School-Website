USE [master]
GO
/****** Object:  Database [xomorodc_tickbook]    Script Date: 5/31/2018 12:05:08 PM ******/
CREATE DATABASE [xomorodc_tickbook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'xomorodc_tickbook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\xomorodc_tickbook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10MB )
 LOG ON 
( NAME = N'xomorodc_tickbook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\xomorodc_tickbook.ldf' , SIZE = 8192KB , MAXSIZE = 2GB , FILEGROWTH = 1MB )
GO
ALTER DATABASE [xomorodc_tickbook] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [xomorodc_tickbook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [xomorodc_tickbook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET ARITHABORT OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [xomorodc_tickbook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [xomorodc_tickbook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [xomorodc_tickbook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [xomorodc_tickbook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [xomorodc_tickbook] SET  MULTI_USER 
GO
ALTER DATABASE [xomorodc_tickbook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [xomorodc_tickbook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [xomorodc_tickbook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [xomorodc_tickbook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [xomorodc_tickbook] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'xomorodc_tickbook', N'ON'
GO
ALTER DATABASE [xomorodc_tickbook] SET QUERY_STORE = OFF
GO
USE [xomorodc_tickbook]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [xomorodc_tickbook]
GO
/****** Object:  Schema [xomorodc_xomorod]    Script Date: 5/31/2018 12:05:12 PM ******/
CREATE SCHEMA [xomorodc_xomorod]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
 CONSTRAINT [PK_PlaceCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NOT NULL,
	[CityName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](60) NOT NULL,
	[Host] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](60) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [ntext] NOT NULL,
 CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY NONCLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[PaymentId] [int] NULL,
	[PaymentAmount] [numeric](18, 0) NULL,
	[PayableAmount] [numeric](18, 0) NULL,
	[DiscountPercent] [numeric](18, 0) NULL,
	[PaymentDate] [datetime] NULL,
	[Payed] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Places]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[PlaceId] [int] NOT NULL,
	[CityId] [int] NULL,
	[PlaceName] [nvarchar](300) NULL,
	[NumberOfSeats] [int] NULL,
	[SvgData] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Lat] [float] NULL,
	[Long] [float] NULL,
	[Telephone] [varchar](20) NULL,
	[ManagerName] [nvarchar](100) NULL,
	[ManagerMobile] [varchar](20) NULL,
	[WorkStartTime] [time](7) NULL,
	[WorkEndTime] [time](7) NULL,
 CONSTRAINT [PK_Places] PRIMARY KEY CLUSTERED 
(
	[PlaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlacesCategories]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlacesCategories](
	[PlaceId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_PlacesCategories] PRIMARY KEY CLUSTERED 
(
	[PlaceId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posters]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posters](
	[PosterId] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [int] NOT NULL,
	[PosterImg] [image] NULL,
 CONSTRAINT [PK_Posters] PRIMARY KEY CLUSTERED 
(
	[PosterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seats]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[SeatId] [int] IDENTITY(1,1) NOT NULL,
	[ZoneId] [int] NOT NULL,
	[Row] [int] NOT NULL,
	[SeatNumber] [int] NOT NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SeatSessions]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatSessions](
	[SeatSessionId] [int] IDENTITY(1,1) NOT NULL,
	[SeatId] [int] NOT NULL,
	[SessionScheduleId] [int] NOT NULL,
	[Amount] [numeric](18, 0) NULL,
	[IsReserved] [bit] NULL,
 CONSTRAINT [PK_SeatSessions] PRIMARY KEY CLUSTERED 
(
	[SeatSessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionId] [int] NOT NULL,
	[PlaceId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[SubTitle] [nvarchar](max) NULL,
	[MaxReservedChairPerUser] [int] NULL,
	[Information] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SessionSchedules]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionSchedules](
	[SessionScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [int] NULL,
	[SessionStartTime] [datetime] NULL,
	[SessionEndTime] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_SessionSchedules] PRIMARY KEY CLUSTERED 
(
	[SessionScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[States]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateId] [int] NOT NULL,
	[StateName] [nvarchar](50) NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[SeatSessionId] [int] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MobileNo] [varchar](15) NULL,
	[Birthday] [varchar](25) NULL,
	[NationalCode] [varchar](10) NOT NULL,
	[Email] [nvarchar](200) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Zones]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zones](
	[ZoneId] [int] NOT NULL,
	[PlaceId] [int] NOT NULL,
	[ZoneName] [nvarchar](50) NULL,
	[NumberOfSeats] [int] NULL,
	[FloorNo] [int] NULL,
	[Balcony] [bit] NOT NULL,
 CONSTRAINT [PK_Zones] PRIMARY KEY CLUSTERED 
(
	[ZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ELMAH_Error_App_Time_Seq]    Script Date: 5/31/2018 12:05:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_ELMAH_Error_App_Time_Seq] ON [dbo].[ELMAH_Error]
(
	[Application] ASC,
	[TimeUtc] DESC,
	[Sequence] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()) FOR [ErrorId]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Paymented]  DEFAULT ((0)) FOR [Payed]
GO
ALTER TABLE [dbo].[SessionSchedules] ADD  CONSTRAINT [DF_SessionSchedules_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Zones] ADD  CONSTRAINT [DF_Zones_FloorNo]  DEFAULT ((0)) FOR [FloorNo]
GO
ALTER TABLE [dbo].[Zones] ADD  CONSTRAINT [DF_Zones_Balcony]  DEFAULT ((0)) FOR [Balcony]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_States] FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([StateId])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_States]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Places]  WITH CHECK ADD  CONSTRAINT [FK_Places_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
ALTER TABLE [dbo].[Places] CHECK CONSTRAINT [FK_Places_Cities]
GO
ALTER TABLE [dbo].[PlacesCategories]  WITH CHECK ADD  CONSTRAINT [FK_PlacesCategories_PlaceCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[PlacesCategories] CHECK CONSTRAINT [FK_PlacesCategories_PlaceCategory]
GO
ALTER TABLE [dbo].[PlacesCategories]  WITH CHECK ADD  CONSTRAINT [FK_PlacesCategories_Places] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[Places] ([PlaceId])
GO
ALTER TABLE [dbo].[PlacesCategories] CHECK CONSTRAINT [FK_PlacesCategories_Places]
GO
ALTER TABLE [dbo].[Posters]  WITH CHECK ADD  CONSTRAINT [FK_Posters_Sessions] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Sessions] ([SessionId])
GO
ALTER TABLE [dbo].[Posters] CHECK CONSTRAINT [FK_Posters_Sessions]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_Zones] FOREIGN KEY([ZoneId])
REFERENCES [dbo].[Zones] ([ZoneId])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_Zones]
GO
ALTER TABLE [dbo].[SeatSessions]  WITH CHECK ADD  CONSTRAINT [FK_SeatSessions_Seats] FOREIGN KEY([SeatId])
REFERENCES [dbo].[Seats] ([SeatId])
GO
ALTER TABLE [dbo].[SeatSessions] CHECK CONSTRAINT [FK_SeatSessions_Seats]
GO
ALTER TABLE [dbo].[SeatSessions]  WITH CHECK ADD  CONSTRAINT [FK_SeatSessions_SessionSchedules] FOREIGN KEY([SessionScheduleId])
REFERENCES [dbo].[SessionSchedules] ([SessionScheduleId])
GO
ALTER TABLE [dbo].[SeatSessions] CHECK CONSTRAINT [FK_SeatSessions_SessionSchedules]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Places] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[Places] ([PlaceId])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_Places]
GO
ALTER TABLE [dbo].[SessionSchedules]  WITH CHECK ADD  CONSTRAINT [FK_SessionSchedules_Sessions] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Sessions] ([SessionId])
GO
ALTER TABLE [dbo].[SessionSchedules] CHECK CONSTRAINT [FK_SessionSchedules_Sessions]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Orders]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_SeatSessions] FOREIGN KEY([SeatSessionId])
REFERENCES [dbo].[SeatSessions] ([SeatSessionId])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_SeatSessions]
GO
ALTER TABLE [dbo].[Zones]  WITH CHECK ADD  CONSTRAINT [FK_Zones_Places] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[Places] ([PlaceId])
GO
ALTER TABLE [dbo].[Zones] CHECK CONSTRAINT [FK_Zones_Places]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml]
(
    @Application NVARCHAR(60),
    @PageIndex INT = 0,
    @PageSize INT = 15,
    @TotalCount INT OUTPUT
)
AS 

    SET NOCOUNT ON

    DECLARE @FirstTimeUTC DATETIME
    DECLARE @FirstSequence INT
    DECLARE @StartRow INT
    DECLARE @StartRowIndex INT

    SELECT 
        @TotalCount = COUNT(1) 
    FROM 
        [ELMAH_Error]
    WHERE 
        [Application] = @Application

    -- Get the ID of the first error for the requested page

    SET @StartRowIndex = @PageIndex * @PageSize + 1

    IF @StartRowIndex <= @TotalCount
    BEGIN

        SET ROWCOUNT @StartRowIndex

        SELECT  
            @FirstTimeUTC = [TimeUtc],
            @FirstSequence = [Sequence]
        FROM 
            [ELMAH_Error]
        WHERE   
            [Application] = @Application
        ORDER BY 
            [TimeUtc] DESC, 
            [Sequence] DESC

    END
    ELSE
    BEGIN

        SET @PageSize = 0

    END

    -- Now set the row count to the requested page size and get
    -- all records below it for the pertaining application.

    SET ROWCOUNT @PageSize

    SELECT 
        errorId     = [ErrorId], 
        application = [Application],
        host        = [Host], 
        type        = [Type],
        source      = [Source],
        message     = [Message],
        [user]      = [User],
        statusCode  = [StatusCode], 
        time        = CONVERT(VARCHAR(50), [TimeUtc], 126) + 'Z'
    FROM 
        [ELMAH_Error] error
    WHERE
        [Application] = @Application
    AND
        [TimeUtc] <= @FirstTimeUTC
    AND 
        [Sequence] <= @FirstSequence
    ORDER BY
        [TimeUtc] DESC, 
        [Sequence] DESC
    FOR
        XML AUTO



GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELMAH_GetErrorXml]
(
    @Application NVARCHAR(60),
    @ErrorId UNIQUEIDENTIFIER
)
AS

    SET NOCOUNT ON

    SELECT 
        [AllXml]
    FROM 
        [ELMAH_Error]
    WHERE
        [ErrorId] = @ErrorId
    AND
        [Application] = @Application



GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELMAH_LogError]
(
    @ErrorId UNIQUEIDENTIFIER,
    @Application NVARCHAR(60),
    @Host NVARCHAR(30),
    @Type NVARCHAR(100),
    @Source NVARCHAR(60),
    @Message NVARCHAR(500),
    @User NVARCHAR(50),
    @AllXml NTEXT,
    @StatusCode INT,
    @TimeUtc DATETIME
)
AS

    SET NOCOUNT ON

    INSERT
    INTO
        [ELMAH_Error]
        (
            [ErrorId],
            [Application],
            [Host],
            [Type],
            [Source],
            [Message],
            [User],
            [AllXml],
            [StatusCode],
            [TimeUtc]
        )
    VALUES
        (
            @ErrorId,
            @Application,
            @Host,
            @Type,
            @Source,
            @Message,
            @User,
            @AllXml,
            @StatusCode,
            @TimeUtc
        )



GO
/****** Object:  StoredProcedure [dbo].[sp_User_Insert]    Script Date: 5/31/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Behzad Khosravifar
-- Create date: 1395/09/20
-- Description:	Insert new user
-- =============================================
CREATE PROCEDURE [dbo].[sp_User_Insert]
    @FirstName NVARCHAR(50) = NULL ,
    @LastName NVARCHAR(50) = NULL ,
    @MobileNo VARCHAR(15) = NULL ,
    @Birthday VARCHAR(25) = NULL ,
    @NationalCode VARCHAR(10) ,
    @Email NVARCHAR(200) = NULL
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;

		DECLARE @Id INT;

        INSERT  INTO dbo.Users
                ( FirstName ,
                  LastName ,
                  MobileNo ,
                  Birthday ,
                  NationalCode ,
                  Email
	            )
        VALUES  ( @FirstName ,
                  @LastName ,
                  @MobileNo ,
                  @Birthday ,
                  @NationalCode ,
                  @Email
	            );

        SELECT  @Id = SCOPE_IDENTITY();

		Select @Id;
    END;


GO
USE [master]
GO
ALTER DATABASE [xomorodc_tickbook] SET  READ_WRITE 
GO
