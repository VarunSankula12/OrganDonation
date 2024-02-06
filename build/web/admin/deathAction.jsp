<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.sql.*"%>
<%
    String email=request.getParameter("email");
    String status="";
    String query="SELECT * FROM donation WHERE email='"+email+"'";
    ResultSet rs=adminDao.Retrieve(query);
    if(rs.next()){
        status=rs.getString("death");
        if(status.equalsIgnoreCase("issued")){
        request.getSession();
            session.setAttribute("failed", "Death Certificate Issued Already!");
            response.sendRedirect("deathCertificate.jsp");
        }else{
        String q1="UPDATE donation SET death='Issued' WHERE email='"+email+"'";
        int rowCount=adminDao.UpdateComplaint(q1);
        if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Death Certificate Issued Successfully!");
            response.sendRedirect("deathCertificate.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to Issue Death Certificate!");
            response.sendRedirect("deathCertificate.jsp");
        }
        }
        
    }
%>
