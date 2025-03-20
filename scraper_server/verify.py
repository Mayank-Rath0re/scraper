import csv

filename = input()
writeData  = []
file = open(f"results/{filename}")
csv_reader = csv.reader(file)
for i in csv_reader:
  if i[-1]=="":
    continue
  writeData.append(i)
file.close()

file = open(f"results/{filename}",'w',newline='')
csv_writer = csv.writer(file)
csv_writer.writerows(writeData)
file.close()

