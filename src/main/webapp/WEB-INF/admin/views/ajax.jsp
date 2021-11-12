<h1>Add New User</h1>
<form action="api/addUser" method="post">
	<table>
		<tr>
			<td>Name :</td>
			<td><input id="name" name="name" type="text" value="" /></td>
		</tr>
		<tr>
			<td>Email :</td>
			<td><input id="email" name="email" type="text" value="" /></td>
		</tr>
		<tr>
			<td>Password :</td>
			<td><input id="password" name="password" type="text" value="" /></td>
		</tr>
		<tr>
			<td>Sex :</td>
			<td><input id="sex" name="sex" type="radio" value="Male" />Male
				<input id="sex" name="sex" type="radio" value="Female" />Female</td>
		</tr>
		<tr>
			<td>Country :</td>
			<td><select id="country" name="country">
					<option value="Vietnam">Vietnam</option>
					<option value="United States">United States</option>
					<option value="Japan">Japan</option>
					<option value="India">India</option>
					<option value="Other">Other</option>
			</select></td>
		</tr>
		<tr>
			<td>Role :</td>
			<td><select id="role" name="role">
					<option value="ROLE_USER" selected="selected">User</option>
					<option value="ROLE_ADMIN">Administrator</option>
			</select></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Save" /></td>
		</tr>
	</table>
</form>

<p>
<table id="dataTable" border="1" width="90%"></table>
</p>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function loadTable(response){
	var html = "<tr><th>Id</th><th>Name</th><th>Email</th><th>Password</th><th>Sex</th><th>Country</th><th>Role</th><th>Edit</th><th>Delete</th></tr>";
    for(var i = 0; i < response.length; i++){
    	html += "<tr>";
    	for(var att in response[i]){
    		dataCell = response[i][att];
    		html += "<td>"+dataCell+"</td>";
    		if(att == "id"){
    			var key = dataCell;
    		}
    	}
    	html += "<td><a href=editUser/"+key+">Edit</a></td><td><a href=deleteUser/"+key+">Delete</a></td></tr>";
    }
    $("#dataTable").html(html);
}

$(document).ready(function() {
	fetch("api/getUsers")
	.then(response => response.json())
  	.then(data => loadTable(data))
    .catch(error => {
        alert(error);
    });
	
	
    $('form').submit(function(event) {
    	
    	var name = $( "#name" ).val();
    	var email = $( "#email" ).val();
    	var password = $( "#password" ).val();
    	var sex = $("input[name='sex']:checked").val();
    	var country = $( "#country" ).val();
    	var role = $( "#role" ).val();
    	
        $.ajax({
            method: $(this).attr('method'),
            url: $(this).attr('action'),
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({"name":name,
            					"email":email,
            					"password":password,
            					"sex":sex,
            					"country":country,
            					"role":role}),
        }).done(function(response) {
        	loadTable(response);
        });
        
        event.preventDefault(); // <- avoid reloading
   });
});
</script>