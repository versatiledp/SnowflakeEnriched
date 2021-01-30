
## To simulate the json load for snowflake, CSV file from source system is converted 
## to json using the python code below
## real life, json generated from source system will be ingested in data platform

import csv 
import json 
  
csvfile2019 = open("C:\\snowflake\\data\\rawdata\\effy2019.csv", "r")
jsonfile2019 = open( "C:\\snowflake\\data\\input\\effy2019_rv.json" , 'w') 
reader2019 = csv.DictReader(csvfile2019)
for row in reader2019:
    json.dump(row, jsonfile2019)
    jsonfile2019.write('\n')
csvfile2019.close()
jsonfile2019.close()

csvfile2018 = open("C:\\snowflake\\data\\rawdata\\effy2018_rv.csv", "r")
jsonfile2018 = open( "C:\\snowflake\\data\\input\\effy2018_rv.json" , 'w') 
reader2018 = csv.DictReader(csvfile2018)
for row in reader2018:
    json.dump(row, jsonfile2018)
    jsonfile2018.write('\n')
csvfile2018.close()
jsonfile2018.close()

csvfile2017 = open("C:\\snowflake\\data\\rawdata\\effy2017_rv.csv", "r")
jsonfile2017 = open( "C:\\snowflake\\data\\input\\effy2017_rv.json" , 'w') 
reader2017 = csv.DictReader(csvfile2017)
for row in reader2017:
    json.dump(row, jsonfile2017)
    jsonfile2017.write('\n')
csvfile2017.close()
jsonfile2017.close()