<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>
    
    
    <div class="ml-3">
    <h1>Edición de usuario</h1>
    
    <% Usuario usu = (Usuario)request.getSession().getAttribute("usuEdit"); %>
    
    <form class="user" action="SvEditarUsuarios" method="POST">
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" name="nombreUsuario"
                       placeholder="Nombre Usuario" value="<%= usu.getNombre_usuario() %>">
            </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="password" class="form-control form-control-user" name="contrasenia"
                   placeholder="Contraseña" value="<%= usu.getContrasenia() %>">
        </div>
        </div>
        <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" name="rol"
                   placeholder="Rol" value="<%= usu.getRol() %>">
        </div>
        </div>
        <button type="submit" class="btn btn-primary btn-user btn-block col-sm-6">
            Editar Usuario
        </button>
        
        
    </form>
    </div>

    <%@include file="components/footer.jsp" %>
    <%@include file="components/scripts.jsp" %>
</html>