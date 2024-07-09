<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>

    <!-- Begin Page Content -->
    <div class="container-fluid">


        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">USUARIOS</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Nombre de usuario</th>
                                <th>Rol</th>
                                <<th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Nombre de usuario</th>
                                <th>Rol</th>
                                <<th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>
                        
                        <% 
                          List<Usuario> listaUsuarios = (List)request.getSession().getAttribute("listaUsuarios");
                        %>
                        
                        <tbody>
                            <% for(Usuario usu : listaUsuarios) { %>
                            
                            <tr>
                                <td><%= usu.getNombre_usuario() %></td>
                                <td><%= usu.getRol() %></td>
                                <<td style="display: flex; width: 230px;">
                                    <form id="eliminarUsuario" name="eliminar" action="SvEliminarUsuarios" method="POST">
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px">
                                            <i class="fas fa-trash-alt"></i> Eliminar
                                        </button>                                        
                                        <input type="hidden" id="id_eliminar" name="id_eliminar" value="<%= usu.getId_usuario() %>">
                                    </form>
                                    <form name="editar" action="SvEditarUsuarios" method="GET">
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px">
                                            <i class="fas fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" id="id_editar" name="id_editar" value="<%= usu.getId_usuario() %>">
                                    </form>
                                </td>
                            </tr>
                            
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="components/footer.jsp" %>
<%@include file="components/scripts.jsp" %>
</html>