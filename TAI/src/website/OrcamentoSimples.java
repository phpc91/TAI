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

import dao.CidadeDAO;
import entidades.Cidade;

/**
 * Servlet implementation class OrcamentoSimples
 */
@WebServlet({"/orcamento"})
public class OrcamentoSimples extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static CidadeDAO cidadeDAO = CidadeDAO.getInstance();
       
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
		ArrayList<Cidade> cidades = cidadeDAO.getTodasCidades();
		
		//total de estados do país
		int numeroCidades = cidades.size();
		
		//cria listas do tamanho deste total
		Integer[] idsEstados = new Integer[numeroCidades];
		String[] nomesCidades = new String[numeroCidades];
		String[] siglasEstados = new String[numeroCidades];
		
		//preenche as listas com as informacoes
		for (int i=0; i < numeroCidades; i++){
			idsEstados[i] = cidades.get(i).getId();
			nomesCidades[i] = cidades.get(i).getNome();
			
		}
		
		request.setAttribute("nomesCidades", nomesCidades);
		request.setAttribute("idsCidades", idsEstados);
		request.setAttribute("siglasEstados", siglasEstados);
		
		request.getRequestDispatcher("/orcamentoSimples.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO tratar dados enviados pelo usuario, calcular orc. simples, redirecionar para pagina de resultado
		
		//mostrar resultado, jsp com link para orcamentoCompleto
		
//		ServletContext sc = this.getServletContext();
//		RequestDispatcher rd = sc.getRequestDispatcher("/resultadoSimples.jsp");
//		rd.forward(request, response);
	}
}
