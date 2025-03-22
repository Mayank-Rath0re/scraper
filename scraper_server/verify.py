import csv

filename = input()
writeData  = []
try:
  file = open(f"results/{filename}")
  csv_reader = csv.reader(file)
  # Find email index
  email_index = 0
  for i in csv_reader:
    if i[31].strip() == "":
      continue
    writeData.append(i)
  file.close()

  file = open(f"results/{filename}",'w',newline='')
  csv_writer = csv.writer(file)
  csv_writer.writerows(writeData)
  file.close()

except FileNotFoundError:
  print("File Not Found")
