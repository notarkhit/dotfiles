# Data structures in python
---

## Tuple
- colletion of elements
- immutable (elements can't be changed)
- [lists are mutable]
- syntax 

### tuple syntax
```python
thisTuple = ()
```

### tuple types

```python
# tuple with numerical vals
nums = (12, 32, 34)

# string tuple
strTuple = ('hello','world','OwO')

names = ()
# empty tuple
```

## tuple unpacking
- tuple unpacking is usedd to get the individual elements of a tuple.

```python

tupleOne =(10,'john','stoned')

tupleOne[1]

a,b,c = tupleOne

```

## conversions

- lists and tuples can be converted interchangably

```python
toopal = (1, 2, 3, 4)

leesht = toopal

leesht = [1, 'hello', 2, 'bye']

toopal = leesht

# and vice versa
```

## Dictionary

- ordering of elements is arbitrary
- it's stored in alphabetical order
- uses key: value pairs
- binary search
- elements can be accessed by using keys
- dictionaries are mutable

```python

location = {
    (23.4, 42.5):'contonment front gate', 
    (23.9, 23.4):'contonment back gate', 
}

```

- to add new elements in a dictionary
```python

location[(21.32, 46.67): 'bull street']

```
## set 

- unordered collection of elements
- like a python dictionary without keys
- order doesnt matter 
```python
setA = {1,2,3,4}
setB = {3,2,1,4}
setaA == setB
```

- '<' can be used to check subset
- '<=' can be used to check proper subset
- '>' can be used to check superset

```python
2 in setA
#True

2 < a
2<= a
#True
```
---

## set operations

- union '|' operator
- intersection '&' operator
- difference '-' operator
- symmetric difference '^' operator

---
