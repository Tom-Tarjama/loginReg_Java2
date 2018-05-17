
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>   
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>Welcome Page</title>
</head>
<body>
    <h1>Welcome <c:out value="${currentUser.firstName}!"></c:out></h1>
    
    <fieldset>
    	<legend>My Info:</legend>
    	<p>First Name: ${currentUser.firstName}</p>
    	<p>Last Name: ${currentUser.lastName}</p>
    	<p>Email: ${currentUser.username}</p>
    	<p>Sign Up Date: <fmt:formatDate pattern = "MMMM dd',' yyyy 'at' h:mm:ss a" value ="${currentUser.createdAt}"/></p>
    	<p>Last Sign-in: <fmt:formatDate pattern = "MMMM dd',' yyyy 'at' h:mm:ss a" value ="${currentUser.updatedAt}"/></p>
    </fieldset>
    
    <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form>
</body>
</html>