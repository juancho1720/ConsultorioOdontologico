package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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


@WebServlet(name = "SvTurnosPaciente", urlPatterns = {"/SvTurnosPaciente"})
public class SvTurnosPaciente extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
    List<Turno> listaTurnos = new ArrayList<Turno>();
    List<Turno> listaTurnosXPaciente = new ArrayList<Turno>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        

            String id_pac = request.getParameter("id_pac");
            if(id_pac.equals("")){
                response.sendRedirect("seleccionarOpcion.jsp");
            }else {
            
                int id = Integer.parseInt(id_pac);
                listaTurnos = control.getTurnos();
                
                for(Turno tur : listaTurnos){
                    
                    if(tur.getPacien().getId() == id){
                        
                        listaTurnosXPaciente.add(tur);
                        
                    }
                    
                }
                
                HttpSession sesion = request.getSession();
                sesion.setAttribute("listaTurnosXPaciente", listaTurnosXPaciente);
                
                response.sendRedirect("turnosXPaciente.jsp");
                
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
