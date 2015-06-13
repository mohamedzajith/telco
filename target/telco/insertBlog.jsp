<%@page import="com.mongodb.MongoOptions"%>
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
    <%
     String id=null;
    if(session.getAttribute("id")==null)
    {
  	  response.sendRedirect("login.jsp");
    }
    else
    {
    	id=(String)session.getAttribute("id");
    	//System.out.println(id);
    }
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
//this is the code to get the form contents from  createBlog.jsp
String blogTitle=request.getParameter("title");
System.out.println(blogTitle);
//This is the code to insert the blog details into mongo collection

DBconnect mymongo= DBconnect.createInstance();
DBCollection collection=mymongo.getCollection("articles");
BasicDBObject doc = new BasicDBObject();
doc = new BasicDBObject();

	doc.append("Title",request.getParameter("title"));
	doc.append("Content",request.getParameter("content"));
	doc.append("Author",id);
	Date cdate=new Date();
	doc.append("CreatedAt",cdate);
	collection.insert(doc);
	response.sendRedirect("viewBlogs.jsp");
%>
</body>
</html>