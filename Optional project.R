



install.packages("devtools")
devtools::install_github("jhudsl/collegeIncome")
library(collegeIncome)
data(college)
devtools::install_github("jhudsl/matahari")
library(matahari)
dance_start(value = FALSE, contents = FALSE)
str(college)
summary(college)
library(dplyr)
income_by_category <- college %>%
  group_by(major_category) %>%
  summarize(mean_income = mean(median, na.rm = TRUE), 
            median_income = median(median, na.rm = TRUE))

print(income_by_category)


library(ggplot2)
ggplot(college, aes(x = major_category, y = median)) +
  geom_boxplot() +
  labs(title = "Income distribution by Major Category", x = "Major Category", y = "Median Income") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


anova_result <- aov(median ~ major_category, data = college)
summary(anova_result)

# Alternatively, if data is not normal:
kruskal_test <- kruskal.test(median ~ major_category, data = college)
print(kruskal_test)



dance_save("~/college_major_analysis.rds")
dance_stop()



