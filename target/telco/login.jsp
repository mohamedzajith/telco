<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.mongodb.BasicDBObject"
     import="com.mongodb.DB"
     import="com.mongodb.DBCollection"
     import="com.mongodb.DBCursor"
     import="com.mongodb.MongoClient"
     import="java.net.UnknownHostException"
	 import="com.sun.org.apache.bcel.internal.generic.NEW"
	 import="com.mongodb.DBObject"
	 import="com.mongodb.Mongo"
	 import="java.util.Date"
	 import="tadhack.gossapp.DBconnect"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String login=request.getParameter("Login");
if(login!=null)
{
	//here is my logic for creating a user
	DBconnect mymongo= DBconnect.createInstance();
	DBCollection collection=mymongo.getCollection("admin");
	
	String uname=request.getParameter("username");
	String pwd=request.getParameter("password");
	//ObjectId class is equivalent to the ObjectId class in MongoDB
	BasicDBObject query=new BasicDBObject();
	query.put("_id",uname);
	query.put("pwd",pwd);
	BasicDBObject where=new BasicDBObject();
	where.put("$and",query);		
	DBObject doc = collection.findOne(query);  
	if(doc!=null)
	{
	
	    session.setAttribute("id",request.getParameter("username"));
        response.sendRedirect("createBlog.jsp");
	}
	else
	{
	   System.out.println("\nInvalid Credentials");
	}
}

%>

<h1>Login Here</h1><br><a href="signUp.jsp">New user?</a>
	<form method="post" action="login.jsp">
		Username: <input type="text" name="username"><br><br>
		Password: <input type="password" name="password" style="width: 158px;"><br><br>
		<input type="checkbox" name="rememeber">Remember me<br><br>
		<input type="submit" style="width: 108px; " name="Login" value="Login"><br>
		</form>
</body>
</html>