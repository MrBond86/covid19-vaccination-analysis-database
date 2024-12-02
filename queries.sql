--Task D.1--
SELECT
    '2021-06-20' AS "Date 1 (OD1)",
    C1.Country_Name AS "Country Name (CN)",
    C1.Total_Vaccination AS "Vaccine on OD1 (VOD1)",
    '2021-12-26' AS "Date 2 (OD2)",
    C2.Total_Vaccination AS "Vaccine on OD2 (VOD2)",
    '2022-03-03' AS "Date 3 (OD3)",
    C3.Total_Vaccination AS "Vaccine on OD3 (VOD3)",
    ROUND(
        (((C2.Total_Vaccination - C1.Total_Vaccination) / CAST(C1.Total_Vaccination AS FLOAT)) - 
         ((C3.Total_Vaccination - C2.Total_Vaccination) / CAST(C2.Total_Vaccination AS FLOAT))) * 100, 2
    ) AS "Percentage change of totals"
FROM
    Country AS C1
JOIN
    Country AS C2 ON C1.Country_Name = C2.Country_Name AND C2.Day = 26 AND C2.Month = 12 AND C2.Year = 2021
JOIN
    Country AS C3 ON C1.Country_Name = C3.Country_Name AND C3.Day = 3 AND C3.Month = 3 AND C3.Year = 2022
WHERE
    C1.Day = 20 AND C1.Month = 6 AND C1.Year = 2021
ORDER BY
    "Percentage change of totals" DESC;


--Task D.2

SELECT
    Current.Country_Name,
    Current.Month,
    Current.Year,
    ((Current.Total_Vaccination - Previous.Total_Vaccination) / Previous.Total_Vaccination * 100) AS "Growth rate of vaccine (GR)",
    ((Current.Total_Vaccination - Previous.Total_Vaccination) / Previous.Total_Vaccination * 100) - GlobalAvg.Avg_Growth_Rate AS "Difference of growth rate to global average"
FROM
    (SELECT Country_Name, Month, Year, SUM(Total_Vaccination) AS Total_Vaccination
     FROM Country
     GROUP BY Country_Name, Month, Year) AS Current
LEFT JOIN
    (SELECT Country_Name, Month, Year, SUM(Total_Vaccination) AS Total_Vaccination
     FROM Country
     GROUP BY Country_Name, Month, Year) AS Previous
ON Current.Country_Name = Previous.Country_Name
   AND Current.Year = Previous.Year
   AND Current.Month = Previous.Month + 1 -- Assumption: data spans only one year; adjust if spanning multiple years
LEFT JOIN
    (SELECT AVG((Current.Total_Vaccination - Previous.Total_Vaccination) / Previous.Total_Vaccination * 100) AS Avg_Growth_Rate
     FROM
         (SELECT Country_Name, Month, Year, SUM(Total_Vaccination) AS Total_Vaccination
          FROM Country
          GROUP BY Country_Name, Month, Year) AS Current
     JOIN
         (SELECT Country_Name, Month, Year, SUM(Total_Vaccination) AS Total_Vaccination
          FROM Country
          GROUP BY Country_Name, Month, Year) AS Previous
     ON Current.Country_Name = Previous.Country_Name
        AND Current.Year = Previous.Year
        AND Current.Month = Previous.Month + 1) AS GlobalAvg
ON TRUE
WHERE
    Previous.Total_Vaccination IS NOT NULL
ORDER BY
    Current.Country_Name, Current.Year, Current.Month;


--TAsk D.3--

SELECT
    v.Vaccine_Name AS "Vaccine Type",
    c.Country_Name AS "Country",
    ROUND((CAST(SUM(v.People_Vaccinated) AS REAL) / CAST((
        SELECT SUM(People_Vaccinated)
        FROM Vaccination
        WHERE Vaccine_Name = v.Vaccine_Name
    ) AS REAL)) * 100, 2) AS "Percentage of vaccine type"
FROM
    Vaccination v
JOIN
    Country c ON v.Vaccination_ID = c.Country_ID
GROUP BY
    v.Vaccine_Name, c.Country_Name
ORDER BY
    v.Vaccine_Name, "Percentage of vaccine type" DESC;


--TAsk D.4--
SELECT 
    c.Country_Name,
    c.Year || '-' || c.Month AS "Month",
    s.Source_Url AS "Source Name (URL)",
    SUM(c.Total_Vaccination) AS "Total Administered Vaccines" 
FROM 
    Country c
JOIN 
    Source s ON c.Country_ID = s.Country_ID 
GROUP BY 
    c.Country_Name, c.Year, c.Month, s.Source_Url 
ORDER BY 
    c.Country_Name, c.Year, c.Month;


--task D.5--


SELECT 
    Year || '-' || Month || '-' || Day AS Date,
    (SELECT People_Fully_Vaccinated FROM Country WHERE Country_Name = 'United States' AND Day = c.Day AND Month = c.Month AND Year = c.Year) AS "United States",
    (SELECT People_Fully_Vaccinated FROM Country WHERE Country_Name = 'China' AND Day = c.Day AND Month = c.Month AND Year = c.Year) AS "China",
    (SELECT People_Fully_Vaccinated FROM Country WHERE Country_Name = 'Ireland' AND Day = c.Day AND Month = c.Month AND Year = c.Year) AS "Ireland",
    (SELECT People_Fully_Vaccinated FROM Country WHERE Country_Name = 'India' AND Day = c.Day AND Month = c.Month AND Year = c.Year) AS "India"
FROM 
    Country c
WHERE 
    Country_Name = 'United States' 
    AND Year IN (2022, 2023)
ORDER BY 
    Year, Month, Day;
    





