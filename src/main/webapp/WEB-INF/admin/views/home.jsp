<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table border="1" width="90%">
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Email</th>
		<th>Password</th>
		<th>Sex</th>
		<th>Country</th>
		<th>Role</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>

	
	<c:forEach var="user" items="${list}">
		<tr>
			<td>${user.id}</td>
			<td>${user.name}</td>
			<td>${user.email}</td>
			<td>${user.password}</td>
			<td>${user.sex}</td>
			<td>${user.country}</td>
			<td>${user.role}</td>
			<td><a href="<c:url value="/admin/editUser/"/>${user.id}">Edit</a></td>
			<td><a href="<c:url value="/admin/deleteUser/"/>${user.id}">Delete</a></td>
		</tr>
	</c:forEach>
	
</table>
<br>
<a href="<c:url value="/admin/addUser/"/>">Add New User</a>