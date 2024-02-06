<%@page import="com.codebook.Hospital.hospitalDao"%>
<%@page import="com.codebook.bean.Bean"%>
<%
    Bean b=new Bean();
    b.setEmail(request.getParameter("email"));
    b.setTemp(request.getParameter("fitness_status"));
    
    String query="UPDATE donation SET status='"+b.getTemp()+"' WHERE email='"+b.getEmail()+"'";
    int rowCount=hospitalDao.UpdateStatus(query);
    if(rowCount>0){
        request.getSession();
            session.setAttribute("success", "Status Updation Successful!");
            response.sendRedirect("registered-donors.jsp");
    }else{
        request.getSession();
            session.setAttribute("failed", "Failed to Update Status!");
            response.sendRedirect("registered-donors.jsp");
    }
%>
