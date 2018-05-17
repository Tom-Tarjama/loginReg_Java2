package com.codingdojo.loginReg.validator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.codingdojo.loginReg.models.User;
@Component
public class UserValidator implements Validator {
    
    //    1
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
    
    // 2 Creating our custom validation. We can add errors via .rejectValue(String, String).
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            // 3
            errors.rejectValue("passwordConfirmation", "Match");
        }         
    }
}