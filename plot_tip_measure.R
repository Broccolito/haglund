library(ggplot2)
library(ggpubr)

load("tip_measure.rda")

plt1 = ggplot(data = tip_measure, aes(x = condition, y = tip_area)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_point(aes(fill = condition), color = "black", shape = 21, 
             position = position_dodge2(0.2), size = 2) + 
  labs(fill = "Condition") + 
  stat_compare_means(method = "t.test", comparisons = list(c("Control", "Diseased"))) + 
  xlab("") + 
  ylab("Tip Area (A.U.)") + 
  theme_pubr()

plt2 = ggplot(data = tip_measure, aes(x = condition, y = tip_height_difference)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_point(aes(fill = condition), color = "black", shape = 21, 
             position = position_dodge2(0.2), size = 2) + 
  labs(fill = "Condition") + 
  stat_compare_means(method = "t.test", comparisons = list(c("Control", "Diseased"))) + 
  xlab("") + 
  ylab("Tip Height Difference (A.U.)") + 
  theme_pubr()

plt3 = ggplot(data = tip_measure, aes(x = condition, y = tip_height)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_point(aes(fill = condition), color = "black", shape = 21, 
             position = position_dodge2(0.2), size = 2) + 
  labs(fill = "Condition") + 
  stat_compare_means(method = "t.test", comparisons = list(c("Control", "Diseased"))) + 
  xlab("") + 
  ylab("Tip Height (A.U.)") + 
  theme_pubr()

plt4 = ggplot(data = tip_measure, aes(x = condition, y = tip_width)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_point(aes(fill = condition), color = "black", shape = 21, 
             position = position_dodge2(0.2), size = 2) + 
  labs(fill = "Condition") + 
  stat_compare_means(method = "t.test", comparisons = list(c("Control", "Diseased"))) + 
  xlab("") + 
  ylab("Tip Width (A.U.)") + 
  theme_pubr()

ggsave(filename = "tip_area.png", plot = plt1, dpi = 1200, width = 4, height = 5)
ggsave(filename = "tip_height_difference.png", plot = plt2, dpi = 1200, width = 4, height = 5)
ggsave(filename = "tip_height.png", plot = plt3, dpi = 1200, width = 4, height = 5)
ggsave(filename = "tip_width.png", plot = plt4, dpi = 1200, width = 4, height = 5)
