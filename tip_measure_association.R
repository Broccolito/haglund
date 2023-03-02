library(dplyr)
library(data.table)
library(purrr)
library(readxl)
library(writexl)

library(ggplot2)
library(ggpubr)

load("tip_measure.rda")

glimpse(tip_measure)

plt1 = ggplot(data = tip_measure, aes(x = pitch_angle, y = tip_area)) + 
  geom_point(aes(fill = condition), color = "black", size = 3, shape = 21) + 
  geom_smooth(aes(color = condition), method = "lm") + 
  labs(fill = "") + 
  xlab("Pitch Angle (Degree)") +
  ylab("Tip Area (A.U.)") + 
  theme_pubr() + 
  theme(text = element_text(size = 15))


plt2 = ggplot(data = tip_measure, aes(x = pitch_angle, y = tip_height)) + 
  geom_point(aes(fill = condition), color = "black", size = 3, shape = 21) + 
  geom_smooth(aes(color = condition), method = "lm", formula = "y ~ x") + 
  labs(fill = "", color = "") + 
  xlab("Pitch Angle (Degree)") +
  ylab("Tip Height (A.U.)") + 
  theme_pubr() + 
  theme(text = element_text(size = 15))

plt3 = ggplot(data = tip_measure, aes(x = pitch_angle, y = tip_width)) + 
  geom_point(aes(fill = condition), color = "black", size = 3, shape = 21) + 
  geom_smooth(aes(color = condition), method = "lm") + 
  labs(fill = "") + 
  xlab("Pitch Angle (Degree)") +
  ylab("Tip Width (A.U.)") + 
  theme_pubr() + 
  theme(text = element_text(size = 15))


lm(data = filter(tip_measure, condition == "Control"), 
   formula = tip_height ~ pitch_angle) %>%
  summary()


# Call:
# lm(formula = tip_height ~ pitch_angle, data = filter(tip_measure, 
#     condition == "Control"))
# 
# Residuals:
#      Min       1Q   Median       3Q      Max 
# -0.06232 -0.01318 -0.00190  0.01814  0.05390 
# 
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 0.173544   0.034434   5.040 1.42e-05 ***
# pitch_angle 0.001369   0.001187   1.154    0.256    
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.03009 on 35 degrees of freedom
# Multiple R-squared:  0.03664,	Adjusted R-squared:  0.009115 
# F-statistic: 1.331 on 1 and 35 DF,  p-value: 0.2564


lm(data = filter(tip_measure, condition == "Diseased"), 
   formula = tip_height ~ pitch_angle) %>%
  summary()


# Call:
# lm(formula = tip_height ~ pitch_angle, data = filter(tip_measure, 
#     condition == "Diseased"))
# 
# Residuals:
#       Min        1Q    Median        3Q       Max 
# -0.179114 -0.040314 -0.005877  0.051817  0.158171 
# 
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  0.307435   0.054030   5.690 4.02e-07 ***
# pitch_angle -0.003835   0.001755  -2.185   0.0328 *  
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.07003 on 60 degrees of freedom
# Multiple R-squared:  0.07371,	Adjusted R-squared:  0.05827 
# F-statistic: 4.775 on 1 and 60 DF,  p-value: 0.0328

ggsave(filename = "tip_height_pitch_angle.png", plot = plt2, 
       dpi = 1200, height = 6, width = 6, device = "png")




