<%@page import="com.codebook.admin.Block"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.sql.*"%>
<%
    String email=request.getParameter("email");
    String od=request.getParameter("od");
    String self=request.getParameter("self");
    String current=email+self+od;
    String query="SELECT * FROM donation WHERE email='"+email+"'";
    ResultSet rs=adminDao.Retrieve(query);
    String temp="";
    String prev="";
    String app="";
    if(rs.next()){
        prev=rs.getString("prevhash");
        app=rs.getString("appHash");
    }
    Block bc=new Block(current,prev);
    String locationhash=bc.calculateHash();
    
    
   
    if(locationhash.equals(app)){
        String query1="UPDATE donation SET BlockChainVerification='Verified' WHERE email='"+email+"'";
        int rowCount=adminDao.UpdateComplaint(query1);
        if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Successfully Verified Through BlockChain!");
            response.sendRedirect("VerifiedPage.jsp?email="+email);
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to Update BlockChain Verification Status!");
            response.sendRedirect("organDonors.jsp");
        }
    }else{
        out.println("Data has been Tampered");
        request.getSession();
            session.setAttribute("failed", "Data has been Tampered!");
            response.sendRedirect("organDonors.jsp");
    }
%>