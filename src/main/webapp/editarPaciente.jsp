<%@page import="logica.Responsable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>
    
    <h1>Edición de paciente</h1>
    
    <% Paciente pac = (Paciente) request.getSession().getAttribute("pacienteEdit"); 
       ControladoraLogica control = new ControladoraLogica();
       List<Responsable> listaResponsables = new ArrayList<Responsable>();
       listaResponsables = control.getResponsables();
    %>
    
    <form class="user" action="SvEditarPacientes" method="POST">
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user"  name="nombre"
                       placeholder="Nombre" value="<%= pac.getNombre() %>">
            </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="apellido"
                   placeholder="Apellido" value="<%= pac.getApellido() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="dni"
                   placeholder="DNI" value="<%= pac.getDni() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="telefono"
                   placeholder="Telefono" value="<%= pac.getTelefono() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="direccion"
                   placeholder="Direccion" value="<%= pac.getDireccion() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="tipoSangre"
                   placeholder="Tipo de sangre" value="<%= pac.getTipo_sangre() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <label for="fecha" class="form-label">Fecha de nacimiento</label>
            <input type="date" class="form-control form-control-user" name="fecha_nac"
                   placeholder="Fecha de nacimiento" id="fecha" value="<%= pac.getFecha_nac() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <label for="responsable" class="form-label">Responsable</label>
            <select class="btn btn-secondary dropdown-toggle" id="responsable" name="responsable" style="width: inherit; text-align: left">
                <option><%= pac.getResponsable().getApellido()%>, <%= pac.getResponsable().getNombre() %></option>
                <% for (Responsable res : listaResponsables) { %>
                <option class="dropdown-item" value="<%= res.getId() %>"> <%= res.getApellido()%>, <%= res.getNombre() %></option>               
                <% } %>
            </select>
        </div>
        </div>
        <button type="submit" class="btn btn-primary btn-user btn-block col-sm-6">
            Editar Paciente
        </button>
        <hr>
        
    </form>


    <%@include file="components/footer.jsp" %>
    <%@include file="components/scripts.jsp" %>
</html>