package website;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EstadoDAO;
import entidades.Estado;

/**
 * Servlet implementation class OrcamentoSimples
 */
@WebServlet(name="Orçamento Simples", urlPatterns={"/orc_simples"})
public class OrcamentoSimples extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static EstadoDAO estadoDAO = EstadoDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrcamentoSimples() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		//acessa o banco de dados
		ArrayList<Estado> estados = estadoDAO.getTodosEstados();
		
		//total de estados do país
		int numeroEstados = estados.size();
		
		//cria listas do tamanho deste total
		int[] idsEstados = new int[numeroEstados];
		String[] nomesEstados = new String[numeroEstados];
		String[] siglasEstados = new String[numeroEstados];
		
		//preenche as listas com as informacoes
		for (int i=0; i < numeroEstados; i++){
			idsEstados[i] = estados.get(i).getId();
			nomesEstados[i] = estados.get(i).getNome();
			siglasEstados[i] = estados.get(i).getSigla();
		}
		
		request.setAttribute("nomesEstados", nomesEstados);
		request.setAttribute("idsEstados", idsEstados);
		request.setAttribute("siglasEstados", siglasEstados);
		
		ServletContext sc = this.getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher("/orcamentoSimples.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO tratar dados enviados pelo usuario, calcular orc. simples, redirecionar para pagina de resultado
		
		ServletContext sc = this.getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher("/resultadoSimples.jsp");
		rd.forward(request, response);
	}
}
