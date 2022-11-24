<input type="hidden" <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<input type="hidden" <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UsersTable</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div style="height: 100%;">
    <div th:replace="home :: navbar"></div>

    <div class="row no-gutters" style="height: 100%;">
        <div class="col-2 h-100">
            <br>
            <ul class="nav flex-column nav-pills" aria-orientation="vertical">
                <div sec:authorize="hasRole('ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" th:href="@{/admin}">Admin</a>
                    </li>
                </div>

                <div sec:authorize="hasRole('USER')">
                    <li class="nav-item">
                        <a class="nav-link active" th:href="@{/user}">User</a>
                    </li>
                </div>
            </ul>
        </div>
        <div class="col-10 bg-light px-md-5 h-100 d-inline-block">
            <br>
            <h1>User information-page</h1>
            <br>
            <div class="card">
                <div class="card-header">
                    <h4>About user</h4>
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">FirstName</th>
                            <th scope="col">LastName</th>
                            <th scope="col">Age</th>
                            <th scope="col">Email</th>
                            <th scope="col">Role</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
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
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>