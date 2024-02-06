<%@page import="com.codebook.user.userDao"%>
<%@page import="java.sql.*"%>
<%
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String query="SELECT * FROM user WHERE email='"+email+"' && password='"+password+"'";
    ResultSet rs=userDao.Retrieve(query);
    if(rs.next()){
        session.setAttribute("email",email);
        request.getSession();
            session.setAttribute("success", "Login Successful!");
            response.sendRedirect("User/user-dashboard.jsp");
    }else{
    request.getSession();
            session.setAttribute("failed", "You may entered wrong credentials or You may not registered yet.!");
            response.sendRedirect("user-login.jsp");
    }
%>
