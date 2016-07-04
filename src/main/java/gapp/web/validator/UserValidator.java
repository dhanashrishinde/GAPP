package gapp.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


import gapp.model.User;

@Component
public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return User.class.isAssignableFrom(clazz);
	}
	
	

	@Override
	public void validate(Object target, Errors errors) {
		
		User user = (User) target;
		
		if( !StringUtils.hasText( user.getFirstname() ))
			errors.rejectValue("firstname", "error.field.empty" );
		if( !StringUtils.hasText( user.getLastname() ))
			errors.rejectValue("lastname", "error.field.empty" );
		if( !StringUtils.hasText( user.getEmail_id() ))
			errors.rejectValue("email_id", "error.field.empty" );
		if( !StringUtils.hasText( user.getPassword() ))
			errors.rejectValue("password", "error.field.empty" );
		/*if( !StringUtils.hasText( user.getEmail_id() ))
			errors.rejectValue("email_id", "error.field.exists" );*/
	}
	
	public void validateLogin(Object target, Errors errors) {
		
		User user = (User) target;
		if( !StringUtils.hasText( user.getEmail_id() ))
			errors.rejectValue("email_id", "error.field.empty" );
		if( !StringUtils.hasText( user.getPassword() ))
			errors.rejectValue("password", "error.field.empty" );
		
	}
	
	public void checkIfExist(Object target, Errors errors) {
		
		//User user = (User) target;
		//if( !StringUtils.( user.getEmail_id() ))
			errors.rejectValue("email_id", "error.field.exists" );
		
	}


}
