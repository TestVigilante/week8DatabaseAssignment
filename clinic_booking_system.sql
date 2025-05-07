create database week8;
use week8;
-- Doctors Table
create table Doctors (
    doctor_id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    specialization varchar(100),
    phone_number varchar(20) unique,
    email varchar(100) unique
);
-- Insert sample doctors
INSERT INTO Doctors (first_name, last_name, specialization, phone_number, email)
VALUES
('Mwangi', 'Kamau', 'Cardiologist', '+254701112233', 'mwangi.kamau@clinic.co.ke'),
('Achieng', 'Otieno', 'Dermatologist', '+254702223344', 'achieng.otieno@clinic.co.ke'),
('Njeri', 'Mbugua', 'Pediatrician', '+254703334455', 'njeri.mbugua@clinic.co.ke');

-- Patients Table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE
);
-- Insert sample patients
INSERT INTO Patients (first_name, last_name, date_of_birth, gender, phone_number, email)
VALUES
('Brian', 'Ouma', '1995-08-14', 'Male', '+254711223344', 'brian.ouma@gmail.com'),
('Faith', 'Wambui', '1989-11-30', 'Female', '+254722334455', 'faith.wambui@gmail.com'),
('Samuel', 'Mutua', '2000-02-20', 'Male', '+254733445566', 'samuel.mutua@gmail.com');

-- Appointments Table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
-- Insert sample appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, notes)
VALUES
(1, 1, '2025-05-10 10:30:00', 'Scheduled', 'Follow-up on high blood pressure.'),
(2, 2, '2025-05-09 14:00:00', 'Completed', 'Rash treatment consultation.'),
(3, 3, '2025-05-08 09:00:00', 'Completed', 'Routine child check-up.');

-- Treatments Table
CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    treatment_description TEXT NOT NULL,
    prescribed_medication TEXT,
    treatment_cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
-- Insert sample treatments
INSERT INTO Treatments (appointment_id, treatment_description, prescribed_medication, treatment_cost)
VALUES
(1, 'Blood pressure monitoring and medication review.', 'Amlodipine 5mg daily', 1500.00),
(2, 'Treated for contact dermatitis.', 'Hydrocortisone cream', 1000.00),
(3, 'Routine vaccination and health check.', 'Pentavalent vaccine', 2000.00);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    treatment_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('Cash', 'Card', 'Insurance') NOT NULL,
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);-- Insert sample payments
INSERT INTO Payments (treatment_id, payment_date, amount_paid, payment_method)
VALUES
(1, '2025-05-10', 1500.00, 'Card'),
(2, '2025-05-09', 1000.00, 'Cash'),
(3, '2025-05-08', 2000.00, 'Insurance');
