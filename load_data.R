library(dplyr)

control_files = list.files(path = "control/", pattern = ".txt")
diseased_files = list.files(path = "diseased/", pattern = ".txt")

meta_df = tibble(file_name = c(control_files, diseased_files),
                 condition = c(rep("Control", 40), rep("Diseased", 62)),
                 id = c(paste0("CONTROL",1:40), paste0("DISEASED",1:62)))

d_control = vector()
for(f in control_files){
  d = read.delim(paste0("control/", f), header = FALSE)
  names(d) = c("x", "y")
  d$index = seq(1,dim(d)[1])
  d$file_name = f
  d_control = rbind.data.frame(d, d_control)
}

d_diseased = vector()
for(f in diseased_files){
  d = read.delim(paste0("diseased/", f), header = FALSE)
  names(d) = c("x", "y")
  d$index = seq(1,dim(d)[1])
  d$file_name = f
  d_diseased = rbind.data.frame(d, d_diseased)
}

d = rbind.data.frame(
  d_control, d_diseased
) %>%
  left_join(meta_df, by = "file_name")

save(d, file = "haglund_data.rda")
