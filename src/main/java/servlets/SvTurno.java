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
import logica.Turno;

@WebServlet(name = "SvTurno", urlPatterns = {"/SvTurno"})
public class SvTurno extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
    
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Turno> listaTurnos = control.getTurnos();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaTurnos", listaTurnos);

        response.sendRedirect("verTurnos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            String observacion = request.getParameter("observacion");
            String horario = request.getParameter("horario");
            String paciente = request.getParameter("paciente");
            String odonto = request.getParameter("odontologo");
            String fecha = request.getParameter("fechaTurno");

            if (observacion.equals("") || horario.equals("") || paciente.equals("") || odonto.equals("") || fecha.equals("")) {

                response.sendRedirect("llenarCamposTur.jsp");

            }else {

            int id_paciente = Integer.parseInt(paciente);
            int id_odonto = Integer.parseInt(odonto);
            Boolean reservado = false;
            Date fecha_nac = formato.parse(fecha);
            java.sql.Date fecha_sql = new java.sql.Date(fecha_nac.getTime());
            List<Turno> listaTurnos = control.getTurnos();
            
            for (Turno tur : listaTurnos) {

                if (tur.getOdonto().getId() == id_odonto && tur.getHorario().equals(horario) && tur.getFecha_turno().compareTo(fecha_sql) == 0) {

                    reservado = true;
                }
            }
            
            
            if(reservado){
            
                response.sendRedirect("turnoReservado.jsp");
                
            }else{
                control.crearTurno(observacion, horario, id_paciente, id_odonto, fecha_sql);

                response.sendRedirect("index.jsp");}
            }
            

        } catch (ParseException ex) {
            Logger.getLogger(SvTurno.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
