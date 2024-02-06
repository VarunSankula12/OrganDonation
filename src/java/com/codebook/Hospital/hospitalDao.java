
package com.codebook.Hospital;

import com.codebook.Connections.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class hospitalDao {
    
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
    
    
    public static int UpdateStatus(String query){
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
}
