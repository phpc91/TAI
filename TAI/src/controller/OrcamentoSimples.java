package controller;

import java.io.IOException;
import java.util.ArrayList;
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
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//acessa o banco de dados
		ArrayList<Cidade> cidades = cidadeDAO.getTodasCidades();
		
		//total de estados do país
		int numeroCidades = cidades.size();
		
		//cria listas do tamanho deste total
		Integer[] idsCidades = new Integer[numeroCidades];
		String[] nomesCidades = new String[numeroCidades];
		
		//preenche as listas com as informacoes
		for (int i=0; i < numeroCidades; i++){
			idsCidades[i] = cidades.get(i).getId();
			nomesCidades[i] = cidades.get(i).getNome();
			
		}
		
		request.setAttribute("nomesCidades", nomesCidades);
		request.setAttribute("idsCidades", idsCidades);
		
		request.getRequestDispatcher("/orcamentoSimples.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO tratar dados enviados pelo usuario, calcular orc. simples, redirecionar para pagina de resultado
		
		//mostrar resultado, jsp com link para orcamentoCompleto
		int idCidade = Integer.valueOf(request.getParameter("cidade"));
		Cidade cidade = cidadeDAO.getCidadePorId(idCidade);
		float tarifa = cidade.getConc().getTarifa(); //R$/kWh
		float consumo = (Float.valueOf(request.getParameter("valor")))/tarifa; //kWh --minimo = 30kWh
		float consumoPlacas = consumo - 30; //24*30 hrs/mes [kWh]
		double potencia = consumoPlacas/(5*0.85*30); //[kWp]
		int numeroDePlacas = (int) Math.ceil(potencia/0.27); //cada placa produz ~270W
		int custoPorPlaca = 700;
		int preco = numeroDePlacas * custoPorPlaca;
		double precoFinal = 1.6*preco;
		
		request.setAttribute("numeroDePlacas", numeroDePlacas); //int
		request.setAttribute("preco", preco); //int
		request.setAttribute("precoFinal", precoFinal); //double
		request.setAttribute("consumo", consumo);
		request.setAttribute("tarifa", tarifa);
		request.setAttribute("potencia", potencia);
		
		request.getRequestDispatcher("/resultadoSimples.jsp").forward(request, response);
//		request.getRequestDispatcher("/resultado").forward(request, response);
	}
}
