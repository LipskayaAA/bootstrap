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


<div th:fragment="newuser">
    <div class="card">
        <div class="card-header">
            <h4>Add new user</h4>
        </div>
        <div class="card-body">
            <form th:method="post" th:action="@{/admin}" th:object="${newUser}">

                <div class="form-group mx-auto" style="width: 250px;">
                    <h6 class="text-center"><strong>First name</strong></h6>
                    <input type="text" th:field="*{firstName}" class="form-control" placeholder="Имя" maxlength="45" required>
                </div>
                <br>
                <div class="form-group mx-auto" style="width: 250px;">
                    <h6 class="text-center"><strong>Last name</strong></h6>
                    <input type="text" th:field="*{lastName}" class="form-control" placeholder="Фамилия" maxlength="45" required>
                </div>
                <br>
                <div class="form-group mx-auto" style="width: 250px;">
                    <h6 class="text-center"><strong>Age</strong></h6>
                    <input type="number" th:field="*{age}" class="form-control" placeholder="Возраст" max="110" min="0" required>
                </div>
                <br>
                <div class="form-group mx-auto" style="width: 250px;">
                    <h6 class="text-center"><strong>Email</strong></h6>
                    <input type="text" th:field="*{email}" class="form-control" placeholder="Email" maxlength="45" required>
                </div>
                <br>
                <div class="form-group mx-auto" style="width: 250px;">
                    <h6 class="text-center"><strong>Password</strong></h6>
                    <input type="password" th:field="*{password}" class="form-control" placeholder="Пароль" maxlength="45" required>
                </div>
                <br>
                <div class="form-group mx-auto" style="width: 250px;">
                    <h6 class="text-center"><strong>Role</strong></h6>
                    <select name="roleNewUser" multiple class="form-control" size="2" required>
                        <option th:text="${roles.get(0).getName()}" th:value="${roles.get(0).getName()}"></option>
                        <option th:text="${roles.get(1).getName()}" th:value="${roles.get(1).getName()}"></option>
                    </select>
                </div>
                <br>
                <div class="form-group text-center mx-auto" style="width: 250px;">
                    <input type="submit" value="Add new user" class="btn btn-success btn-lg">
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>