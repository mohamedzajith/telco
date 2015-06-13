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
	 import="tadhack.gossapp.DBconnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String signup=request.getParameter("signup");
if(signup!=null)
{
	//here is my logic for creating a user
	DBconnect mymongo= DBconnect.createInstance();
	DBCollection collection=mymongo.getCollection("admin");
	BasicDBObject doc = new BasicDBObject();
	doc = new BasicDBObject();

		doc.append("_id",request.getParameter("uname"));
		doc.append("pwd",request.getParameter("pwd"));
		doc.append("email",request.getParameter("email"));
		collection.insert(doc);
	    session.setAttribute("id",request.getParameter("uname"));
        response.sendRedirect("createBlog.jsp");
}

%>

<h1>Register</h1><br><br><form style="height: 173px;" method="post" action="signUp.jsp">
		<table style="width: 591px;">
			<tr>
				<td style="width: 250px;">FullName</td>
				<td style="width: 307px;"><input type="text" name="name"></td>
			</tr>
			<tr style="width: 706px;">
				<td>Username</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>Confirm Password</td>
				<td><input type="password" name="cpwd"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="SignUp" name="signup"></td>
			</tr>
		</table>
	</form>
	</h1></body>
</html>