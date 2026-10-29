# nurbolat-djumadilov-student-api

Student CRUD REST API (Spring Boot + PostgreSQL).

Author: Nurbolat Djumadilov, group IT2-2313, IITU

## Endpoints

| Method | URL                 | Description        |
|--------|---------------------|--------------------|
| GET    | /api/students       | get all students   |
| GET    | /api/students/{id}  | get student by id  |
| POST   | /api/students       | create student     |
| PUT    | /api/students/{id}  | update student     |
| DELETE | /api/students/{id}  | delete student     |

## Change by Nurbolat Djumadilov (feature/nurbolat-djumadilov-crud)

Added UPDATE and DELETE operations and a proper 404 response
when a student with the given id does not exist.

Status: documented by Nurbolat Djumadilov (docs branch)
