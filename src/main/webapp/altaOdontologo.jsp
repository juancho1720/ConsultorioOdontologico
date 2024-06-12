<%@page import="logica.Horario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>
    
    <% 
    ControladoraLogica control = new ControladoraLogica();
    List<Usuario> listaUsuarios = new ArrayList<Usuario>();
    listaUsuarios = control.getUsuarios();
    List<Horario> listaHorarios = new ArrayList<Horario>();
    listaHorarios = control.getHorarios();
    %>
    
    <h1>Alta de odontólogo</h1>
    <form class="user" action="SvOdontologo" method="POST">
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" name="nombre"
                       placeholder="Nombre">
            </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="apellido"
                   placeholder="Apellido">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="dni"
                   placeholder="DNI">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="telefono"
                   placeholder="Telefono">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="direccion"
                   placeholder="Direccion">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="especialidad"
                   placeholder="Especialidad">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <label for="fecha" class="form-label">Fecha de nacimiento</label>
            <input type="date" class="form-control form-control-user" name="fecha_nac"
                   placeholder="Fecha de nacimiento" id="fecha">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <label for="usuario" class="form-label">Usuario</label>
            <select class="btn btn-secondary dropdown-toggle" id="usuario" name="usuario" style="width: inherit; text-align: left">
                <% for (Usuario usu : listaUsuarios) { %>
                <option class="dropdown-item" value="<%= usu.getId_usuario() %>"> <%= usu.getNombre_usuario() %></option>               
                <% } %>
            </select>
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <label for="horario" class="form-label">Horario</label>
            <select class="btn btn-secondary dropdown-toggle" id="horario" name="horario" style="width: inherit; text-align: left">
                <% for (Horario hor : listaHorarios) { %>
                <option class="dropdown-item"> <%= hor.getHora_inicio() %> - <%= hor.getHora_fin() %> </option>               
                <% } %>
            </select>
        </div>
        </div>
        <button type="submit" class="btn btn-primary btn-user btn-block col-sm-6">
            Registrar Odontólogo
        </button>
        <hr>
        
    </form>


    <%@include file="components/footer.jsp" %>
    <%@include file="components/scripts.jsp" %>
</html>
