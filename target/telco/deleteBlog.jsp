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
	 import="org.bson.types.ObjectId"
	 import="tadhack.gossapp.DBconnect"
    %>
    <%
    if(session.getAttribute("id")==null)
    {
  	  response.sendRedirect("login.jsp");
    }
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2><a href="logout.jsp">SignOut</a></h2>
<%
        String id=request.getParameter("id");
        //ObjectId class is equivalent to the ObjectId class in MongoDB
		ObjectId myid=new ObjectId(id);
		DBconnect mymongo= DBconnect.createInstance();
		DBCollection collection=mymongo.getCollection("articles");
		BasicDBObject query=new BasicDBObject();
		query.put("_id",myid);
        collection.remove(query);
        System.out.println("Blog Removed Successfully!!");
        response.sendRedirect("viewBlogs.jsp");
		%>
</body>
</html>