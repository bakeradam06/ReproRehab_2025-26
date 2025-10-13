### Week 1 - Python exercises for ReproRehab week 1 assignment

# fun, not actually exercise 1: Hello, World!
print("Hello, World!")

#############################################
# real exercises, starting at 4. 1-3 are in the m 
# file within this folder
#############################################

# prompt 4:
# List Comprehensions (Python only):
# Create a list of squares of numbers from 1 to 10
# Given [[1,A], [2,B], [3,C]] return [[1,2,3], [A,B,C]]

# part 1
squares = [n**2 for n in range (1,11)] # list of squares from 1 to 10. keep in mind that i needed to include 11 here instead of stopping at 10, since python prefers this method. 
print(squares) # print results

# part 2
a = 'a'
b = 'b'
c = 'c'

let_and_num = [[1,a], [2,b], [3,c]]
y = [[item[0] for item in let_and_num],[item[1] for item in let_and_num]] # python starts indexing at 0, remember that! here, within brackets, you're printing item 0 in the index of item inside let_and_num, and then doing the same for item 1, which is the second entry. 
print(y)

# prompt 5:
# Dict Comprehensions (Python only):
# Create a dictionary mapping numbers 1-5 to their squares using key/value pairings
# Create a dictionary of of numbers 1-3, where each value is another dictionary mapping the number to its square and cube
# Answer: {1:{“sqaure”: 1; “cube”: 1}}

q = {'1','2','3','4','5'}
w = {'1','4'}




# prompt 6
# Sets (Python only):
# Turn a list [1, 2, 2, 3, 4, 4, 5] into {1, 2, 3, 4, 5} using a set
# Given a set {1, 2, 3}, check if 2 and 5 are in it
# From a list [1, 2, 3], generate all unique unordered pairs {(1, 2), (1, 3), (2, 3)} using sets.





##############################
# from pod meeting - 10/3/2025
##############################

# loops
word = "python"
for char in word:
    print(char)
    
# overall - while loop
number = 0
while number <11:
    print(number)
    number = number + 1 

# while loop with break
number = 0
while number <11:
    print(number)
    break  
number += 1

# while loop with else
number = 0
while number <11:
    print(number)
    number += 1
else:
    print("number not larger than 9 anymore")
    
# can also do a elif compared to a elseif in matlab
