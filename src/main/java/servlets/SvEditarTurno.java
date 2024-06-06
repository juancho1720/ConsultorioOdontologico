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
import logica.Odontologo;
import logica.Paciente;
import logica.Turno;


@WebServlet(name = "SvEditarTurno", urlPatterns = {"/SvEditarTurno"})
public class SvEditarTurno extends HttpServlet {

    
    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id_editar"));     
        Turno turno = control.TraerTurno(id);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("turnoEdit", turno);
        
        response.sendRedirect("editarTurno.jsp");
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            
            String afeccion = request.getParameter("observacion");
            String fecha = request.getParameter("fechaTurno");
            Date fecha_turno = formato.parse(fecha);
            java.sql.Date fecha_sql = new java.sql.Date(fecha_turno.getTime());
            String horario = request.getParameter("horario");
            int id_odonto = Integer.parseInt(request.getParameter("odontologo"));
            int id_paciente = Integer.parseInt(request.getParameter("paciente"));
            
            Turno turno = (Turno)request.getSession().getAttribute("turnoEdit");
            
            turno.setAfeccion(afeccion);
            turno.setFecha_turno(fecha_sql);
            turno.setHorario(horario);
            Odontologo odonto = new Odontologo();
            odonto.setId(id_odonto);
            turno.setOdonto(odonto);
            Paciente pac = new Paciente();
            pac.setId(id_paciente);
            turno.setPacien(pac);
            
            control.editTurno(turno);
            
            response.sendRedirect("SvTurno");
            
        } catch (ParseException ex) {
            Logger.getLogger(SvEditarTurno.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
