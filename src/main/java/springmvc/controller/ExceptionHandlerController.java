package springmvc.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.mysql.cj.jdbc.exceptions.CommunicationsException;

@ControllerAdvice
public class ExceptionHandlerController {
	
	@ExceptionHandler({NoHandlerFoundException.class, CommunicationsException.class})
	public String exceptionHandler() {
		return "errorPage";
	}
}
