package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.Horario;
import logica.Odontologo;
import logica.Usuario;


@WebServlet(name = "SvEditarOdontologos", urlPatterns = {"/SvEditarOdontologos"})
public class SvEditarOdontologos extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        int id = Integer.parseInt(request.getParameter("id_editar"));

        
        Odontologo odonto = control.traerOdontologo(id);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("odontoEdit", odonto);
        
        response.sendRedirect("editarOdonto.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy/MM/dd");

            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String dni = request.getParameter("dni");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            //TODO: Agregar un datepicker para evitar errores por el formate del Date
            String fecha = request.getParameter("fecha_nac");
            Date fecha_nac = formato.parse(fecha);
            java.sql.Date fecha_sql = new java.sql.Date(fecha_nac.getTime());
            String especialidad = request.getParameter("especialidad");
            //TODO: Agregar drop down list para las opciones
            int id_horario = Integer.parseInt(request.getParameter("horario"));
            int id_usuario = Integer.parseInt(request.getParameter("usuario"));
            
            Odontologo odonto = (Odontologo)request.getSession().getAttribute("odontoEdit");
            
            odonto.setNombre(nombre);
            odonto.setApellido(apellido);
            odonto.setDni(dni);
            odonto.setTelefono(telefono);
            odonto.setDireccion(direccion);
            odonto.setFecha_nac(fecha_sql);
            odonto.setEspecialidad(especialidad);
            Horario hora = new Horario();
            hora.setId_horario(id_horario);
            odonto.setHorario(hora);
            Usuario usu = new Usuario();
            usu.setId_usuario(id_usuario);
            odonto.setUsuario(usu);
            
            control.editarOdontologo(odonto);
            
            response.sendRedirect("SvOdontologo");

        } catch (ParseException ex) {
            Logger.getLogger(SvOdontologo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
