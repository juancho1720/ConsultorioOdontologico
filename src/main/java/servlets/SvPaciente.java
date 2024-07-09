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
import logica.Paciente;


@WebServlet(name = "SvPaciente", urlPatterns = {"/SvPaciente"})
public class SvPaciente extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            List<Paciente> listaPacientes = new ArrayList<Paciente>();
            
            listaPacientes = control.getPacientes();
            
            HttpSession sesion = request.getSession();
            sesion.setAttribute("listaPacientes", listaPacientes);
        
            response.sendRedirect("verPacientes.jsp");
            
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
            String fecha = request.getParameter("fecha_nac");                  
            String tipoSangre = request.getParameter("tipoSangre");                   
            String responsable = request.getParameter("responsable");
            
            if(nombre.equals("") || apellido.equals("") || dni.equals("") || telefono.equals("") || direccion.equals("") || fecha.equals("")
                    || tipoSangre.equals("") || responsable.equals("")){
            
                response.sendRedirect("llenarCamposPac.jsp");
                
            }else{
               
                Date fecha_nac = formato.parse(fecha);
                java.sql.Date fecha_sql = new java.sql.Date(fecha_nac.getTime());
                int id_responsable = Integer.parseInt(responsable);
                
                control.crearPaciente(nombre, apellido, dni, telefono, direccion, fecha_sql, tipoSangre, id_responsable);
            
                response.sendRedirect("index.jsp");
                
            }
        } catch (ParseException ex) {
            Logger.getLogger(SvPaciente.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
