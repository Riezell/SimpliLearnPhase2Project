package com.reservation;



import java.io.PrintWriter;
import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.sql.Statement;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		// JDBC URL, username and password of MySQL server
		
	    final String url = "jdbc:mysql://localhost:3306/flightreservation";
	    final String user = "root";
	    final String password = "root";
	    
	    Connection con =null;
	    PreparedStatement prSt= null;
	    
	    try{
		    String username = request.getParameter("username");   
	        String pass = request.getParameter("password");
	        
			/*
			 * //creating the HttpSession below HttpSession session=request.getSession();
			 * 
			 * session.setAttribute("uname",username);
			 */
	        
			  
	        Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
	        
	        prSt = con.prepareStatement("Select Username,Password from adminlogin where Username=? and Password=?");
	        prSt.setString(1, username);
	        prSt.setString(2, pass);
	        ResultSet rs = (ResultSet) prSt.executeQuery();    
	        System.out.print("The resutl set is "+rs);
	        
	        if(rs.next()) {        
	        	System.out.print("Credential is valid");
	           out.print("Valid login credentials");
	           RequestDispatcher rd = getServletContext().getRequestDispatcher("/TravelHistory.jsp");
				rd.forward(request, response);
	        }
	        else {
	        out.print("Invalid login credentials"); 
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
