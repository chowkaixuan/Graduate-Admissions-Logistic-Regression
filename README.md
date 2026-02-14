# Graduate Admissions Classification (Logistic Regression) — R

## Overview
This project predicts graduate admission outcomes using applicant academic features:
GRE score, GPA, and undergraduate institution rank.

We implement:
- Logistic Regression (Binary Classification)

## Dataset
The dataset used is `gradadmit.csv`.

It contains applicant information with:

- gre (Graduate Record Exam score)
- gpa (Undergraduate GPA)
- rank (Prestige of undergraduate institution: 1 = highest, 4 = lowest)
- admit (Admission outcome: 0 = No, 1 = Yes)

## Methodology

1. Train/Test Split
   - 80% training data
   - 20% test data

2. Model Implemented
   - Logistic regression using `glm(..., family = binomial)`

3. Model Evaluation
   - Confusion Matrix
   - Test Accuracy

## Results

The model estimates admission probabilities using the logistic (sigmoid) function
and classifies outcomes using a 0.5 decision threshold.

Performance is evaluated on unseen test data to assess generalization.

## Key Insights

- GRE and GPA positively influence admission probability.
- Institution rank significantly impacts admission odds relative to the baseline group.
- Logistic regression provides interpretable coefficients via odds ratios.
- Treating rank as a categorical variable ensures correct modeling assumptions.

## How to Run

Ensure `gradadmit.csv` is in the same directory as `analysis.R`.

Then run:

```
analysis.R
```

## Technologies Used

- R
- Base R (`glm`)
- Logistic Regression

## Mathematical Notes

For deeper understanding and derivation of logistic regression,
including the logit transformation and sigmoid function, see:

- [Logistic Regression Derivation](notes/Logistic_Regression.pdf)