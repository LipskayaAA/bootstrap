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
<form th:method="post" th:action="@{/admin}" th:object="${user}">
    <input type="text" th:field="*{firstName}" placeholder="Имя" id="name" required>
    <input type="text" th:field="*{lastName}" placeholder="Фамилия" id="lastName" required>
    <input type="number" th:field="*{age}" placeholder="Возраст" id="age" required>
    <input type="text" th:field="*{email}" placeholder="Email" id="email" required>
    <input type="password" th:field="*{password}" placeholder="Пароль" id="password" required>
    <select name="roleNewUser">
        <option th:text="${roles.get(0).getName()}" th:value="${roles.get(0).getName()}"></option>
        <option th:text="${roles.get(1).getName()}" th:value="${roles.get(1).getName()}"></option>
    </select>
    <input type="submit" value="add User"></form>
</form>
</body>
</html>