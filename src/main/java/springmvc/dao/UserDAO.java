package springmvc.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import springmvc.mapper.UserMapper;
import springmvc.model.User;

@Component("userDAO")
public class UserDAO {
	JdbcTemplate template;    
	
	@Autowired
	public UserDAO(DataSource dataSource) {
		template = new JdbcTemplate(dataSource);
	}
	public int save(User user){  
	    String sql="INSERT INTO users(name,email,password,sex,country,role) VALUES(?,?,?,?,?,?)"; 
	    return template.update(sql,user.getName(),user.getEmail(),user.getPassword(),user.getSex(),user.getCountry(),user.getRole());    
	}    
	public int update(User user){    
	    String sql="UPDATE users SET name=?,email=?,password=?,sex=?,country=?,role=? WHERE id=?";    
	    return template.update(sql,user.getName(),user.getEmail(),user.getPassword(),user.getSex(),user.getCountry(),user.getRole(),user.getId());    
	}    
	public int delete(int id){    
	    String sql="DELETE FROM users WHERE id=?";    
	    return template.update(sql,id);    
	}    
	public User getUserById(int id){    
	    String sql="SELECT * FROM users WHERE id=?";  
	    return template.queryForObject(sql, new Object[]{id},new UserMapper());    
	}    
	public List<User> getUsers(){    
	    return template.query("SELECT * FROM users", new UserMapper());
	}    
}
