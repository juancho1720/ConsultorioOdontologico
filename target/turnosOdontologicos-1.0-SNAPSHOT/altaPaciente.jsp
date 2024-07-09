<%@page import="logica.Responsable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
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
    List<Responsable> listaResponsables = new ArrayList<Responsable>();
    listaResponsables = control.getResponsables();
    %>
    
    <div class="ml-3">
    <h1>Alta de paciente</h1>
    <form class="user" action="SvPaciente" method="POST">
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user"  name="nombre"
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
            <input type="text" class="form-control form-control-user" name="tipoSangre"
                   placeholder="Tipo de sangre">
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
            <label for="responsable" class="form-label">Responsable</label>
            <select class="btn btn-secondary dropdown-toggle" id="responsable" name="responsable" style="width: inherit; text-align: left">
                <option></option>
                <% for (Responsable res : listaResponsables) { %>
                <option class="dropdown-item" value="<%= res.getId() %>"> <%= res.getApellido()%>, <%= res.getNombre() %></option>               
                <% } %>
            </select>
        </div>
        </div>
        <button type="submit" class="btn btn-primary btn-user btn-block col-sm-6">
            Registrar Paciente
        </button>
        
        
    </form>
            
    </div>


    <%@include file="components/footer.jsp" %>
    <%@include file="components/scripts.jsp" %>
</html>