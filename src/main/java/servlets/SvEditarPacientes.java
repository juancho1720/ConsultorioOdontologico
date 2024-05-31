package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import logica.Responsable;


@WebServlet(name = "SvEditarPacientes", urlPatterns = {"/SvEditarPacientes"})
public class SvEditarPacientes extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id_editar"));
        
        Paciente paciente = control.traerPaciente(id);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("pacienteEdit", paciente);
        
        response.sendRedirect("editarPaciente.jsp");
        
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
            Date fecha_nac = formato.parse(fecha);
            java.sql.Date fecha_sql = new java.sql.Date(fecha_nac.getTime());
            String tipo_sangre = request.getParameter("tipoSangre");
            int id_responsable = Integer.parseInt(request.getParameter("responsable"));
            
            Paciente paciente = (Paciente)request.getSession().getAttribute("pacienteEdit");
            
            paciente.setNombre(nombre);
            paciente.setApellido(apellido);
            paciente.setDni(dni);
            paciente.setTelefono(telefono);
            paciente.setDireccion(direccion);
            paciente.setFecha_nac(fecha_sql);
            paciente.setTipo_sangre(tipo_sangre);
            Responsable res = new Responsable();
            res.setId(id_responsable);
            paciente.setResponsable(res);
            
            System.out.println("nombre: " + nombre);
            
            control.editarPaciente(paciente);
            
            response.sendRedirect("SvPaciente");
            
        } catch (ParseException ex) {
            Logger.getLogger(SvEditarPacientes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
