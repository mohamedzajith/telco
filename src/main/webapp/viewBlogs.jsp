<%@page import="java.security.acl.LastOwnerException"%>
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
	 import= "java.lang.Math"
    
    %>
    <%
    String id=null;
    if(session.getAttribute("_id")==null)
    {
  	  response.sendRedirect("login.jsp");
    }
    else
    {
    	id=(String)session.getAttribute("_id");
    	
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
<h4><a href="logout.jsp">SignOut</a></h4>
<h4><a href="createBlog.jsp">Write new</a></h4>
<%! double get_PAGES_COUNT(String id)
{
	DBconnect mongo1=null;
	try
	{
	mongo1= DBconnect.createInstance();
	}
	catch(UnknownHostException e)
	{
		
		e.printStackTrace();
	}
	DBCollection collection=mongo1.getCollection("articles");
	BasicDBObject query = new BasicDBObject("Author",id);
	DBCursor cursor = collection.find(query);
	int nrecords=cursor.count();
	return(Math.ceil((double)nrecords/5));
	
	
}
%>
<%
double pages = get_PAGES_COUNT(id);
DBconnect mymongo= DBconnect.createInstance();
DBCollection collection=mymongo.getCollection("articles");
BasicDBObject query = new BasicDBObject("Author",id);
int skip=0;
if(request.getParameter("p")!=null)
{
String c = request.getParameter("p");
skip = Integer.parseInt(c);
}

DBCursor cursor=null;
if(skip==0)
cursor = collection.find(query).limit(5);
else
{
	cursor = collection.find(query).skip((skip-1)*5).limit(5);
	}


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
<div>
</br>
</br>
      <% for(double i=0;i<pages;i++)
    	  {
    	  int j=(int)i;
    		  %>
    	  <a href="viewBlogs.jsp?p=<%System.out.print(j+1);%>"><%System.out.print(j+1);%></a>
    	  &nbsp;&nbsp;
    	  <%} %>
</div>

</body>
</html>