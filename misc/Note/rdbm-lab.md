# RDBMS LAB QUES 30-Jan-2025


STUDENT

| SRN |  Name |Subject |Marks |
|-----|-------|--------|------|
| 101 | Aryan | Maths  | 30   |
| 102 | Ajay  | English| 40   |
| 101 | Arun  | Hindi  | 50   |
| 103 | bhuvan|Kannada | 40   |

1. display the students who have scored more than 40 marks.

```sql
SELECT * FROM STUDENT WHERE MARKS > 40;
```
2. increase the marks by 10 for the students who have scored marks equal to 30.
```sql
UPDATE STUDENT SET MARKS = MARKS+10 WHERE MARKS = 30;
```
3. Increase the marks by 10% for the students who have scores 50 and above marks.
```sql
UPDATE STUDENT SET MARKS = MARKS + (MARKS*0.1) WHERE MARKS > 50;
```
4. Display the students who have subject maths and scored greater than 50 
```sql
SELECT * FROM STUDENT WHERE SUBJECT='Maths' AND MARKS>50
```
