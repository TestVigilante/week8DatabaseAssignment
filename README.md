# 🏥 Clinic Booking System - MySQL Project

## 📌 Project Title

**Clinic Booking System - MySQL Database Project**

---

## 📖 Description

The **Clinic Booking System** is a relational database designed to manage the key operations of a clinic. It allows administrators to store and retrieve information about doctors, patients, appointments, treatments, and payments efficiently. This project demonstrates the use of SQL in modeling real-world relationships with appropriate constraints, normalization, and sample data specific to a Kenyan context.

---

## ⚙️ Features

- Manage doctors' details and specializations.
- Register and manage patient records.
- Book and track appointments.
- Record treatment information and prescribed medications.
- Record payments for each treatment using different methods.

---

## 🛠 How to Run / Setup the Project

### ✅ Prerequisites

- MySQL Server (8.0+ recommended)
- MySQL Workbench or any MySQL-compatible client

---

### 📥 Steps to Import the Database

#### 🔹 Option 1: Using MySQL Workbench (Graphical Interface)

1. **Open MySQL Workbench**
2. Go to **File > Open SQL Script**
3. Select **`clinic_booking_system.sql`**
4. Click the **Execute** button (⚡) to run the script

#### 🔹 Option 2: Using MySQL Command Line

```bash
mysql -u your_username -p -e "CREATE DATABASE clinic_db;"
mysql -u your_username -p clinic_db < clinic_booking_system.sql
