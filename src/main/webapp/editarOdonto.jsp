<%@page import="logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>
    <h1>Edición de odontólogo</h1>
    
    <% Odontologo odonto = (Odontologo)request.getSession().getAttribute("odontoEdit"); %>
    
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
            <label for="fecha" class="form-label">Fecha de nacimiento</label>
            <input type="date" class="form-control form-control-user" name="fecha_nac"
                   placeholder="Fecha de nacimiento" id="fecha" value="<%= odonto.getFecha_nac() %>">
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
            <input type="text" class="form-control form-control-user" name="horario"
                   placeholder="Horario" value="<%= odonto.getHorario().getId_horario() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="usuario"
                   placeholder="Usuario" value="<%= odonto.getUsuario().getId_usuario() %>">
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
