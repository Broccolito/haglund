library(dplyr)
library(zoo)
library(rgeos)

load("processed_haglund_data.rda")

subject_names = unique(d$id)

tip_measure = vector()
for(subject_name in subject_names){
  
  d_case = filter(d, id == subject_name) %>%
    filter(index <= 36) %>%
    filter(index >= 15)
  
  x = d_case$x
  y = d_case$y
  case_poly = SpatialPointsDataFrame(coords = data.frame(x = x, y = y), data = d_case)
  case_poly = gConvexHull(case_poly)
  
  tip_area = gArea(case_poly)
  tip_height_difference = filter(d, id == subject_name, index == 14)$y - d_case$y[1]
  tip_height = diff(range(d_case$y))
  tip_width = diff(range(d_case$x))
  
  # Calculate pitch angle
  d_pitch = filter(d, id == subject_name) %>%
    filter(index %in% c(13, 90))
  p13 = filter(d_pitch, index == 13)
  p90 = filter(d_pitch, index == 90)
  pitch_angle = atan2(p13$x - p90$y, p13$y - p90$y) * (180/pi)
  
  # Calculate length ratio
  d_length_ratio = filter(d, id == subject_name) %>%
    filter(index %in% c(10, 14, 8, 11))
  p10 = filter(d_length_ratio, index == 10)
  p14 = filter(d_length_ratio, index == 14)
  p8 = filter(d_length_ratio, index == 8)
  p11 = filter(d_length_ratio, index == 11)
  l1 = ((p10$x - p14$x)^2 + (p10$y - p14$y)^2)^0.5
  l2 =  ((p8$x - p11$x)^2 + (p8$y - p11$y)^2)^0.5
  length_ratio = l1/l2
  
  tip_measure = rbind.data.frame(tip_measure,
                                 tibble(
                                   subject_name,
                                   tip_area,
                                   tip_height_difference,
                                   tip_height,
                                   tip_width,
                                   pitch_angle,
                                   length_ratio
                                 )
  )
  
}

tip_measure = tip_measure %>%
  mutate(id = subject_name) %>%
  select(-subject_name) %>%
  mutate(condition = ifelse(grepl(pattern = "CONTROL", id), "Control", "Diseased")) %>%
  select(id, condition, everything())

save(tip_measure, file = "tip_measure.rda")
