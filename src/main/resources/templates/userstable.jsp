<input type="hidden" <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<input type="hidden" <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UsersTable</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<div th:fragment="usertable">
    <div class="card">
        <div class="card-header">
            <h4>All users</h4>
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
                    <td><button type="button" class="btn btn-info" data-toggle="modal" th:data-target="'#editModal' + ${user.getId()}">
                        Edit</button></td>
                    <td><button type="button" class="btn btn-danger" data-toggle="modal" th:data-target="'#deleteModal' + ${user.getId()}">
                        Delete</button></td>

                    <div class="modal fade" th:id="'editModal' + ${user.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editUserLongTitle">Edit user</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form th:method="post" th:action="@{/admin}" th:object="${newUser}">
                                    <div class="modal-body">

                                        <input type="hidden" name="id"  id="id" th:value="${user.getId()}" readonly>

                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>ID</strong></h6>
                                            <input type="text" th:value="${user.getId()}" class="form-control" disabled>
                                        </div>
                                        <br>
                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>First name</strong></h6>
                                            <input type="text" name="firstName" th:value="${user.getFirstName()}" class="form-control" placeholder="Имя" maxlength="45" required>
                                        </div>
                                        <br>
                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>Last name</strong></h6>
                                            <input type="text" name="lastName" th:value="${user.getLastName()}" class="form-control" placeholder="Фамилия" maxlength="45" required>
                                        </div>
                                        <br>
                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>Age</strong></h6>
                                            <input type="number" name="age" th:value="${user.getAge()}" class="form-control" placeholder="Возраст" max="110" min="0" required>
                                        </div>
                                        <br>
                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>Email</strong></h6>
                                            <input type="text" name="email" th:value="${user.getEmail()}" class="form-control" placeholder="Email" maxlength="45" required>
                                        </div>
                                        <br>
                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>Password</strong></h6>
                                            <input type="password" th:field="*{password}" class="form-control" placeholder="Пароль" maxlength="45">
                                        </div>
                                        <br>
                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>Role</strong></h6>
                                            <select name="roleNewUser" multiple class="form-control" size="2">
                                                <option value="" selected hidden>Выберите роль</option>
                                                <option th:text="${roles.get(0).getName()}" th:value="${roles.get(0).getName()}"></option>
                                                <option th:text="${roles.get(1).getName()}" th:value="${roles.get(1).getName()}"></option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <input type="submit" value="Edit" class="btn btn-primary">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" th:id="'deleteModal' + ${user.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Delete user</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form th:method="post" th:action="@{/admin/delete}">
                                    <div class="modal-body">

                                        <input type="hidden" name="id" th:value="${user.getId()}" readonly>

                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>ID</strong></h6>
                                            <input type="text" th:value="${user.getId()}" class="form-control" disabled>
                                        </div>
                                        <br>
                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>First name</strong></h6>
                                            <input type="text" th:value="${user.getFirstName()}" class="form-control" disabled required>
                                        </div>
                                        <br>
                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>Last name</strong></h6>
                                            <input type="text" th:value="${user.getLastName()}" class="form-control" disabled required>
                                        </div>
                                        <br>
                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>Age</strong></h6>
                                            <input type="number" th:value="${user.getAge()}" class="form-control" disabled required>
                                        </div>
                                        <br>
                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>Email</strong></h6>
                                            <input type="text" th:value="${user.getEmail()}" class="form-control" disabled required>
                                        </div>
                                        <br>
                                        <div class="form-group mx-auto" style="width: 250px;">
                                            <h6 class="text-center"><strong>Role</strong></h6>
                                            <select multiple class="form-control" size="2" disabled>
                                                <option th:text="${roles.get(0).getName()}" th:value="${roles.get(0).getName()}"></option>
                                                <option th:text="${roles.get(1).getName()}" th:value="${roles.get(1).getName()}"></option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <input type="submit" value="Delete" class="btn btn-danger">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>