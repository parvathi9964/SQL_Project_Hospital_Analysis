 create database HospitalAnalytics;


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

---create age group in range 

alter table Patients
	add age_group VARCHAR(50);

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



