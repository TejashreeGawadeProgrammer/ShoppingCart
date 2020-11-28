

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RegisterDao rdao;

    public void init() {
        rdao = new RegisterDao();
    }  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		//doGet(request, response);
		 String username = request.getParameter("username");
	        String password = request.getParameter("password");
       
	        Member member = new Member();
	        member.setUname(username);
	        member.setPass(password);


	        try {
	            if (rdao.validate1(member)) {
	            	
	            	System.out.println("You are in Login Servlet");
	                HttpSession session = request.getSession();
	                session.setAttribute("username",username);
	                response.sendRedirect("welcome.jsp");
	            	//request.getRequestDispatcher("loginsuccess.jsp").include(request, response);
	            } else {
	                HttpSession session = request.getSession();
	                response.sendRedirect("memberRegister.jsp");
	               session.setAttribute("user", username);
	                //response.sendRedirect("login.jsp");
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	}

}
