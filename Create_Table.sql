USE CA1_Database;
GO

-- Create Dim_Patient Table
CREATE TABLE Dim_Patient (
    patient_id INT PRIMARY KEY,
    birth_date DATE,
    death_date DATE,
    prefix VARCHAR(10),
    first VARCHAR(50),
    middle VARCHAR(50),
    last VARCHAR(50),
    suffix VARCHAR(10),
    maiden_name VARCHAR(50),
    marital VARCHAR(20),
    race VARCHAR(50),
    ethnicity VARCHAR(50),
    gender VARCHAR(10),
    birthplace VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    county VARCHAR(50),
    county_code VARCHAR(20),
    zip VARCHAR(20),
    lat FLOAT,
    lon FLOAT
);

-- Create Dim_Procedures Table
CREATE TABLE Dim_Procedures (
    procedures_id INT PRIMARY KEY,
    code VARCHAR(50),
    description VARCHAR(255),
    base_cost DECIMAL(18,2),
    reason_code VARCHAR(50),
    reason_description VARCHAR(255)
);

-- Create Dim_Payers Table
CREATE TABLE Dim_Payers (
    payer_id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    state_headquartered VARCHAR(50),
    zip VARCHAR(20),
    phone VARCHAR(20)
);

-- Create Dim_Hospital Table
CREATE TABLE Dim_Hospital (
    hospital_id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip VARCHAR(20),
    lat FLOAT,
    lon FLOAT
);

-- Create Dim_Department Table
CREATE TABLE Dim_Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Create Dim_Date Table
CREATE TABLE Dim_Date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    quarter INT,
    day INT,
    day_of_week VARCHAR(20)
);

-- Create Fact_Encounter Table
CREATE TABLE Fact_Encounter (
    patient_id INT,
    hospital_id INT,
    procedures_id INT,
    payer_id INT,
    date_id INT,
    department_id INT,
    encounter_id INT PRIMARY KEY,
    no_days INT,
    total_cost DECIMAL(18,2),
    FOREIGN KEY (patient_id) REFERENCES Dim_Patient(patient_id),
    FOREIGN KEY (hospital_id) REFERENCES Dim_Hospital(hospital_id),
    FOREIGN KEY (procedures_id) REFERENCES Dim_Procedures(procedures_id),
    FOREIGN KEY (payer_id) REFERENCES Dim_Payers(payer_id),
    FOREIGN KEY (date_id) REFERENCES Dim_Date(date_id),
    FOREIGN KEY (department_id) REFERENCES Dim_Department(department_id)
);
GO
