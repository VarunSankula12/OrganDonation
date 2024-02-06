<%@page import="com.codebook.user.userDao"%>
<%@page import="java.sql.*"%>
<%@page import="com.codebook.bean.Bean"%>
<%
    String rating=request.getParameter("star1");
    String feedback=request.getParameter("feedback");
    String email=(String)session.getAttribute("email");
    Bean b=new Bean();
    b.setEmail(email);
    b.setName(rating);
    b.setMobile(feedback);
    String q1="SELECT * FROM donation WHERE email='"+email+"'";
    ResultSet rs=userDao.Retrieve(q1);
    if(rs.next()){
    String query="INSERT INTO feedback (email,feedback,rating) VALUES (?,?,?)";
    int rowCount=userDao.Feedback(b, query);
    if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Feedback Submitted Successfully!");
            response.sendRedirect("feedback.jsp");
    }else{
            request.getSession();
            session.setAttribute("failed", "Failed to Submit Feedback!");
            response.sendRedirect("feedback.jsp");
    }
    }else{
            request.getSession();
            session.setAttribute("failed", "You have not yet Donated!");
            response.sendRedirect("feedback.jsp");
    }
%>
