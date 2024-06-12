<%@page import="logica.Paciente"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.Horario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="logica.Turno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>
    
    <h1>Editar Turno</h1>
    
    <% Turno turno = (Turno)request.getSession().getAttribute("turnoEdit"); 
       ControladoraLogica control = new ControladoraLogica();
       List<Horario> listaHorarios = new ArrayList<Horario>();
       listaHorarios = control.getHorarios();
       List<Odontologo> listaOdonto = new ArrayList<Odontologo>();
       listaOdonto = control.getOdontologos();
       List<Paciente> listaPacientes = new ArrayList<Paciente>();
       listaPacientes = control.getPacientes();
    %>
    
    <form class="user" action="SvEditarTurno" method="POST">
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <label for="fecha" class="form-label">Fecha turno</label>
                <input type="date" class="form-control form-control-user" name="fechaTurno"
                       placeholder="Fecha Turno" id="fecha" value="<%= turno.getFecha_turno() %>">
            </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <label for="horario" class="form-label">Horario</label>
            <select class="btn btn-secondary dropdown-toggle" name="horario" id="horario" style="width: inherit; text-align: left">
                <option><%= turno.getHorario() %></option>
                <% for (Horario hor : listaHorarios) { %>
                <option class="dropdown-item"> <%= hor.getHora_inicio() %> - <%= hor.getHora_fin() %> </option>               
                <% } %>
            </select>
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <label for="odonto" class="form-label">Odontólogo</label>
            <select class="btn btn-secondary dropdown-toggle" id="odonto" name="odontologo" style="width: inherit; text-align: left">
                <option value="<%= turno.getOdonto().getId() %>"><%= turno.getOdonto().getApellido()%>, <%= turno.getOdonto().getNombre() %></option>
                <% for (Odontologo odo : listaOdonto) { %>             
                <option class="dropdown-item" value="<%= odo.getId() %>"> <%= odo.getApellido() %>, <%= odo.getNombre() %> </option>               
                <% } %>
            </select>
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <label for="paciente" class="form-label">Paciente</label>
            <select class="btn btn-secondary dropdown-toggle" id="paciente" name="paciente" style="width: inherit; text-align: left">
                <option value="<%= turno.getPacien().getId() %>"><%= turno.getPacien().getApellido()%>, <%= turno.getPacien().getNombre() %></option>
                <% for (Paciente pac : listaPacientes) { %>
                <option class="dropdown-item" value="<%= pac.getId() %>"> <%= pac.getApellido() %>, <%= pac.getNombre() %> </option>               
                <% } %>
            </select>
        </div>
        </div>
        <div class="col-sm-6 mb-3">
        <label for="exampleFormControlTextarea1" class="form-label">Observaciones</label>
        <textarea class="form-control" name="observacion" id="exampleFormControlTextarea1" rows="3"><%= turno.getAfeccion() %></textarea>
        </div>
        <button type="submit" class="btn btn-primary btn-user btn-block col-sm-6">
            Editar Turno
        </button>
        <hr>
        
    </form>
    
    
    <%@include file="components/footer.jsp" %>
    <%@include file="components/scripts.jsp" %>
</html>
