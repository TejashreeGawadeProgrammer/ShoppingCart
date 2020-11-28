

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FlowerServlet")
public class FlowerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public FlowerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String fname= request.getParameter("fname");
		String fcolor = request.getParameter("fcolor");
		String quantity = request.getParameter("quantity");
	
		System.out.println("You are in FlowerServlet class....");
		Flower flower = new Flower(fname,fcolor,quantity);
		RegisterDao rdao = new RegisterDao();
		String result = rdao.insertFlower(flower);
		response.getWriter().print(result);
		
		RequestDispatcher dispatcher =
                request.getRequestDispatcher("/Output.jsp");      
        dispatcher.forward(request,response);
	}

}
