# importing module
from pandas import *
 
# reading CSV file
data = read_csv("data.csv")
 
def Average(lst):
    return sum(lst) / len(lst)

# converting column data to list
division = data['DIVISION'].tolist()
kwh = data['KWH'].tolist()
cost = data['DOLLAREL'].tolist()

# size desired
k = 50
  
# using pop()
# to truncate list 
n = len(division)
for i in range(0, n - k ):
    division.pop()

# for n in range(len(division)):
#     if division[n] == 1 :
#         division[n] = "New England"
#     elif division[n] == 2:
#         division[n] = "Middle Atlantic"
#     elif division[n] == 3:
#         division[n] = "East North Central"
#     elif division[n] == 4:
#         division[n] = "West North Central"
#     elif division[n] == 5:
#         division[n] = "South Atlantic"
#     elif division[n] == 6:
#         division[n] = "East South Central"
#     elif division[n] == 7:
#         division[n] = "West South Central"
#     elif division[n] == 8:
#         division[n] = "Mountain North"
#     elif division[n] == 9:
#         division[n] = "Mountain South"
#     else:
#         division[n] = "Pacific"

n = len(kwh)
for i in range(0, n - k ):
    kwh.pop()

n = len(cost)
for i in range(0, n - k ):
    cost.pop()
 
twodlist = []
for i in range(len(division)):
    mylist = []
    mylist.append(division[i])
    mylist.append(kwh[i])
    twodlist.append(mylist)

# printing list data
print('division:', division)
print('kwh:', kwh)
print('cost:', cost)
print('final:', twodlist)
