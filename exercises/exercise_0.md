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

HospitalDoctor

HospitalDoctor
