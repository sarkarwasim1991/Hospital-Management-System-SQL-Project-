-- 1. List all patients with their assigned doctors
SELECT p.name AS patient_name, d.name AS doctor_name, d.specialization
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

-- 2. Count the number of appointments per doctor
SELECT d.name AS doctor_name, COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id
ORDER BY total_appointments DESC;

-- 3. Find patients who had more than 1 appointment
SELECT p.name, COUNT(a.appointment_id) AS appointment_count
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id
HAVING COUNT(a.appointment_id) > 1;

-- 4. Calculate total revenue generated per doctor
SELECT d.name AS doctor_name, SUM(t.cost) AS total_revenue
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
JOIN Treatments t ON a.appointment_id = t.appointment_id
GROUP BY d.doctor_id
ORDER BY total_revenue DESC;

-- 5. List all unpaid or pending bills with patient details
SELECT b.bill_id, p.name AS patient_name, b.total_amount, b.payment_status, b.bill_date
FROM Billing b
JOIN Patients p ON b.patient_id = p.patient_id
WHERE b.payment_status IN ('Unpaid', 'Pending');

-- 6. Find the average treatment cost per department (doctor specialization)
SELECT d.specialization, ROUND(AVG(t.cost), 2) AS avg_treatment_cost
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
JOIN Treatments t ON a.appointment_id = t.appointment_id
GROUP BY d.specialization;

-- 7. Show the top 3 most expensive treatments
SELECT description, cost
FROM Treatments
ORDER BY cost DESC
LIMIT 3;

-- 8. Find doctors who have no appointments scheduled
SELECT d.name AS doctor_name, d.specialization
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
WHERE a.appointment_id IS NULL;

-- 9. Show patients with their total billed amount
SELECT p.name AS patient_name, SUM(b.total_amount) AS total_billed
FROM Patients p
JOIN Billing b ON p.patient_id = b.patient_id
GROUP BY p.patient_id
ORDER BY total_billed DESC;

-- 10. Show appointment details along with treatment descriptions
SELECT a.appointment_id, p.name AS patient_name, d.name AS doctor_name,
       a.appointment_date, a.status, t.description, t.cost
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
LEFT JOIN Treatments t ON a.appointment_id = t.appointment_id;
