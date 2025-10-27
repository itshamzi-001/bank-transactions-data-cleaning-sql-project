# 🏦 Bank Transactions Data Cleaning (MySQL Project)

## 📊 Project Overview
This project focuses on cleaning real-world financial transaction data using MySQL.  
It simulates real banking records with messy, inconsistent, and missing data.

### 🧹 Key Cleaning Steps
- Trimmed extra spaces in text fields  
- Standardized transaction types (Debit / Credit)  
- Fixed inconsistent date formats  
- Converted amount column to numeric  
- Handled missing `CardType` and `Amount`  
- Standardized country names  
- Removed duplicate transaction records  

### 💾 Files
| File | Description |
|------|--------------|
| `bank_transactions_dirty.csv` | Raw dataset before cleaning |
| `bank_data_cleaning.sql` | SQL cleaning queries |
| `README.md` | Project description and documentation |

### 🧠 Tools Used
- MySQL
- SQL Workbench
- Excel / CSV for data import

### 📈 Skills Demonstrated
- Data Cleaning & Transformation  
- SQL String, Date, and Numeric Functions  
- Data Quality Validation  
- Deduplication Techniques

---

## 🚀 How to Run
1. Create database:  
   ```sql
   CREATE DATABASE bank_data_project;
   USE bank_data_project;
