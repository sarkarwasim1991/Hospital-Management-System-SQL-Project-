-- Insert Patients
INSERT INTO Patients (name, age, gender, contact_number) VALUES
('Rahul Sharma', 32, 'Male', '9876543210'),
('Priya Mehta', 28, 'Female', '9876543211'),
('Amit Verma', 45, 'Male', '9876543212'),
('Sneha Kapoor', 19, 'Female', '9876543213'),
('Arjun Singh', 65, 'Male', '9876543214');

-- Insert Doctors
INSERT INTO Doctors (name, specialization, experience_years, contact_number) VALUES
('Dr. Ramesh Gupta', 'Cardiology', 15, '9876500010'),
('Dr. Anjali Nair', 'Dermatology', 10, '9876500011'),
('Dr. Mohan Lal', 'Orthopedics', 20, '9876500012'),
('Dr. Kavita Rao', 'Pediatrics', 8, '9876500013'),
('Dr. Sameer Khan', 'Neurology', 12, '9876500014');

-- Insert Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2025-09-01', 'Completed'),
(2, 2, '2025-09-02', 'Scheduled'),
(3, 3, '2025-09-03', 'Cancelled'),
(4, 4, '2025-09-04', 'Completed'),
(5, 5, '2025-09-05', 'Scheduled');

-- Insert Treatments
INSERT INTO Treatments (appointment_id, description, cost) VALUES
(1, 'ECG Test', 2000.00),
(1, 'Blood Pressure Monitoring', 500.00),
(2, 'Skin Allergy Test', 1500.00),
(4, 'Child Vaccination', 1000.00),
(5, 'MRI Scan', 7000.00);

-- Insert Billing
INSERT INTO Billing (patient_id, total_amount, payment_status, bill_date) VALUES
(1, 2500.00, 'Paid', '2025-09-01'),
(2, 1500.00, 'Pending', '2025-09-02'),
(3, 0.00, 'Unpaid', '2025-09-03'),
(4, 1000.00, 'Paid', '2025-09-04'),
(5, 7000.00, 'Pending', '2025-09-05');
