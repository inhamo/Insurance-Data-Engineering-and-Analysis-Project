CREATE OR ALTER PROCEDURE pcd_create_schema_warehouse_gold 
AS 
BEGIN
    -- Create applicants schema
    IF NOT EXISTS (
        SELECT 1
        FROM sys.schemas
        WHERE name = 'applicants'
    )
    BEGIN
        EXEC('CREATE SCHEMA applicants');
    END;

    -- Create claims schema 
    IF NOT EXISTS (
        SELECT 1
        FROM sys.schemas
        WHERE name = 'claims'
    )
    BEGIN
        EXEC('CREATE SCHEMA claims');
    END;

    -- Create policies schema 
    IF NOT EXISTS (
        SELECT 1
        FROM sys.schemas
        WHERE name = 'policies'
    )
    BEGIN
        EXEC('CREATE SCHEMA policies');
    END;

    -- Create premiums schema 
    IF NOT EXISTS (
        SELECT 1
        FROM sys.schemas
        WHERE name = 'premiums'
    )
    BEGIN
        EXEC('CREATE SCHEMA premiums');
    END;
END;

