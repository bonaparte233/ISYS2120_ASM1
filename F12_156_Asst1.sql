CREATE TABLE Service (
    ABN                   INTEGER                PRIMARY KEY,
    Email                 VARCHAR(50),
    ServiceName           VARCHAR(50),
    Owed                  VARCHAR(50)
);


CREATE TABLE Model (
    Description           VARCHAR(50),
    Manufacturer          VARCHAR(50),
    ModelNumber           FLOAT,
    Weight                FLOAT,
    PRIMARY KEY (Manufacturer, ModelNumber)
);


CREATE TABLE Employee (
    EmpID                 INTEGER                PRIMARY KEY,
    DateOfBirth           VARCHAR(50),
    Name                  VARCHAR(50),
    HomeAddress           VARCHAR(50),
    PhoneNumbers          VARCHAR(50),
    department            VARCHAR(50)
);
CREATE TABLE PhoneNumbers(
    Number                INTEGER,
    employee              INTEGER                REFERENCES employee(EmpID),
    PRIMARY KEY (Number, employee)
);


CREATE TABLE Device (
    DeviceID              INTEGER                PRIMARY KEY,
    PurchaseCost          FLOAT,
    PurchaseDate          VARCHAR(50),
    SerialNumber          VARCHAR(50),
    employee              INTEGER                REFERENCES Employee(EmpID),
    ModelNumber           INTEGER                NOT NULL,
    manufacturer          VARCHAR(50)            NOT NULL,
    FOREIGN KEY (ModelNumber, manufacturer) REFERENCES Model(ModelNumber, Manufacturer)
);

CREATE TABLE Phone (
    DeviceID              INTEGER                PRIMARY KEY ,
    Number                INTEGER,
    Carrier               VARCHAR(50),
    Plan                  VARCHAR(50),
    FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID)
);


CREATE TABLE Repair(
    RepairID              INTEGER                PRIMARY KEY,
    Cost                  FLOAT                  NOT NULL,
    EndDate               VARCHAR(50),
    StartDate             VARCHAR(50),
    FaultReport           VARCHAR(50),
    Device                INTEGER                NOT NULL REFERENCES Device(DeviceID),
    Service               INTEGER                NOT NULL REFERENCES Service(ABN)
);


CREATE TABLE Department (
    Name                  VARCHAR(50)            PRIMARY KEY,
    Budget                FLOAT,
    employee              INTEGER
);
CREATE TABLE OfficeLocations(
    Location              VARCHAR(50),
    department            VARCHAR(50)            REFERENCES Department(name),
    PRIMARY KEY (Location, department)
);


CREATE TABLE AllocatedTo(
    MaxNumber             INTEGER,
    ModelNumber           FLOAT,
    Manufacturer          VARCHAR(50),
    department            VARCHAR(50)            REFERENCES department(name),
    FOREIGN KEY (ModelNumber, Manufacturer) REFERENCES Model(ModelNumber, Manufacturer),
    PRIMARY KEY (ModelNumber, Manufacturer, department)
);


CREATE TABLE WorksIn(
    Fraction              VARCHAR(50),
    department            VARCHAR(50)            REFERENCES Department(name),
    employee              INTEGER                REFERENCES Employee(EmpID),
    PRIMARY KEY (department, employee)
);


CREATE TABLE UsedBy(
    Device                INTEGER                 REFERENCES Device(DeviceID),
    employee              INTEGER                 REFERENCES employee(EmpID),
    PRIMARY KEY (Device, employee)
);


