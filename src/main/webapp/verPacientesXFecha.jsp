<%@page import="logica.Turno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>
    
    
    
    <div class="form-group ml-3">
        <form action="SvTurnosFecha" method="GET">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <label for="fecha" class="form-label">Fecha turnos</label>
                <input type="date" class="form-control form-control-user" name="fechaTurno"
                       placeholder="Fecha Turno" id="fecha">
            </div>
        <div class="col-sm-6 mb-sm-0">
            <div class="col-sm-6 mt-3 mb-sm-0">
            
            <h2>Seleccione una fecha</h2> 
            
            </div>
            <button type="submit" class="btn btn-primary btn-user btn-block col-sm-6" style="margin-top: 32px">
                Buscar Turnos
            </button>
        </div>   
        </form>
    </div>
    
    
    
    <%@include file="components/footer.jsp" %>
    <%@include file="components/scripts.jsp" %>
</html>
