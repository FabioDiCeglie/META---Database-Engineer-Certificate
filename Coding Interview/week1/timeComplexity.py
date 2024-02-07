# o(1)

# An array with 5 numbers
array = [0,1,2,3,4]

# retrieve the number found at index location 3
print(array[3])

# O(n)

# An array with 5 numbers
array = [0,1,2,3,4]

if 5 in array:
    print("five is alive")

# an array with 10 numbers
array = [0,1,2,3,4,6,7,8,9,10]

if 5 in array:
    print("five is still alive")

# O(log n)

array = [0,1,2,3,4,6,7,8,9,10]

print("##Step One")
print("Array")
print(array)
midpoint = int(len(array)/2)
print("the midpoint at step one is: " , array[midpoint])

print()

print("##Step Two")
array = array[:midpoint] # 6 is the midpoint of the array
print("Array")
print(array)
# running this shows the numbers left to check
# is 5 < 3
# no
# so discard the left hand side

# so the array is halved again
midpoint=int(len(array)/2)
print("the midpoint is: ",  array[midpoint])

print()
print("##Step Three")
array = array[midpoint:] # so the array is halved at the midpoint
print(array)
# check for the midpoint
midpoint=int(len(array)/2)
print("the midpoint is: " , array[midpoint])
# is 4 < 5
# yes look to the right

print()
print("##Step Four")
print(array[midpoint:])
# check for the midpoint
array = array[midpoint:] # so the array is halved at the midpoint
midpoint=int(len(array)/2)

print("##Step Five")
array = array[midpoint:]
print(array)
print("only one value to check and it is not 5")

arrayTest = [0, 1, 2, 3, 4, 6, 7, 8, 9, 10]
def binary_search(array, target):
    low = 0
    high = len(array) - 1

    while low <= high:
        mid = (low + high) // 2
        print(f"Checking middle element: {array[mid]}")
        if array[mid] == target:
            print("Target found!")
            return True
        elif array[mid] < target:
            print("Target is in the lower half of the array.")
            low = mid + 1
        else:
            print("Target is in the upper half of the array.")
            high = mid - 1

    print("Target not found!")
    return False

target = 5
print(f"Searching for target value: {target}")
if binary_search(arrayTest, target):
    print(f"{target} is still alive")
else:
    print(f"{target} is not alive")


# Searching for target value: 5
# Checking middle element: 4
# Target is in the upper half of the array.
# Checking middle element: 7
# Target is in the lower half of the array.
# Checking middle element: 6
# Target is in the lower half of the array.
# Checking middle element: 5
# Target found!
# 5 is still alive

# O(n^2)

new_array=[] # an array to hold all of the results
# array with five numbers
array = [0,1,2,3,4]
for i in range(len(array)): # the array has five values, so this is n=5
    for j in range(len(array)): # still the same array so n = 5
        new_array.append(i*j) # every computation made is stored here

print(len(new_array)) #how big is this new array ?
