<%@page import="logica.Usuario"%>
<%@page import="logica.Horario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>
    <h1>Edición de odontólogo</h1>
    
    <% 
       Odontologo odonto = (Odontologo)request.getSession().getAttribute("odontoEdit"); 
       ControladoraLogica control = new ControladoraLogica();
       List<Horario> listaHorarios = new ArrayList<Horario>();
       listaHorarios = control.getHorarios();
       List<Usuario> listaUsuarios = new ArrayList<Usuario>();
       listaUsuarios = control.getUsuarios();
    %>
    
    <form class="user" action="SvEditarOdontologos" method="POST">
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" name="nombre"
                       placeholder="Nombre Usuario" value="<%= odonto.getNombre() %>">
            </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="apellido"
                   placeholder="Apellido" value="<%= odonto.getApellido() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="dni"
                   placeholder="DNI" value="<%= odonto.getDni() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="telefono"
                   placeholder="Telefono" value="<%= odonto.getTelefono() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="direccion"
                   placeholder="Direccion" value="<%= odonto.getDireccion() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="especialidad"
                   placeholder="Especialidad" value="<%= odonto.getEspecialidad() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <label for="fecha" class="form-label">Fecha de nacimiento</label>
            <input type="date" class="form-control form-control-user" name="fecha_nac"
                   placeholder="Fecha de nacimiento" id="fecha" value="<%= odonto.getFecha_nac() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <label for="horario" class="form-label">Horario</label>
            <select class="btn btn-secondary dropdown-toggle" name="horario" id="horario" style="width: inherit; text-align: left">
                <option value="<%= odonto.getHorario().getId_horario() %>"><%= odonto.getHorario().getHora_inicio()%> - <%= odonto.getHorario().getHora_fin() %></option>
                <% for (Horario hor : listaHorarios) { %>
                <option class="dropdown-item" value="<%= hor.getId_horario() %>"> <%= hor.getHora_inicio() %> - <%= hor.getHora_fin() %> </option>               
                <% } %>
            </select>
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <label for="usuario" class="form-label">Usuario</label>
            <select class="btn btn-secondary dropdown-toggle" id="usuario" name="usuario" style="width: inherit; text-align: left">
                <option value="<%= odonto.getUsuario().getId_usuario() %>"><%= odonto.getUsuario().getNombre_usuario() %></option>
                <% for (Usuario usu : listaUsuarios) { %>
                <option class="dropdown-item" value="<%= usu.getId_usuario() %>"> <%= usu.getNombre_usuario() %></option>               
                <% } %>
            </select>
        </div>
        </div>
        <button type="submit" class="btn btn-primary btn-user btn-block col-sm-6">
            Modificar Datos 
        </button>
        <hr>
        
    </form>


    <%@include file="components/footer.jsp" %>
    <%@include file="components/scripts.jsp" %>
</html>
