<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Edit User</h1>
<form:form method="post" action="" modelAttribute="user">
	<table>
		<tr>
			<td>Name :</td>
			<td><form:input path="name" /></td>
		</tr>
		<tr>
			<td>Email :</td>
			<td><form:input path="email" /></td>
		</tr>
		<tr>
			<td>Password :</td>
			<td><form:input path="password" /></td>
		</tr>
		<tr>
			<td>Sex :</td>
			<td>
				<form:radiobutton path="sex" value="Male" />Male 
				<form:radiobutton path="sex" value="Female" />Female
			</td>
		</tr>
		<tr>
			<td>Country :</td>
			<td>
				<form:select path="country">  
        			<form:option value="Vietnam" label="Vietnam"/>  
        			<form:option value="United States" label="United States"/>  
        			<form:option value="Japan" label="Japan"/>  
        			<form:option value="India" label="India"/>  
        			<form:option value="Other" label="Other"/>  
        		</form:select>  
			</td>
		</tr>
		<tr>
			<td>Role :</td>
			<td>
				<form:select path="role">  
        			<form:option value="ROLE_USER" label="User"/>  
        			<form:option value="ROLE_ADMIN" label="Administrator"/>
        		</form:select>  
			</td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Save" /></td>
		</tr>
	</table>
</form:form>
