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

DBconnect mymongo= DBconnect.createInstance();
DBCollection collection=mymongo.getCollection("articles");
String id=request.getParameter("id");
//ObjectId class is equivalent to the ObjectId class in MongoDB
ObjectId myid=new ObjectId(id);
BasicDBObject query=new BasicDBObject();
query.put("_id",myid);

if(request.getParameter("edit")!=null)
{
	BasicDBObject doc = new BasicDBObject();
	doc = new BasicDBObject();

				doc.append("Title",request.getParameter("title"));
				doc.append("Content",request.getParameter("content"));
				Date cdate=new Date();
				doc.append("CreatedAt",cdate);
				BasicDBObject updateObj = new BasicDBObject();
				updateObj.put("$set", doc);
				collection.update(query,updateObj,false,true);
				System.out.println("Blog Updated!!!");
			    response.sendRedirect("viewBlogs.jsp");
				
}

else
{

DBObject result = collection.findOne(query); 
%>
<h1> Edit your blog here<br>
<form action="editBlog.jsp?id=<%System.out.println(id);%>" method="post" style="height: 144px;">
Title:
<input type="text" name="title" value="<% System.out.println(result.get("Title"));%>"><br><br>
Blog Content:
<br>
<textarea style="height: 270px; width: 530px;" name="content">
<% System.out.println(result.get("Content"));%>
</textarea>
<br><br>
			<input type="submit" name="edit" value="Update">

		</form>
	</h1>
	<%
	}
	%>
</body>
</html>