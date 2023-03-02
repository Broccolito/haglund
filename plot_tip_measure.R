library(ggplot2)
library(ggpubr)

load("tip_measure.rda")

plt1 = ggplot(data = tip_measure, aes(x = condition, y = tip_area)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_point(aes(fill = condition), color = "black", shape = 21, 
             position = position_dodge2(0.2), size = 2) + 
  labs(fill = "Condition") + 
  stat_compare_means(method = "t.test", 
                     comparisons = list(c("Control", "Diseased")),
                     symnum.args = list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1),
                                        symbols = c("****", "***", "**", "*", "NS"))) + 
  xlab("") + 
  ylab("Tip Area (A.U.)") + 
  theme_pubr()

plt2 = ggplot(data = tip_measure, aes(x = condition, y = tip_height)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_point(aes(fill = condition), color = "black", shape = 21, 
             position = position_dodge2(0.2), size = 2) + 
  labs(fill = "Condition") + 
  stat_compare_means(method = "t.test", 
                     comparisons = list(c("Control", "Diseased")),
                     symnum.args = list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1),
                                        symbols = c("****", "***", "**", "*", "NS"))) + 
  xlab("") + 
  ylab("Tip Height (A.U.)") + 
  theme_pubr()

plt3 = ggplot(data = tip_measure, aes(x = condition, y = tip_width)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_point(aes(fill = condition), color = "black", shape = 21, 
             position = position_dodge2(0.2), size = 2) + 
  labs(fill = "Condition") + 
  stat_compare_means(method = "t.test", 
                     comparisons = list(c("Control", "Diseased")),
                     symnum.args = list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1),
                                        symbols = c("****", "***", "**", "*", "NS"))) + 
  xlab("") + 
  ylab("Tip Width (A.U.)") + 
  theme_pubr()

plt4 = ggplot(data = tip_measure, aes(x = condition, y = pitch_angle)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_point(aes(fill = condition), color = "black", shape = 21, 
             position = position_dodge2(0.2), size = 2) + 
  labs(fill = "Condition") + 
  stat_compare_means(method = "t.test", 
                     comparisons = list(c("Control", "Diseased")),
                     symnum.args = list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1),
                                        symbols = c("****", "***", "**", "*", "NS"))) + 
  xlab("") + 
  ylab("Pitch Angle (Degree)") + 
  theme_pubr()

plt5 = ggplot(data = tip_measure, aes(x = condition, y = length_ratio)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_point(aes(fill = condition), color = "black", shape = 21, 
             position = position_dodge2(0.2), size = 2) + 
  labs(fill = "Condition") + 
  stat_compare_means(method = "t.test", 
                     comparisons = list(c("Control", "Diseased")),
                     symnum.args = list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1),
                                        symbols = c("****", "***", "**", "*", "NS"))) + 
  xlab("") + 
  ylab("Length Ratio (A.U.)") + 
  theme_pubr()

ggsave(filename = "figures/tip_area.png", plot = plt1, dpi = 1200, width = 4, height = 5)
ggsave(filename = "figures/tip_height.png", plot = plt2, dpi = 1200, width = 4, height = 5)
ggsave(filename = "figures/tip_width.png", plot = plt3, dpi = 1200, width = 4, height = 5)
ggsave(filename = "figures/pitch_angle.png", plot = plt4, dpi = 1200, width = 4, height = 5)
ggsave(filename = "figures/length_ratio.png", plot = plt5, dpi = 1200, width = 4, height = 5)
