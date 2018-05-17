<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Page</title>
</head>
<body>
		<fieldset>
    <legend>Login</legend>
    <c:if test="${errorMessage != null}">
        <c:out value="${errorMessage}"></c:out>
    </c:if>
    <form method="POST" action="/login">
    	<table>
    		<tr>
    			<td>
           			 <label for="username">Email:</label>
        		</td>
        		<td>
            		<input type="text" id="username" name="username"/>
        		</td>
        	</tr>
        	<tr>
        		<td>
            		<label for="password">Password:</label>
            	</td>
            	<td>
            		<input type="password" id="password" name="password"/>
        		</td>
        	</tr>
        	<tr>
        		<td>
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        			<input type="submit" value="Login"/>
       			</td>
       		</tr>
        </table>
      </form>
    </fieldset>
    <fieldset>  
    <legend>Register</legend>
    
    <p><form:errors path="user.*"/></p>
    
    <form:form method="POST" action="/registration" modelAttribute="user">
    	<table>

			<tr>
				<td>
            		<form:label path="firstName">First Name:</form:label>
            	</td>
            	<td>
            		<form:input path="firstName"/>
            	</td>
			<tr>
				<td>
            		<form:label path="lastName">Last Name:</form:label>
            	</td>
            	<td>
           			<form:input path="lastName"/>
           		</td>
           	</tr>
           	<tr>
 				<td>
            		<form:label path="username">Email:</form:label>
            	</td>
            	<td>
            		<form:input path="username"/>
            	</td>
            </tr>
			<tr>
				<td>
            		<form:label path="password">Password:</form:label>
            	</td>
            	<td>
            		<form:password path="password"/>
            	</td>
			</tr>
			<tr>
				<td>
            		<form:label path="passwordConfirmation">PW Confirmation:</form:label>
            	</td>
            	<td>
            		<form:password path="passwordConfirmation"/>
            	</td>
            </tr>
        	<tr>
        		<td>
        			<input type="submit" value="Register"/>
        		</td>
        	</tr>
        </table>
    </form:form>
    </fieldset>
    
</body>
</html>