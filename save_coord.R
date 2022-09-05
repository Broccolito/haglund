template = '
open("C:/Users/SimonsonLab/Desktop/Steps2Walk/Haglund/diseased/XXX.tif");
selectWindow("XXX.tif");
saveAs("XY Coordinates", "C:/Users/SimonsonLab/Desktop/Steps2Walk/Haglund/diseased/XXX.txt");
'

file_list = gsub(".tif","", list.files(path = "diseased/"))

for(f in file_list){
  cat(gsub(pattern = "XXX", f, template))
}
