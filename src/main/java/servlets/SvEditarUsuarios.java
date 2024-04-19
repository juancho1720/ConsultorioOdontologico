package servlets;

import java.io.IOException;
import java.util.HashSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.Usuario;


@WebServlet(name = "SvEditarUsuarios", urlPatterns = {"/SvEditarUsuarios"})
public class SvEditarUsuarios extends HttpServlet {

    ControladoraLogica controladora = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id_editar"));
        
        Usuario usu = controladora.traerUsuario(id);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuEdit", usu);
        
        response.sendRedirect("editarUsuario.jsp");
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombreUsu = request.getParameter("nombreUsuario");
        String contrasenia = request.getParameter("contrasenia");
        String rol = request.getParameter("rol");
        
        Usuario usu = (Usuario)request.getSession().getAttribute("usuEdit");
        
        usu.setNombre_usuario(nombreUsu);
        usu.setContrasenia(contrasenia);
        usu.setRol(rol);
        
        controladora.editarUsuario(usu);
        
        response.sendRedirect("SvUsuario");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
