BULK INSERT YourTable
FROM 'C:\Path\To\mrFrumbleData.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  -- If the first row contains headers
);
