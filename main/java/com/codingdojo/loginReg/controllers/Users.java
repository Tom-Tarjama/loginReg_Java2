package com.codingdojo.loginReg.controllers;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.loginReg.models.User;
import com.codingdojo.loginReg.services.UserService;
import com.codingdojo.loginReg.validator.UserValidator;

@Controller
public class Users {
	
	private UserService userService;
	
	private UserValidator userValidator;
	
	public Users(UserService userService, UserValidator userValidator) {
		this.userService = userService;
		this.userValidator = userValidator;
	}
	
    @RequestMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "registrationPage.jsp";
    }
    
    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
        userValidator.validate(user, result);
    	if (result.hasErrors()) {
            return "registrationPage.jsp";
        }
        userService.saveWithUserRole(user);
        return "redirect:/login";
    }
    
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "-Invalid Credentials, Please try again");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        model.addAttribute("user", new User());
        return "registrationPage.jsp";
    }
    
    @RequestMapping(value = {"/", "/home"})
    public String home(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        User currentUser = userService.findByUsername(username);
        Date now = new Date();
        currentUser.setUpdatedAt(now);
        return "homePage.jsp";
    }

}
