<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.sql.*"%>
<%
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String query="SELECT * FROM hospital WHERE email='"+email+"' && password='"+password+"'";
    ResultSet rs=adminDao.Retrieve(query);
    if(rs.next()){
        request.getSession();
            session.setAttribute("success", "Login Successful!");
            response.sendRedirect("hospital/hospital-dashboard.jsp");
    }else{
        request.getSession();
            session.setAttribute("failed", "You may entered wrong credentials or You may not registered yet.!");
            response.sendRedirect("hospital-login.jsp");
    }
%>
