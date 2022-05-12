

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
/**
 *  implementation class add_doctor
 */
public class add_doctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public add_doctor() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		try {
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","");
			String  name = request.getParameter("name");
			String  email = request.getParameter("email");
			String  phone = request.getParameter("phone");
			String  age = request.getParameter("age");
			
			String  sal = request.getParameter("sal");
			String  spec = request.getParameter("spec");
			
			String sql = "insert into doctor(name,email,phone,age,sal,spec) values(?,?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setInt(4, Integer.valueOf(age));
			ps.setLong(5,Long.valueOf(sal));
			ps.setString(6, spec);
			ps.addBatch();
			
			int successCount = 0;
			successCount += ps.executeBatch()[0];
			ps.clearBatch();
			if(successCount == 1) {
				response.setContentType("text/html"); 
				
				out.println("<br><br><br><h1 align=center><font color=\"white\">SUCCESSFUL<br></font></h1><script type=\"text/javascript\">");  
//				out.println("redirectURL = \"welcome.html\";setTimeout(\"location.href = redirectURL;\",\"5000\");");  
				out.println("</script>");
			}
			
			else {
				response.setContentType("text/html");  
				out.println("<br><br><br><h1 align=center><font color=\"red\">THERE IS SOME PROBLEM<br></font></h1><script type=\"text/javascript\">");  
//				out.println("redirectURL = \"welcome.html\";setTimeout(\"location.href = redirectURL;\",\"5000\");");  
				out.println("</script>");
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}
	}

}
