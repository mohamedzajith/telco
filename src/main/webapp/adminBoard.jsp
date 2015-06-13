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
    if(session.getAttribute("id")==null)
    {
      
  	  response.sendRedirect("login.jsp");
    }
    else
    {
    	String uid=(String)session.getAttribute("id");
    	if(!uid.equals("admin"))
    		response.sendRedirect("createBlog.jsp");
    		
    }
    
    
    %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function confirmDelete(){

	var result=confirm("Do you really want to Delete this blog");
    return result;
}

</script>
</head>
<body>
<h2><a href="logout.jsp">SignOut</a></h2>
<a href="createBlog.jsp">Write new</a>
<%

DBconnect mymongo= DBconnect.createInstance();
DBCollection collection=mymongo.getCollection("articles");
BasicDBObject doc = new BasicDBObject();
DBCursor cursor = collection.find();

try {
       while(cursor.hasNext()) 
       {
    	   DBObject str= cursor.next();
             %>
             <h2><%System.out.println(str.get("Title"));%></h2>
    	  <h3><% Date cdate=(Date)str.get("CreatedAt");
    	  System.out.println("Last updated on: "+cdate.toString());%></h3>
    	  <% String data=(String)str.get("Content");
    	  System.out.println(data.substring(0,10)+".....");
    	  %>
    	  <a href="readBlog.jsp?id=<%System.out.println(str.get("_id"));%>">View</a>
    	   <a href="editBlog.jsp?id=<%System.out.println(str.get("_id"));%>">Edit</a>
    	    <a href="deleteBlog.jsp?id=<%System.out.println(str.get("_id"));%>" onclick="return confirmDelete()">Delete</a>
    	  <%
    	  
 	   	  
    	  
    	          }
    	} 
    finally 
    {
       cursor.close();
    }
    



%>

</body>
</html>