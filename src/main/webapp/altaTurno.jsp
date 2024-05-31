<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>
    
    <h1>Alta Turnos</h1>
    
    <form class="user" action="SvTurno" method="POST">
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <label for="fecha" class="form-label">Fecha turno</label>
                <input type="date" class="form-control form-control-user" name="fechaTurno"
                       placeholder="Fecha Turno" id="fecha">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" name="horario"
                       placeholder="Horario">
            </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="odontologo"
                   placeholder="Odontologo">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="paciente"
                   placeholder="Paciente">
        </div>
        </div>
        <div class="col-sm-6 mb-3">
        <label for="exampleFormControlTextarea1" class="form-label">Observaciones</label>
        <textarea class="form-control" name="observacion" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>
        <button type="submit" class="btn btn-primary btn-user btn-block col-sm-6">
            Registrar Turno
        </button>
        <hr>
        
    </form>
    
    
    <%@include file="components/footer.jsp" %>
    <%@include file="components/scripts.jsp" %>
</html>
