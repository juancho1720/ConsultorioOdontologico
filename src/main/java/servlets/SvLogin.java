package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.Odontologo;
import logica.Usuario;


@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contrasenia");
        
        Usuario validacion = null;
        
        validacion = control.comprobarIngreso(usuario, contrasenia);
        
        if(validacion != null){
            
            List<Odontologo> listaOdonto = new ArrayList<Odontologo>();
            listaOdonto = control.getOdontologos();
            HttpSession misession = request.getSession(true);
            
            
            String rol = validacion.getRol();
            misession.setAttribute("rol", rol);
            String nombre;
            int id_odonto;
            
            for(Odontologo odo : listaOdonto){
                if(odo.getUsuario().getId_usuario() == validacion.getId_usuario()){
                    
                    id_odonto = odo.getId();
                    nombre = odo.getApellido() + ", " + odo.getNombre();
                    misession.setAttribute("id_odonto", id_odonto);
                    misession.setAttribute("nombre", nombre);
                    
                    
                }
            }
            misession.setAttribute("usuario", usuario);
            
            response.sendRedirect("index.jsp");
            
        }
        else{
            response.sendRedirect("loginError.jsp");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
