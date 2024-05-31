<%@page import="logica.Turno"%>
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

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Tables</h1>
        <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
        For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Horario</th>
                                <th>Paciente</th>
                                <th>Odontólogo</th>
                                <<th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Fecha</th>
                                <th>Horario</th>
                                <th>Paciente</th>
                                <th>Odontólogo</th>
                                <<th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>

                        <%  List<Turno> listaTurnos = (List) request.getSession().getAttribute("listaTurnos"); 
                            
                        %>

                        <tbody>
                            <% for (Turno tur : listaTurnos) { %>
                        
                            <tr>
                                <td><%= tur.getFecha_turno().getDate() %>/<%= tur.getFecha_turno().getMonth() %>/<%= tur.getFecha_turno().getYear() + 1900 %></td>
                                <td><%= tur.getHorario() %></td>
                                <td><%= tur.getPacien().getId() %> </td>
                                <td><%= tur.getOdonto().getId() %></td>
                                

                                <<td style="display: flex; width: 230px;">
                                    <form name="eliminar" action="SvEliminarPaciente" method="POST">
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px">
                                            <i class="fas fa-trash-alt"></i> Eliminar
                                        </button>                                        
                                        <input type="hidden" name="id_eliminar" value="<%= tur.getId_turno() %>">
                                    </form>
                                    <form name="editar" action="SvEditarPacientes" method="GET">
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px">
                                            <i class="fas fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id_editar" value="<%= tur.getId_turno() %>">
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