clear all

log using emp2.log

cd "C:\Users\dperalt1\Documents\Friday Lab Materials"

*Empirical Project 2 

*Question 1 
* Selection bias is the reason why a simple comparison of test scores between small and large class sizes would not measure the causal effect of class sizes. Meaning, students are not randomly selected to be in either small or large classes, more often than not it boils down to systemic differences such as parental income to determine what class a student ends up in. In addition, class sizes may differ in terms of classroom resources, teacher quality, student intellect. Due to the inherent advantages of a smaller classroom, the comparison is biased upward relative to the causal effect. A better way to measure the causal effect would be a controlled or quasi experiment. 

*Question 1a
*By employing a randomized controlled trial, the Tennessee STAR experiment was able to overcome the issue of selection bias. Participants in this study were randomly allocated to one of three groups: regular courses (22–25 students), small classes (13–17 students), or regular classes with a teacher's assistant. Any differences in test scores might be ascribed to class size rather than other contributing factors because of random assignment, which equally distributes differences in student backgrounds, instructor caliber, and school resources among groups.

*Question 2a
*A data visualization method that helps show the link between two variables while lowering noise in dispersed data is the binned scatter plot. Observations are averaged inside each bin based on a predictor variable rather than plotting individual data points. On the graph, the averages are then displayed as lines or points. This facilitates the identification of patterns in the data, particularly when dealing with huge datasets or erratic observations.

*Question 2b
use grade5.dta

ssc install binscatter, replace
binscatter class school_enrollment if inrange(school_enrollment,20,60), rd (40.5) discrete line(lfit)

*Question 2c
ssc install binscatter, replace
binscatter avgverb school_enrollment if inrange(school_enrollment,20,60), rd (40.5) discrete line (lfit)

*Question 2d
*Percent of disadvantaged students 
binscatter disadvantaged school_enrollment if inrange(school_enrollment,20,60), rd (40.5) discrete line (lfit)

*Percent Religious Schools 
binscatter religious school_enrollment if inrange(school_enrollment,20,60), rd(40.5) discrete line(lfit)

*Percent Female Students
binscatter female school_enrollment if inrange(school_enrollment,20,60), rd(40.5) discrete line(lfit)

*Question 2e
collapse (mean) school_enrollment, by (schlcode) 
twoway (histogram school_enrollment if inrange(school_enrollment,20,60), discrete frequency), xline(40.5)

*Question 3 
use grade5.dta, clear

gen above40 = 0 
replace above40 = 1 if school_enrollment > 40
gen x = school_enrollment - 40
gen x_above40 = x*above40

reg class above40 x x_above40 if inrange(school_enrollment,0,80), cluster (schlcode)
reg avgmath above40 x x_above40 if inrange(school_enrollment,0,80), cluster (schlcode)
reg avgverb above40 x_above40 if inrange(school_enrollment,0,80), cluster (schlcode)

*The class size clearly discontinues at the 40-student enrollment level, according to the regression results. In particular, class size decreases by about 11 students when school enrollment surpasses 40. Class size rises with enrollment at a rate of 0.67 students for every extra student enrolled below 40, but this link becomes less pronounced after 40. This implies that a policy action, like dividing classrooms or adding teachers, is probably triggered when the 40-student threshold is reached, resulting in decreased class sizes. Overall, this discontinuity lends credence to the notion that, most likely in accordance with an administrative guideline or policy, class size reductions are implemented once enrollment surpasses 40 students.

*Question 4
*A regression discontinuity design's identification assumption is that, in the absence of treatment, schools that are just above and below the 40-student enrollment threshold would be comparable in all pertinent ways. This guarantees that any discontinuity at the threshold that is seen may be ascribed to class size rather than variations in elements like school type or student demographics. A detailed analysis of the graph, including the percentage of poor kids, the percentage of religious schools, and the number of female pupils around the threshold, can help us determine whether this assumption is true. There is no compelling evidence of systematic variations in local features around the 40-student level because the graphs do not exhibit significant leaps. This implies that any observed discontinuity in test scores is probably due to changes in class size rather than other causes, and thus the RD assumption at local comparability is fair. Minor differences should still be recognized as possible sources of bias, though.

*Question 5
*According to Angrist and Lavy (1999), the class size rule states that schools should divide classes once enrollment exceeds 40 students, leading to theoretical class size drops of 20. If all schools strictly followed this rule we would expect an average increase of 0.67 students per additional enrolled student just above 40 due to splitting classes at the threshold. However, the actual change in class size observed in data is less than this expected drop. This occurs because some schools do not strictly enforce this rule: some do not split classes once enrollment exceeds 40 students; others have policies like flexible teacher assignments that prevent strict adherence to class size rules; or there are external constraints that prevent schools from reducing class sizes as prescribed by theoretical rules. As a result, while there is evidence that crossing the enrollment threshold leads to smaller class sizes on average (as predicted by the rule), it is smaller than the expected student decrease predicted by the rule.

*Question 6
*Based on the regression discontinuity estimates, reducing class size from 40 to 35 students is expected to improve average math scores by approximately 1.55 points and verbal scores by about 1.20 points. These predictions are based on the observed test score improvements at the 40-student enrollment threshold, where class size increases by 11 students and test scores decrease accordingly. We calculate the per-student effect by dividing the RD estimate of test score changes by the 11-student class size jump, and then scale that to a 5-student reduction.

*Change in class size at the threshold (above40 coefficient): -11.00 students
*Change in math score at the threshold (above40 coefficient): +3.43 points
*Change in verbal score at the threshold (above40 coefficient): +2.63 points

*Math score per-student effect: 3.43 / 11 = 0.31 points
*Verbal score per-student effect: 2.63 / 11 = 0.24 points

*Per-student effect × 5 students = Total predicted score improvement

*Expected math score improvement: 0.31 × 5 = 1.55 points
*Expected verbal score improvement: 0.24 × 5 = 1.20 points

*Question 7
*No, I wouldn't feel comfortable predicting that the class size will drop from 40 to 35 students, just as I did when it went from 20 to 15. The reason for this is because not all class sizes may have a linear projected impact of class size on test scores. The predictions are most credible for changes around the 40-student threshold because the RD design employed previously expressly examined the impact of a class size reduction at that point. Reducing class size in smaller classrooms (from 20 to 15) may have a different or lower effect than the effect seen at the 40-student level if the link between class size and test results is nonlinear. In addition, because of things like teacher attentiveness already being high in smaller classes or falling marginal returns to class size reduction, the benefits of reducing class size may decrease as class sizes go smaller.

*Question 8
*There are two main reasons why the results may differ when comparing the estimations in question 6 with those from the Swedish data and the Tennessee STAR project. In order to eliminate selection bias and provide a clear causal estimate of the impact of class size on test scores, the Tennessee STAR experiment was first conducted as a randomized controlled trial, in which students were allocated at random to smaller or larger classes. Compared to my work, which is based on observational data and a regression discontinuity design, this experimental method probably provides more accurate estimates. Although the RD design is a powerful quasi-experimental technique, it depends on the potentially erroneous premise that schools that fall just above and below the class size barrier are comparable. Furthermore, these findings might not hold true in different contexts or educational institutions. Bigger, more varied populations are included in the Swedish and Tennessee STAR investigations, which also reflect bigger national contexts. Their findings might therefore be more broadly applicable to various school kinds and demographics. On the other hand, my research may not be as applicable to other situations or more significant class size reductions because it concentrates on schools that are close to a particular enrollment criteria.

*Question 9
*Class size does matter in the long run, regardless of the "fade out" effect described by Chetty et al. (2011). The study demonstrates that students from smaller Kindergarten classes still perform better later in life—they are more likely to enroll in college and earn higher salaries—even though the increase in test scores from smaller courses may diminish over time. This implies that early school experiences have an impact on future achievement that extends beyond test results. Even if kids' test scores eventually level off, smaller courses may help them gain long-term benefits like confidence and attention.

*Question 10
*Given the evidence above, I would encourage my hometown to reduce class size by hiring more teachers with the end goal of improving outcomes like income and college attendance. According to studies like Chetty et al. (2011), early classroom experiences can still result in significant increases later in life, even if test score benefits from smaller groups gradually diminish.

capture log close


