# ============================================================
# Graduate Admissions Classification (Logistic Regression)
# Author: Chow Kai Xuan
# ============================================================

# -----------------------------
# 1) Load Dataset
# -----------------------------
# Ensure gradadmit.csv is in the same folder as this script

grad <- read.csv("gradadmit.csv", header = TRUE)

cat("\n===== Dataset Overview =====\n")
cat("Rows:", nrow(grad), " | Columns:", ncol(grad), "\n")
str(grad)

# Convert rank to categorical variable
grad$rank <- factor(grad$rank, levels = c(1, 2, 3, 4))

# -----------------------------
# 2) Train-Test Split (80/20)
# -----------------------------
set.seed(100)

n <- nrow(grad)
training_idx <- sample(1: nrow(grad), size=nrow(grad)*0.8)
train_data <- grad[training_idx, ]
test_data  <- grad[-training_idx, ]

# -----------------------------
# 3) Logistic Regression Model
# -----------------------------
logit_model <- glm(admit ~ gre + gpa + rank,
                   data = train_data,
                   family = binomial)

cat("\n===== Logistic Regression Summary =====\n")
print(summary(logit_model))

# -----------------------------
# 4) Odds Ratios (Interpretation)
# -----------------------------
cat("\n===== Odds Ratios =====\n")
odds_ratios <- exp(coef(logit_model))
print(round(odds_ratios, 4))

# -----------------------------
# 5) Prediction on Test Set
# -----------------------------
# Predicted probabilities
test_prob <- predict(logit_model,
                     newdata = test_data,
                     type = "response")

# Classification using threshold = 0.5
threshold <- 0.5
test_pred <- ifelse(test_prob >= threshold, 1, 0)

# -----------------------------
# 6) Confusion Matrix
# -----------------------------
cm <- table(Predicted = test_pred,
            Actual    = test_data$admit)

cat("\n===== Confusion Matrix (Threshold = 0.5) =====\n")
print(cm)

# -----------------------------
# 7) Model Accuracy
# -----------------------------
accuracy <- sum(diag(cm)) / sum(cm)

cat("\nTest Accuracy:", round(accuracy, 4), "\n")

cat("\nConclusion:\n")
cat("- Logistic regression estimates probability of admission.\n")
cat("- Coefficients interpreted via odds ratios.\n")
cat("- Model evaluated on unseen test data.\n")
