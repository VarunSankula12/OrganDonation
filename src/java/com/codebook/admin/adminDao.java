package com.codebook.admin;
import com.codebook.Connections.ConnectionFactory;
import com.codebook.bean.Bean;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.Base64;

public class adminDao {
    
     public static int Registration(Bean b,String query){
        int rowCount=0;
        try{
            ConnectionFactory.BuildConnection();
        Connection connection=ConnectionFactory.getConnection();
        PreparedStatement ps=connection.prepareStatement(query);
        ps.setString(1, b.getName());
        ps.setString(2, b.getEmail());
        ps.setString(3, b.getDob());
        ps.setString(4, b.getMobile());
        ps.setString(5, b.getAddress());
        ps.setString(6, b.getDistName());
        ps.setBlob(7, b.getBlob());
        rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rowCount;
    }
    
    public static ResultSet Retrieve(String query){
        ResultSet rs=null;
        try{
            ConnectionFactory.BuildConnection();
            Connection connection=ConnectionFactory.getConnection();
        PreparedStatement ps=connection.prepareStatement(query);
        rs=ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rs;
    }
    
    public static int Accept(String query){
        int rowCount=0;
        try{
            ConnectionFactory.BuildConnection();
            Connection connection=ConnectionFactory.getConnection();
        PreparedStatement ps=connection.prepareStatement(query);
        rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rowCount;
    }
    
     public static String imageConversion(Blob pic){
        String Profilepic="";
        try{
            InputStream inputStream = pic.getBinaryStream();

                     ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                     byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                         outputStream.write(buffer, 0, bytesRead);
                                         }
                        Profilepic= Base64.getEncoder().encodeToString(outputStream.toByteArray());
        }catch(Exception e){
            e.printStackTrace();
        }
        return Profilepic;
    }
    
    public static int UpdateComplaint(String query){
        int rowCount=0;
        Connection connection=null;
        try{
             ConnectionFactory.BuildConnection();
            connection=ConnectionFactory.getConnection();
       PreparedStatement ps=connection.prepareStatement(query);
       rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
       return rowCount;
    } 
     
}
