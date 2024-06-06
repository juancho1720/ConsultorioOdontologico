<%@page import="logica.Turno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>
    
    <h1>Alta Turnos</h1>
    
    <% Turno turno = (Turno)request.getSession().getAttribute("turnoEdit"); %>
    
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
                <input type="text" class="form-control form-control-user" name="horario"
                       placeholder="Horario" value="<%= turno.getHorario()%>">
            </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="odontologo"
                   placeholder="Odontologo" value="<%= turno.getOdonto().getId() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="paciente"
                   placeholder="Paciente" value="<%= turno.getPacien().getId() %>">
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
