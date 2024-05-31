package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.Odontologo;


@WebServlet(name = "SvOdontologo", urlPatterns = {"/SvOdontologo"})
public class SvOdontologo extends HttpServlet {
    
    ControladoraLogica controladora = new ControladoraLogica();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        List<Odontologo> listaOdontologos = new ArrayList<Odontologo>();
        
        listaOdontologos = controladora.getOdontologos();
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaOdontologos", listaOdontologos);
        
        response.sendRedirect("verOdontologos.jsp");
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            
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
        
            controladora.crearOdontologo(nombre, apellido, dni, telefono, direccion, fecha_sql, especialidad, id_horario, id_usuario);
            
            response.sendRedirect("index.jsp");
            
        } catch (ParseException ex) {
            Logger.getLogger(SvOdontologo.class.getName()).log(Level.SEVERE, null, ex);
        }

        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
