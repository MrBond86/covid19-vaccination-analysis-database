CREATE TABLE AgeGroup (
    ID       INTEGER PRIMARY KEY
                     NOT NULL,
    AgeGroup TEXT,
    Location TEXT,
    Month    INTEGER,
    Year     INTEGER
);

CREATE TABLE Country (
    Country_ID              INTEGER PRIMARY KEY AUTOINCREMENT,
    Country_Name            TEXT    NOT NULL,
    Total_Vaccination       INTEGER,
    People_Vaccinated       INTEGER,
    People_Fully_Vaccinated INTEGER,
    Total_Booster           INTEGER,
    Day                     INTEGER,
    Month                   INTEGER,
    Year                    INTEGER,
    Speed                   INTEGER
);


CREATE TABLE Source (
    Source_ID  INTEGER       PRIMARY KEY
                             NOT NULL,
    Source_Url VARCHAR (255),
    Country_ID INTEGER,
    Day        INTEGER,
    Month      INTEGER,
    Year       INTEGER,
    FOREIGN KEY (
        Country_ID
    )
    REFERENCES Country (Country_ID) 
);


CREATE TABLE State_Vaccination (
    State_ID                INTEGER NOT NULL
                                    UNIQUE,
    Country_ID                      REFERENCES Country (Country_ID),
    State_Name              TEXT,
    Total_Vaccinations      INTEGER,
    People_Fully_Vaccinated INTEGER,
    People_Vaccinated       INTEGER,
    Total_Booster           INTEGER,
    Day                     INTEGER,
    Month                   INTEGER,
    Year                    INTEGER
);

CREATE TABLE Vaccination (
    Vaccination_ID    INTEGER       PRIMARY KEY
                                    NOT NULL,
    Vaccine_Name      VARCHAR (255),
    People_Vaccinated INT,
    Day               INTEGER,
    Month             INTEGER,
    Year              INTEGER
);
