<%@page import="java.util.Optional"%>
<%@page import="logica.Responsable"%>
<%@page import="logica.Paciente"%>
<%@page import="logica.Odontologo"%>
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
                <h6 class="m-0 font-weight-bold text-primary">PACIENTES</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Apellido</th>
                                <th>Nombre</th>
                                <th>Teléfono</th>
                                <th>Tipo de sangre</th>
                                <<th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Apellido</th>
                                <th>Nombre</th>
                                <th>Teléfono</th>
                                <th>Tipo de sangre</th>
                                <<th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>

                        <%  List<Paciente> listaPacientes = (List) request.getSession().getAttribute("listaPacientes"); 
                            
                        %>

                        <tbody>
                            <% for (Paciente paciente : listaPacientes) { %>
                        
                            <tr>
                                <td><%= paciente.getApellido()%></td>
                                <td><%= paciente.getNombre()%></td>
                                <td><%= paciente.getTelefono()%> </td>
                                <td><%= paciente.getTipo_sangre()%></td>
                                

                                <<td style="display: flex; width: 230px;">
                                    <form id="eliminarPaciente" name="eliminar" action="SvEliminarPaciente" method="POST">
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px">
                                            <i class="fas fa-trash-alt"></i> Eliminar
                                        </button>                                        
                                        <input type="hidden" id="id_eliminar" name="id_eliminar" value="<%= paciente.getId()%>">
                                    </form>
                                    <form name="editar" action="SvEditarPacientes" method="GET">
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px">
                                            <i class="fas fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id_editar" value="<%= paciente.getId()%>">
                                    </form>
                                </td>
                            </tr>

                            <% }%>
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