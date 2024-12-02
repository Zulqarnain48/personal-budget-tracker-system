-- Create the PersonalBudget database
CREATE DATABASE PersonalBudget;
USE PersonalBudget;

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Income Table
CREATE TABLE Income (
    user_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    source VARCHAR(100),
    Income_date DATE NOT NULL,
    Description TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Budget Table
CREATE TABLE Budget (
    User_ID INT NOT NULL,
   Monthly_Budget DECIMAL(10, 2) NOT NULL,
    Budget_Date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Expense Table
CREATE TABLE Expense (
    User_ID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Expense_Date DATE NOT NULL,
    Description TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) 
);

-- Saving Table
CREATE TABLE Saving (
    User_ID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Saving_Date DATE,
    Goal TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Report Table
CREATE TABLE Report (
    User_ID INT NOT NULL,
    Report_Type VARCHAR(50) NOT NULL,
    General_Date DATE NOT NULL,
    Details TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);


 
 
 
 
 
 
 
 
 
 





