<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.iem.ConnectionFactory.ConnectionFact" import="java.sql.*" import="com.iem.DAO.UserManager" %>
<%-- 
  - Author: Shamik Kundu
  - Description: this page will redirect the user to either the page where he can add details (2/2) or redirects
                 him back to the same page beased upon successful/unsuccessful entry in database.
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String address= request.getParameter("adrs");
String city= request.getParameter("city");
String pin= request.getParameter("pin");
String lat= request.getParameter("lt");
String lng=request.getParameter("lng");
String cat=session.getAttribute("cat").toString();
String unm=session.getAttribute("mail").toString();
int ww=UserManager.reghouse(unm, address, city, pin, lat, lng);
if (ww==1)
{   request.getSession().setAttribute("cat",cat);
	request.getSession().setAttribute("adrs", address);
	request.getSession().setAttribute("mail", unm);
	response.sendRedirect("singup_houseowner2.jsp");
}
else if(ww==0)
{   request.getSession().setAttribute("cat",cat);
	request.getSession().setAttribute("mail", unm);
	response.sendRedirect("signup_houseowner.jsp");
}
%>
</body>
</html>