library(dplyr)
library(purrr)
library(ggplot2)
library(ggpubr)
library(plotly)

load("haglund_data.rda")

d = d %>%
  split(.$id) %>%
  map(function(x){
    p5 = c(x$x[5], x$y[5])
    p6 = c(x$x[6], x$y[6])
    p7 = c(x$x[7], x$y[7])
    
    if(p6[1] < p7[1]){
      p_pivot1 = p6
      p_pivot2 = p7
    }else{
      p_pivot1 = p7
      p_pivot2 = p6
    }
    p_pivot = p_pivot1
    
    scale_x = 1/((p_pivot1[1] - p_pivot2[1])^2 + (p_pivot1[2] - p_pivot2[2])^2)^0.5
    scale_y = 1/((p_pivot2[1] - p5[1])^2 + (p_pivot2[2] - p5[2])^2)^0.5
    
    x$x = x$x - p_pivot[1]
    x$y = x$y - p_pivot[2]
    x$x = x$x*scale_x
    x$y = -x$y*scale_y
    x = x[-(1:3),]
    
    return(x)
  }) %>%
  reduce(rbind.data.frame)

save(d, file = "processed_haglund_data.rda")