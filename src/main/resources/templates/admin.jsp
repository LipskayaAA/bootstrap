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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<div th:replace="home :: navbar"></div>

<div class="row no-gutters">
    <div class="col-2">
        <br>
        <ul class="nav flex-column nav-pills" aria-orientation="vertical">
            <div sec:authorize="hasRole('ADMIN')">
                <li class="nav-item">
                    <a class="nav-link active" th:href="@{/admin}">Admin</a>
                </li>
            </div>

            <div sec:authorize="hasRole('USER')">
                <li class="nav-item">
                    <a class="nav-link" th:href="@{/user}">User</a>
                </li>
            </div>
        </ul>
    </div>
    <div class="col-10 bg-light px-md-5">
        <br>
        <h1>Admin panel</h1>
        <br>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="users-table" data-toggle="tab" href="#usersTable" role="tab" aria-controls="usersTable" aria-selected="true">Users Table</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="new-user" data-toggle="tab" href="#newUser" role="tab" aria-controls="newUser" aria-selected="false">New User</a>
            </li>

        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="usersTable" role="tabpanel" aria-labelledby="users-table">
                <div th:replace="userstable :: usertable"></div>
            </div>
            <div class="tab-pane fade" id="newUser" role="tabpanel" aria-labelledby="new-user">
                <div th:replace="newuser :: newuser"></div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>