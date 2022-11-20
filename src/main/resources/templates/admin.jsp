<input type="hidden" <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<input type="hidden" <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UsersTable</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>

<div th:replace="logout :: logout"></div>

<div>
    <form action="admin/add" method="get">
        <input type="submit" value="new User"></form>
    </form>

</div>

<div>
    <table class="table table-dark table-striped">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">FirstName</th>
            <th scope="col">LastName</th>
            <th scope="col">Age</th>
            <th scope="col">Email</th>
            <th scope="col">Role</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <tr th:each="user : ${userList}">
            <td th:text="${user.getId()}"></td>
            <td th:text="${user.getFirstName()}"></td>
            <td th:text="${user.getLastName()}"></td>
            <td th:text="${user.getAge()}"></td>
            <td th:text="${user.getEmail()}"></td>
            <td>
                <div th:each="role : ${user.getRoles()}">
                    <div th:text="${role.getName()}"></div>
                </div>
            </td>
            <td><form action="admin/update" method="get">
                <input type="hidden" name="id" th:value="${user.getId()}">
                <input type="submit" value="Edit"></form>
            <td><form action="admin/delete" method="get">
                <input type="hidden" name="id" th:value="${user.getId()}">
                <input type="submit" value="delete"></form></td>

        </tr>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>