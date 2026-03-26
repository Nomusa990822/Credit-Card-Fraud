<div align="center">

# Credit Card Fraud Detection — EDA

### Exploratory Data Analysis & Fraud Behavioral Profiling

![Python](https://img.shields.io/badge/Python-3.x-blue?style=for-the-badge&logo=python)
![Pandas](https://img.shields.io/badge/Pandas-EDA-150458?style=for-the-badge&logo=pandas)
![Matplotlib](https://img.shields.io/badge/Matplotlib-Visualization-orange?style=for-the-badge)
![Seaborn](https://img.shields.io/badge/Seaborn-Statistical%20Plots-4C72B0?style=for-the-badge)
![LaTeX](https://img.shields.io/badge/LaTeX-Report-008080?style=for-the-badge&logo=latex)
![Status](https://img.shields.io/badge/Project-Active-success?style=for-the-badge)

---

**Project 1 Complete** | **Project 2 In Progress (ML Modeling)**

</div>

---

# Overview

This project presents a **deep exploratory data analysis (EDA)** of credit card transactions to uncover **fraud patterns, behavioral trends, and key risk indicators**.

Instead of jumping straight into machine learning, this phase focuses on:

- Understanding fraud behavior
- Identifying high-risk patterns
- Engineering meaningful features
- Building a strong foundation for modeling  

---

# Objectives

- Analyze fraud distribution and class imbalance  
- Identify temporal fraud patterns (hour, day, night)  
- Explore transaction behavior (amount & category)  
- Study demographic influence (age)  
- Perform fraud-only profiling  
- Evaluate feature relationships via correlation  

---

# Key Insights

<div align="center">

| Insight | Finding |
|--------|--------|
| Time | Fraud is **significantly higher at late night** |
| Day | Fraud peaks on **Thursday & Friday** |
| Amount | Fraudulent transactions are **higher in value** |
| Category | Online & POS transactions are **high-risk** |
| Demographics | Age has **limited predictive power** |
| Features | Weak correlations → **non-linear modeling needed** |

</div>

---

# Visual Insights

### Temporal Patterns
- Day vs Night Fraud
- Fraud by Day of Week

### Demographics
- Age Distribution
- Age vs Fraud
- Fraud Rate by Age Band

### Transaction Behavior
- Fraud Amount Distribution
- Top Fraud Categories

### Feature Relationships
- Correlation Heatmap
- Top Features vs Fraud

---

# Project Structure

```bash
Credit-Card-Fraud-EDA/
│
├── reports/
│   └── EDA/
│       ├── eda.tex
│       └── figures/
│           ├── age_band.jpg
│           ├── age_boxplot.jpg
│           ├── age_distribution.jpg
│           ├── categories.jpg
│           ├── day_of_week.jpg
│           ├── day_vs_night.jpg
│           ├── fraud_amount.jpg
│           ├── heatmap.jpg
│           └── top_features.jpg
│
├── notebooks/
│   └── credit_card_fraud_eda.ipynb
│
└── README.md
```

---

# Academic Report

This project includes a LaTeX IEEE-style report, featuring:
- Abstract
- Introduction
- Methodology
- Results
- Discussion
- Limitations
- Modeling Implications
- Conclusion

_Designed to match research + university-level standards_

---

# Tech Stack

<div align="center">

| Category | Tools |
|----------|-------|
| Language | Python |
| Data |Pandas, NumPy |
| Visualization | Matplotlib, Seaborn|
| Environment | Jupyter / Kaggle |
| Reporting | LaTeX |
| Version Control | GitHub |

</div>

---

# Current Status

## Project 1 — EDA (Completed)
- Full data exploration
- Fraud behavioral insights
- Feature engineering groundwork
- Academic report

## Project 2 — Machine Learning (In Progress)

Building on EDA insights:
- Logistic Regression
- Random Forest
- Class imbalance handling (SMOTE)
- Model evaluation (Precision, Recall, F1)
- ROC-AUC & threshold tuning

_This is where prediction meets insight_

---

# Why This Project Matters

Fraud detection is not just a modeling problem — it is a behavioral understanding problem.

**This project demonstrates:**
- Strong analytical thinking
- Real-world problem solving
- Data storytelling
- Research-level reporting
- End-to-end data science workflow

---

# Final Takeaway

Fraudulent transactions are more likely to be:
- Late-night
- High-value
- Category-specific
- Behavior-driven

**Meaning:** Fraud detection requires context, not just features

---

# Author

**Nomusa Shongwe**
_Data Science | Machine Learning | Engineering_
Building projects that combine analysis, systems thinking, and real-world impact


# If You Like This Project
Star the repo, Fork it or use it as inspiration.

---

Project 2 coming soon — where insights turn into predictions.
```
