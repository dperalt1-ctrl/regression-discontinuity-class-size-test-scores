# regression-discontinuity-class-size-test-scores
# Do Smaller Classes Improve Test Scores? Evidence from a Regression Discontinuity Design

This project uses a **Regression Discontinuity Design (RDD)** to estimate the causal effect of class size on student achievement, using 5th-grade data from Israeli public schools (Angrist & Lavy, 1999). The analysis focuses on the **40-student enrollment threshold**, which creates a quasi-experimental break in class size according to Maimonides’ Rule.

**Tools:** Stata, binscatter, RD estimation, clustered standard errors

**Dataset:** `grade5.dta` (2,019 classes across 1,002 schools in 1991)  
**Outcome Variables:** math and verbal test scores  
**Treatment Variable:** class size  
**Running Variable:** school enrollment

---

## 📌 Research Questions

1. *Does reducing class size improve student test scores?*  
2. *Is there a visible discontinuity in class size at the 40-student enrollment threshold?*  
3. *Do student demographics evolve smoothly at the cutoff?*  
4. *How large is the causal effect of class size on learning outcomes?*

---

## 📈 Methods

| Component | Method Used |
|-----------|------------|
| Visualization | Binned scatter plots with `line(lfit)` |
| Causal Identification | Sharp RDD at 40-student cutoff |
| Estimation | `reg yvar above40 x x_above40, cluster(schlcode)` |
| Validity Check | Smoothness of covariates at the cutoff |
| Manipulation Check | Histogram of school enrollment |

Identification assumption: **Covariates must evolve smoothly at the cutoff and schools cannot precisely manipulate enrollment.**

---

## 📊 Outputs

| Output | Description |
|---------|------------|
| Class size binned scatter | Confirms discontinuity at enrollment = 40 |
| Math + verbal score binned scatters | Visual RDD of outcomes |
| Covariate smoothness plots | Religious share, female %, disadvantaged % |
| Histogram of school counts | No bunching around cutoff |
| RD regressions | Estimates with 95% CIs and clustered SEs |

---

## 🧠 Key Findings (Summary)

- There is a **clear discontinuity in class size** at the 40-student threshold.
- The resulting RDD shows that **smaller classes increase test scores**, consistent with Angrist & Lavy (1999).
- Covariates show **no meaningful jumps**, supporting the **RDD identification assumption**.
- The effect is smaller than a naïve comparison, which would be biased by sorting.

---

## 📂 Repo Structure

