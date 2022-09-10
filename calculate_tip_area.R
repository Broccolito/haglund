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
  
  tip_measure = rbind.data.frame(tip_measure,
                                 tibble(
                                   subject_name,
                                   tip_area,
                                   tip_height_difference,
                                   tip_height,
                                   tip_width
                                 )
  )
  
}

tip_measure = tip_measure %>%
  mutate(id = subject_name) %>%
  select(-subject_name) %>%
  mutate(condition = ifelse(grepl(pattern = "CONTROL", id), "Control", "Diseased")) %>%
  select(id, condition, everything())

save(tip_measure, file = "tip_measure.rda")
