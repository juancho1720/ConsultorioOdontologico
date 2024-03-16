<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>
    <h1>Alta de usuario</h1>
    <form class="user" action="SvUsuario" method="POST">
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" name="nombreUsuario"
                       placeholder="Nombre Usuario">
            </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="password" class="form-control form-control-user" name="contrasenia"
                   placeholder="Contraseña">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="rol"
                   placeholder="Rol">
        </div>
        </div>
        <button type="submit" class="btn btn-primary btn-user btn-block col-sm-6">
            Registrar Usuario
        </button>
        <hr>
        
    </form>


    <%@include file="components/footer.jsp" %>
    <%@include file="components/scripts.jsp" %>
</html>