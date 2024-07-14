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

@WebServlet(name = "SvTurnosFecha", urlPatterns = {"/SvTurnosFecha"})
public class SvTurnosFecha extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
    List<Turno> listaTurnos = new ArrayList<Turno>();
    List<Turno> listaTurnosXFecha = new ArrayList<Turno>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            String fecha = request.getParameter("fechaTurno");

            if (fecha.equals("")) {
                response.sendRedirect("seleccionarOpcionFecha.jsp");
            } else {

                Date fecha_nac = formato.parse(fecha);
                java.sql.Date fecha_sql = new java.sql.Date(fecha_nac.getTime());
                listaTurnos = control.getTurnos();

                for (Turno tur : listaTurnos) {
                    if (tur.getFecha_turno().compareTo(fecha_sql) == 0) {
                        listaTurnosXFecha.add(tur);
                    }

                }
                
                
                HttpSession sesion = request.getSession();
                sesion.setAttribute("listaTurnoXFecha", listaTurnosXFecha);
                
                response.sendRedirect("turnosXFecha.jsp");

            }

        } catch (ParseException ex) {

            Logger.getLogger(SvTurno.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
