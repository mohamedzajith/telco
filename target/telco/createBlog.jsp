<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    String id=null;
    String url=null;
    if(session.getAttribute("id")==null)
    	   {
        	  response.sendRedirect("login.jsp");
          }
    else
    {
    	id=(String)session.getAttribute("id");
 
    }
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3><a href="logout.jsp">SignOut</a></h3>
<%   
if(id.equals("admin"))
{
	url="adminBoard.jsp";

}
else
{
	url="viewBlogs.jsp";

}

%>
<a href="<%System.out.println(url);%>">MyBlogs</a>
<h1> Write your blog here</h1><br>
<h3> Welcome: <% System.out.println(session.getAttribute("id")); %></h3>
<form action="insertBlog.jsp" method="post" style="height: 144px;">
Title:
<input type="text" name="title"><br><br>
Blog Content:
<br>
<textarea style="height: 270px; width: 530px;" name="content">
</textarea>
<br><br>
			<input type="submit" value="Create">

		</form>
	</h1>

</body>



</html>