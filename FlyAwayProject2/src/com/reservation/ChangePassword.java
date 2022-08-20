package com.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangePassword
 */
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		final String url = "jdbc:mysql://localhost:3306/flightreservation";
	    final String user = "root";
	    final String password = "root";
	    Connection con =null;
	    PreparedStatement prSt= null;
	    
	    try{
		    String username = request.getParameter("username");   
	        String Oldpassword = request.getParameter("OldPass");
	        String Newpassword = request.getParameter("NewPass");
	        String Confirmpassword = request.getParameter("ConfirmPass");
			  
	        Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
	        
	        prSt = con.prepareStatement("Update adminlogin set Password = ? where Password=?");
	        prSt.setString(1, Newpassword);
	       // prSt.setString(2, username);
	        prSt.setString(2, Oldpassword);
	        
	        if(Newpassword.equals(Confirmpassword)) {
	        int rowAffected = prSt.executeUpdate();
  
	        System.out.println(String.format("Row affected %d", rowAffected));
	        
	        if(rowAffected == 1) {        
	        	RequestDispatcher rd = getServletContext().getRequestDispatcher("/AdminLoginPage.jsp");
	            out.print("Password updated successfully");
				rd.forward(request, response);
	           }else {
	        	   out.print("Record Not Found");
	           }
	        }
	        else {
	        out.print("New and Confirm Password mismatch"); 
	        }
	        
	        prSt.close();
	        con.close();
	        
	   }
	   catch(Exception e){       
	       out.print("Something went wrong !! Please try again");   
	       e.printStackTrace();
	   }finally{
		      //finally block used to close resources
		      try{
		         if(prSt!=null)
		        	 prSt.close();
		      }catch(SQLException se2){
		      }// nothing we can do
		      try{
		         if(con!=null)
		            con.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		   }
	    
	   
		doGet(request, response);
	}

}
