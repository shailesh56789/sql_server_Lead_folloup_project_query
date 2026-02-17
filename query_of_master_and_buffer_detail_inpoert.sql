[5:40 PM, 2/17/2026] Shailesh Kumar: DROP TABLE IF EXISTS dbo.stg_master_all_raw;
DROP TABLE IF EXISTS dbo.stg_master_all;


USE testdb;
GO

CREATE TABLE dbo.stg_master_all_raw (
    updated_date VARCHAR(MAX),
    created_date VARCHAR(MAX),
    lead_id VARCHAR(MAX),
    name_of_client VARCHAR(MAX),
    mobile VARCHAR(MAX),
    email_id VARCHAR(MAX),
    subjects VARCHAR(MAX),
    notes VARCHAR(MAX),
    ivr_url VARCHAR(MAX),
    website_name VARCHAR(MAX),
    data_source VARCHAR(MAX),
    verified_source VARCHAR(MAX)
);




SELECT @@VERSION;

TRUNCATE TABLE dbo.stg_master_all_raw;


BULK INSERT dbo.stg_master_all_raw
FROM 'C:\Import\buffet_sheet_master_all_table.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);



INSERT INTO dbo.stg_master_all
(
    updated_date,
    created_date,
    lead_id,
    name_of_client,
    mobile,
    email_id,
    subjects,
    notes,
    ivr_url,
    website_name,
    data_source,
    verified_source
)
SELECT
    LEFT(updated_date,50),
    LEFT(created_date,50),
    LEFT(lead_id,100),
    LEFT(name_of_client,300),
    LEFT(mobile,15),
    LEFT(email_id,255),
    LEFT(subjects,500),
    notes,  -- full notes
    LEFT(ivr_url,500),
    LEFT(website_name,255),
    LEFT(data_source,255),
    LEFT(verified_source,255)
FROM dbo.stg_master_all_raw;
[5:40 PM, 2/17/2026] Shailesh Kumar: USE testdb;
GO



CREATE TABLE dbo.stg_master_all_raw (
    updated_date VARCHAR(MAX),
    created_date VARCHAR(MAX),
    lead_id VARCHAR(MAX),
    name_of_client VARCHAR(MAX),
    mobile VARCHAR(MAX),
    email_id VARCHAR(MAX),
    subjects VARCHAR(MAX),
    notes VARCHAR(MAX),
    ivr_url VARCHAR(MAX),
    website_name VARCHAR(MAX),
    data_source VARCHAR(MAX),
    verified_source VARCHAR(MAX)
);


SELECT updated_date
FROM dbo.stg_master_all_raw
WHERE TRY_CAST(updated_date AS DATETIME) IS NULL
  AND updated_date IS NOT NULL;

  sp_help 'dbo.stg_master_all';

  ALTER TABLE dbo.stg_master_all_raw
ALTER COLUMN updated_date DATETIME;


ALTER TABLE dbo.stg_master_all_raw
ALTER COLUMN created_date DATETIME;

SELECT @@VERSION;

TRUNCATE TABLE dbo.stg_master_all_raw;


BULK INSERT dbo.stg_master_all_raw
FROM 'C:\Import\buffet_sheet_master_all_table.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);






   after stating importy dat ke bad ka part             

DROP TABLE IF EXISTS dbo.master_all;

CREATE TABLE dbo.master_all(
id INT IDENTITY(1,1) PRIMARY KEY,
    updated_date DATETIME,
    created_date DATETIME,
    lead_id VARCHAR(250),
    name_of_client VARCHAR(255),
    mobile VARCHAR(50),
    email_id VARCHAR(255),
    subjects VARCHAR(1000),
    notes VARCHAR(MAX),
    ivr_url VARCHAR(500),
    website_name VARCHAR(500),
    data_source VARCHAR(500),
    verified_source VARCHAR(100)
);

INSERT INTO dbo.master_all(
    updated_date, created_date, lead_id, name_of_client, mobile, email_id,
    subjects, notes, ivr_url, website_name, data_source, verified_source
)
SELECT 
    TRY_CONVERT(DATETIME, updated_date),
    TRY_CONVERT(DATETIME, created_date),
    lead_id, name_of_client, mobile, email_id,
    subjects, notes, ivr_url, website_name, data_source, verified_source
FROM dbo.stg_master_all_raw;




SELECT TOP 10 updated_date
FROM dbo.stg_master_all_raw;


SELECT updated_date
FROM dbo.stg_master_all
WHERE TRY_CAST(updated_date AS DATETIME) IS NULL
  AND updated_date IS NOT NULL;

  sp_help 'dbo.stg_master_all';

  ALTER TABLE dbo.stg_master_all
ALTER COLUMN updated_date DATETIME;
[6:28 PM, 2/17/2026] Shailesh Kumar: DROP TABLE IF EXISTS dbo.buffer_detail;

CREATE TABLE dbo.buffer_detail (
    
    Lead_id varchar(max),
    year varchar(max),
    month varchar(max),
    week varchar(max),
    intent varchar(max),
    duplicate varchar(max),
    sheet_name varchar(max),
    utm_campaign_name varchar(max),
    utm_adgroup_name varchar(max),
    lead_category varchar(max),
    priority varchar(max),
    urgency varchar(max),
    lead_relates_to_company varchar(max),
    country varchar(max),
    preferred_way_to_contact varchar(max),
    gpt_extraction_status varchar(max),
    test_col varchar(max)
);


BULK INSERT dbo.buffer_detail
FROM 'C:\Import\Buffer_sheet_detail_table.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);
BULK INSERT dbo.buffer_detail
FROM 'C:\\Import\\Buffer_sheet_detail_table.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    MAXERRORS = 100000,  -- Errors ignore karo
    TABLOCK
);

BULK INSERT dbo.buffer_detail
FROM 'C:\\Import\\Buffer_sheet_detail_table.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);