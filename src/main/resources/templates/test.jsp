<td><form action="admin/update" method="get">
    <input type="hidden" name="id" th:value="${user.getId()}">
    <input type="submit" value="Edit"></form>



<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
    Edit
</button></td>


<td><form action="admin/delete" method="get">
    <input type="hidden" name="id" th:value="${user.getId()}">
    <input type="submit" class="btn btn-danger" value="delete"></form></td>

<div>
    <form action="admin/add" method="get">
        <input type="submit" value="new User"></form>
    </form>

</div>