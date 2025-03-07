You have this json data, convert it into three tables: Hospital, Department and Doctor. Fill these tables with data. Do this manually and not programmatically.

{
"hospital": "Sjukhusstock",
"address": "Drottninggatan 3, Stockholm",
"departments": [
{
"name": "Kardiologi",
"doctors": [
{ "id": 1, "name": "Dr. Abra Abrahamson" },
{ "id": 2, "name": "Dr. Erika Eriksson" }
]
},
{
"name": "Neurologi",
"doctors": [{ "id": 3, "name": "Dr. Sven Svensson" }]
}
]
}

Approach

- identify entities
- identify relationships and cardinalities
- create conceptual ERD
- create tables

**Initial naive conceptual ERD**

<img src = "../Assets/Initial_conceptiual_model_ex1.png" >

**Inital tables**

Hospital

| Hospital_id | name         | address          |
| ----------- | ------------ | ---------------- |
| 1           | sjukhusstock | Drottninggatan 3 |

Department

| Hospital_id | name       |
| ----------- | ---------- |
| 1           | kardiologi |
| 2           | neurologi  |

Department

| Hospital_id | name                |
| ----------- | ------------------- |
| 1           | Dr. abra abrahamson |
| 2           | Dr. Erik Eriksson   |
| 3           | Dr. Sven Sevensson  |

Refined with bridge tables to reflect many-to-many relationships

<img src = "../Assets/conceptual_Hospital_ex0_1" width=500 >

HospitalDepartment

| Hospital_department_id | hospital_id | department_id |
| ---------------------- | ----------- | ------------- |
| 1                      | 1           | 1             |
| 2                      | 1           | 2             |


--
Entities:

**- Book**
-ISBN
-Name
-title
-author

<[NOTE]> ISBN is a unique number for a book, which could be used as a 'primary key', this will make it into a 'natural key'

**- Member**
-membership_id
-first_name
-last_name
-phone
-address
-email


**Borrowing**
- borrowing_id
- ISBN
- membership_id
- return_date
- borrow_date 

- A Member can have zero, one or several borrowings 
- A Borrowing can be made by one and only/ one member
- A Borrowing is linked to one and only one Book
- A Book can be in zero, one or more borrowings

Initial conceptual ERD
<img src = "../Assets/Book_ex_2.png" width=500 >

<br>
Replaced many-to-many with bridge table (composite entity)
<img src = "../Assets/Book_ex0_2_2.png" width=500 >