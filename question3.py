// SEQUENCES

# list [] tuple () 

# For mutable

# s[i] = y ------------- colors[1] = "yellow"
# s.copy() ------------- new_list = original.copy()
# s.append(x) ---------- nums = [1, 2]  ;  nums.append(3)
# s.extend(t) ---------- nums = [1, 2]  ;  nums.extend([3, 4])
# s.insert(i, x) ------- letters = ["a", "c"] ; letters.insert(1, "b")
# del s[i] ------------- tasks = ["eat", "sleep", "code"] ; del tasks[1]
# s.clear() ------------ data.clear()
# s.remove(x) ---------- pets.remove("dog")
# s.pop(i) ------------- stack.pop() defaults to -1
# s.reverse() ---------- vals = [1, 2, 3] ; vals.reverse()
# s.sort() ------------- scores.sort()

#s[i:j:k]
#i - 0 for +ve step      / -1 for -ve step
#j - length for +ve step / -(length + 1) for -ve step
# s[5:] s[:8] s[::5] s[7::-1] 

# concatenate : s1 + s2
# repetition : s * n
# s += t
# s *= n

# x in s :: T/F  x not in s :: T/F

# len(s)
# min(s)
# max(s)
# sum(s)
# sum(s, n)

# s.count(x)
# s.index(x)
# s.index(x, i)
# s.index(x, i, j)
# s.sorted(s)
# s.sorted(s, key = f)
# s.sorted(s, reverse = True)

# reversed(s)

# l.append(x)
# l.insert(i, x)
# del l
# del l[i]
# del l[i:j]
# del l[i:j:k]
# l.clear()
# l.remove(x)
# l.pop()
# l[i] = x, l[i:j]= x, l[i:j:k] = x

# l.copy()
# l.sort()
# l.reverse()

# STRINGS

'''
For immutable

# s[i]
# s[i:j:k]
# s1 + s2
# s * n
# s1 in s2
# len(s)
# s1.count(s2)
# s1.index(s2)
# min(s)
# max(s)
# sorted(s) 
# reversed(s)
'''

'''
# s.lower()
# s.upper()
# s.title()
# s.capitalize()
'''

# s.isspace()
# s.isupper()
# s.islower()
# s.isalpha()
# s.isdigit()
# s.isalum()

# s.spilt()
# s.split(sep)

# s.join(iterable)
# s.center(w)
# s.center(w, c)

# s.ljust(w)
# s.ljust(w, c)
# s.rjust(w)
# s.rjust(w, c)

# s.strip()
# s.strip(chars)

# s.lstrip()
# s.lstrip(chars)
# s.rstrip()
# s.rstrip(chars)

# s.startswith(prefix, i, j)
# s.endswidth(suffix, i, j)

# s.find(sub)  s.find(sub, i, j)

# s.replace(old, new)

# DICTIONARIES

# a = {key1:value1, key2:value2, key3:value3}
# b = dict(one=1, two=2, three=3)
# c = dict(zip(['one', 'two', 'three'], [1, 2, 3]))
# d = dict([('two', 2), ('one', 1), ('three', 3)])
# e = dict({'three':3, 'one':1, 'two':2})

# b = { 1 : {key1:value1, key2:value2, key3:value3},
#      2 : {key1:value1, key2:value2, key3:value3}
# }

# d[key] = value
# d.get(key) = value

# d.pop(key)

# d.popitem()

# d.update({'one':1, 'two':2})
# d.update([('one', 1), ('two', 2)])
# d.update(one=1 , two=2)

# del d[key]
# d.clear()

# d.keys()
# d.values()
# d.items()

# sorted(d)
# sorted(d.keys())
# sorted(d.values())
# sorted(d.items())

# list(reversed(a))
# list(reversed(a.keys())
# list(reversed(a.values()))
# list(reversed(a.items()))

# d.copy()

# len(d)

# key in d :: T/F

# for k in a.keys():
# for v in a_values():
# for k, v in a.items():

# SETS

# s = {value1, value2, value3}
# s = set([1, 2, 3])

# s.pop()
# s.add(element)
# s.update(iterable)
# s.remove(element)
# s.discard(element)
# s.clear()
# a.union(b)
# a.intersection(b)
# a.difference(b)
# a.symmetric_difference(b)

# sorted(a)
# list(s)
# iter(s)

# s.copy()
# len(s)

# a == b :: T/f
# a <= b :: T/F subset
# a < b  :: T/F
# a >= b :: T/F superset
# a > b  :: T/F

# CLASSES

# class Employee:
#   species = "Canis familaries"
#   def .__init__(self, name, age):
#      self.name = name
#      self.age = age
#   def descrition(self):
#      return f"{self.name} is {self.age}."

# Employee()

# emp = Employee('Name', 12)
# emp.name ; emp.age ; emp.species
# emp.age = 10

#class Parent:
#  hair_color = "brown"
#  speaks = ["English"]

#class Child(Parent):
#  super().__init__()
#  self.speaks.append("German")

#isinstance(Miles, Dog)
'''
class Book:
    def __init__(self, title, author, is_available):
        self.title = title
        self.author = author
        self.is_available = is_available

    def display_info(self):
        print(f"Title: {self.title} :: Author : {self.author} :: Is_available: {self.is_available}")

class Library():
    def __init__(self):
        self.book_list = []

    def add_book(self, book):
        self.book_list.append(book)

    def borrow_book(self, title):
        for book in self.book_list:
            if book.title == title:
                if book.is_available == "YES":
                    book.is_available = "NO"

    def return_book(self, title):
        for book in self.book_list:
            if book.title == title:
                if book.is_available == "NO":
                    book.is_available = "YES"

    def display_available_books(self):
        print("----------------------------------")
        print("List of Available Books")
        print("----------------------------------")
        print()
        for book in self.book_list:
            if book.is_available == "YES":
                print(f"Title: {book.title} :: Author : {book.author}")

        print()

book1 = Book("Harry Potter: Philospher's Stone", "JK Rowling", "YES")
book2 = Book("Harry Potter: Chamber of Secrets", "JK Rowling", "YES")
book3 = Book("Harry Potter: Prisoner of Azkaban", "JK Rowling", "YES")
book4 = Book("Harry Potter: Goblet of Fire", "JK Rowling", "YES")
book5 = Book("Harry Potter: Order of Phoenix", "JK Rowling", "YES")
book6 = Book("Harry Potter: Half Blood Prince", "JK Rowling", "YES")
book7 = Book("Harry Potter: Deathly Hallows", "JK Rowling", "YES")


library1 = Library()

library1.add_book(book1)
library1.add_book(book2)
library1.add_book(book3)
library1.add_book(book4)
library1.add_book(book5)
library1.add_book(book6)
library1.add_book(book7)

library1.display_available_books()

library1.borrow_book(book2.title)
library1.borrow_book(book3.title)

library1.display_available_books()

library1.return_book(book3.title)

library1.display_available_books()

'''

'''
import re

def is_valid_phone(phone_number1):
    pattern = r'^[0-9]{10}$'
    if re.match(pattern, phone_number1):
        return True
    else:
        return False

def find_p_words(text):
    pattern = r'\b[pP][a-zA-Z]{2,}\b'
    matches = re.findall(pattern, text)
    return matches

def find_dates(text):
    date_pattern = r'\d{2}-\d{2}-\d{4}'

    match = re.search(date_pattern, text)

    if match:
        print(f"Full match: {match.group()}")
    else:
        print("No date found in the specified format.")

def is_strong_password(password):
    # Regex Breakdown:
    # ^                         Start of string
    # (?!.*\s)                  Negative Lookahead: Ensure NO spaces are present
    # (?=.*[A-Z])               Lookahead: at least one uppercase letter
    # (?=.*[a-z])               Lookahead: at least one lowercase letter
    # (?=.*\d)                  Lookahead: at least one digit
    # (?=.*[!@#$%^&*(),.?":{}|<>]) Lookahead: at least one special character
    # .{8,}                     Actual match: any character, at least 8 times
    # $                         End of string

    pattern = r"^(?!.*\s)(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?\":{}|<>]).{8,}$"

    if re.match(pattern, password):
        return True
    return False

def remove_punctuation(text):
    # Matches , . ! or ?
    return re.sub(r'[,.!?]', '', text)
    
'''




  

     
