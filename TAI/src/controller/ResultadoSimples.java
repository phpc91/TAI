package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CidadeDAO;
import entidades.Cidade;

/**
 * Servlet implementation class ResultadoSimples
 */
@WebServlet("/resultado")
public class ResultadoSimples extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static CidadeDAO cidadeDAO = CidadeDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultadoSimples() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
