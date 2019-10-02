CREATE TABLE Dept_Names (
    Dept_ID VARCHAR   NOT NULL,
    Dept_Name VARCHAR   NOT NULL,
    PRIMARY KEY (Dept_ID)
);


CREATE TABLE Employee_Info (
    Emp_ID INTEGER   NOT NULL primary key, 
    Birth_Date VARCHAR   NOT NULL,
    first_Name Varchar   NOT NULL,
    last_Name Varchar   NOT NULL,
    Gender VARCHAR   NOT NULL,
    Hire_Date Date   NOT NULL
);


CREATE TABLE Dept_Emp_Tenure (
	Emp_ID INTEGER   NOT NULL,
	Dept_ID VARCHAR   NOT NULL,
    Start_Date DATE   NOT NULL,
    End_Date DATE   NOT NULL,
	Primary key (Emp_ID, Dept_ID, Start_Date),
	FOREIGN KEY(Emp_ID) REFERENCES Employee_Info (Emp_ID),
	Foreign Key(Dept_ID) References Dept_Names (Dept_ID)
	
);

CREATE TABLE Dept_Manager_Tenure (
    Dept_ID VARCHAR   NOT NULL,
    Manager_ID INTEGER   NOT NULL,
    Start_Date DATE   NOT NULL,
    End_Date DATE   NOT NULL,
	FOREIGN KEY(Dept_ID) REFERENCES Dept_Names (Dept_ID)
);


CREATE TABLE Emp_Salaries_Tenure (
    Emp_ID INTEGER   NOT NULL,
    Salary INTEGER   NOT NULL,
    Start_Date DATE   NOT NULL,
    End_Date DATE   NOT NULL,
	FOREIGN KEY(Emp_ID) REFERENCES Employee_Info (Emp_ID)
);

CREATE TABLE Emp_Title_Tenure (
    Emp_ID INTEGER   NOT NULL,
    Title VARCHAR   NOT NULL,
    Start_Date DATE   NOT NULL,
    End_Date DATE   NOT NULL,
	FOREIGN KEY(Emp_ID) REFERENCES Employee_Info (Emp_ID)
);

