package web;

import datos.*;
import dominio.Cliente;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "editar":
                    this.editarCliente(request, response);
                    break;
                case "eliminar":
                    this.eliminarCliente(request,response);
                    break;
                default:
                    this.accionDefault(request, response);
                    break;
            }
        } else {
            this.accionDefault(request, response);
        }

    }

    private double calcularSaldoTotal(List<Cliente> clientes) {
        double saldoTotal = 0;
        for (Cliente cliente : clientes) {
            saldoTotal += cliente.getSaldo();
        }
        return saldoTotal;
    }

    private void accionDefault(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            var clientes = new ClienteDaoJDBC().listar();
            System.out.println("Clientes = " + clientes);
            HttpSession sesion = request.getSession();
            sesion.setAttribute("clientes", clientes);
            sesion.setAttribute("totalClientes", clientes.size());
            sesion.setAttribute("saldoTotal", this.calcularSaldoTotal(clientes));
            //request.getRequestDispatcher("clientes.jsp").forward(request, response);
            response.sendRedirect("clientes.jsp");
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    this.insertarCliente(request, response);
                    break;
                case "modificar":
                    this.modificarCliente(request, response); 
                    break; 
                default:
                    this.accionDefault(request, response);
                    break;
            }
        } else {
            this.accionDefault(request, response);
        }

    }
    
        private void eliminarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idCliente = Integer.parseInt(request.getParameter("idCliente")); 

//        creamos el objeto cliente (modelo)
        Cliente cliente = new Cliente(idCliente);

//         Eliminamos el objeto en la base de datos
        int registrosModificados = new ClienteDaoJDBC().eliminar(cliente);
        System.out.println("registros modificados: " + registrosModificados);

        //Redirigimos  hacia la acciòn por default
        this.accionDefault(request, response);
    }
    
    private void modificarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idCliente = Integer.parseInt(request.getParameter("idCliente")); 
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        int telefono = 0;
        String telefonoString = request.getParameter("telefono");
        if (telefonoString != null && !"".equals(telefonoString)) {
            telefono = Integer.parseInt(telefonoString);
        }
        double saldo = 0;
        String saldoString = request.getParameter("saldo");
        if (saldoString != null && !"".equals(saldoString)) {
            saldo = Double.parseDouble(saldoString);
        }

//        creamos el objeto cliente (modelo)
        Cliente cliente = new Cliente(idCliente, nombre, apellido, email, telefonoString, saldo);

//         Insertamos el nuevo objeto en la base de datos
        int registrosModificados = new ClienteDaoJDBC().actualizar(cliente);
        System.out.println("registros modificados: " + registrosModificados);

        //Redirigimos  hacia la acciòn por default
        this.accionDefault(request, response);
    }
    
  private void insertarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        int telefono = 0;
        String telefonoString = request.getParameter("telefono");
        if (telefonoString != null && !"".equals(telefonoString)) {
            telefono = Integer.parseInt(telefonoString);
        }
        double saldo = 0;
        String saldoString = request.getParameter("saldo");
        if (saldoString != null && !"".equals(saldoString)) {
            saldo = Double.parseDouble(saldoString);
        }

//        creamos el objeto cliente (modelo)
        Cliente cliente = new Cliente(nombre, apellido, email, telefonoString, saldo);

//         Insertamos el nuevo objeto en la base de datos
        int registrosModificados = new ClienteDaoJDBC().insertar(cliente);
        System.out.println("registros modificados: " + registrosModificados);

        //Redirigimos  hacia la acciòn por default
        this.accionDefault(request, response);
    }
    

    private void editarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       

        ///recuperamos el idCliente
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        Cliente idClienteR = new Cliente(idCliente); 
        var cliente = new ClienteDaoJDBC().encontrar(idClienteR);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("cliente", cliente);
       
        response.sendRedirect("/paginas/cliente/editarCliente.jsp");
    }

}
