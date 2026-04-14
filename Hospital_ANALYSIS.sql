 create database HospitalAnalytics;

 use HospitalAnalytics

 CREATE TABLE Patients(
PatientID INT,
Age INT,
Gender VARCHAR(10),
City VARCHAR(50),
Department VARCHAR(50),
AdmissionType VARCHAR(20),
AdmissionDate DATE,
LengthOfStay INT,
TreatmentCost INT,
Outcome VARCHAR(50)
);

select * from Patients;

---department wise whats the patient count

SELECT Department, COUNT(*) AS TotalPatients
FROM Patients
GROUP BY Department
ORDER BY TotalPatients DESC;


---Departmnet wise what is the Average Treamnet cost

SELECT Department,
AVG(TreatmentCost) AS AvgCost
FROM Patients
GROUP BY Department
Having AVG(TreatmentCost)>10000
ORDER BY AvgCost DESC;


----What is the Admission type Count of petient and how long they are admitted.

SELECT AdmissionType,
COUNT(*) AS TotalPatients,
AVG(LengthOfStay) AS AvgStay
FROM Patients
GROUP BY AdmissionType
order by TotalPatients desc;

-----

WITH AgeGroups AS (
    SELECT 
        CASE 
            WHEN Age BETWEEN 0 AND 18 THEN '0-18'
            WHEN Age BETWEEN 19 AND 29 THEN '19-29'
            WHEN Age BETWEEN 30 AND 60 THEN '30-60'
            ELSE '60+'
        END AS AgeGroup,
        COUNT(*) AS PatientCount
    FROM Patients
    GROUP BY 
        CASE 
            WHEN Age BETWEEN 0 AND 18 THEN '0-18'
            WHEN Age BETWEEN 19 AND 29 THEN '19-29'
            WHEN Age BETWEEN 30 AND 60 THEN '30-60'
            ELSE '60+'
        END
),
MaxGroup AS (
    SELECT TOP 1 AgeGroup
    FROM AgeGroups
    ORDER BY PatientCount DESC
)
SELECT 
    'Most patients fall within ' + AgeGroup + ' age group' AS Result
FROM MaxGroup;

