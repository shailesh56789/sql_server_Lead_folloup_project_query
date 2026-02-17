use userdb


CREATE TABLE lead_buffer_additional_detail (
    lead_id VARCHAR(Max),
    assign_to_mr_main VARCHAR(MAX),
    timestamp_2 VARCHAR(MAX),
    enquiry_status_last VARCHAR(MAX),
    converted_amount VARCHAR(MAX),
    converted_date VARCHAR(MAX),
    order_taken_by VARCHAR(MAX),
    status VARCHAR(MAX),
    nbd_crr VARCHAR(MAX),
    kappl_ktahv VARCHAR(MAX),
    transcription VARCHAR(MAX),
    user_name VARCHAR(MAX),
    user_phone_number VARCHAR(MAX),
    user_email VARCHAR(MAX),
    contact_time VARCHAR(MAX),
    conversation_summary VARCHAR(MAX),
    lead_outcome VARCHAR(MAX),
    sent_status VARCHAR(MAX),
    mail_status VARCHAR(MAX),
    assign_delete_reason VARCHAR(MAX)

);


BULK INSERT dbo.lead_buffer_additional_detail
FROM 'C:\Import\Buffer_sheet_copy_detail_table.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    MAXERRORS = 100000,  -- Errors ignore karo
    TABLOCK
);

