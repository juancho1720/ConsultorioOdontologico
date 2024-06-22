<%@page import="java.util.ArrayList"%>
<%@page import="logica.ControladoraLogica"%>
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

    <%  
        List<Turno> listaTurnos = (List) request.getSession().getAttribute("listaTurnos");
        List<Turno> listaTurnosFiltrados = new ArrayList<Turno>();
        int id_odonto = (int) request.getSession().getAttribute("id_odonto");
        ControladoraLogica control = new ControladoraLogica();
        for (Turno tur : listaTurnos) {
            if (id_odonto == tur.getOdonto().getId()){
                listaTurnosFiltrados.add(tur);
            }
        }
    %>

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Turnos</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <% if (rol.equals("Odontologo")) { %>
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Horario</th>
                                <th>Paciente</th>
                                <th>Grupo sanguíneo</th>
                                <<th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Fecha</th>
                                <th>Horario</th>
                                <th>Paciente</th>
                                <th>Grupo sanguíneo</th>
                                <<th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>



                        <tbody>
                            <%
                                for (Turno tur : listaTurnosFiltrados) {
                                    
                            %>

                            <tr>
                                <td><%= tur.getFecha_turno().getDate()%>/<%= tur.getFecha_turno().getMonth() + 1%>/<%= tur.getFecha_turno().getYear() + 1900%></td>
                                <td><%= tur.getHorario()%></td>
                                <td><%= control.traerPaciente(tur.getPacien().getId()).getApellido()%>, <%= control.traerPaciente(tur.getPacien().getId()).getNombre()%> </td>
                                <td><%= control.traerPaciente(tur.getPacien().getId()).getTipo_sangre()%></td>


                                <<td style="display: flex; width: 230px;">
                                    <form name="eliminar" action="SvEliminarTurno" method="POST">
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px">
                                            <i class="fas fa-trash-alt"></i> Eliminar
                                        </button>                                        
                                        <input type="hidden" name="id_eliminar" value="<%= tur.getId_turno()%>">
                                    </form>
                                    <form name="editar" action="SvEditarTurno" method="GET">
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px">
                                            <i class="fas fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id_editar" value="<%= tur.getId_turno()%>">
                                    </form>
                                </td>
                            </tr>

                            <% }%>
                        </tbody>

                        <% }  else { %>
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



                        <tbody>
                            <% for (Turno tur : listaTurnos) {%>

                            <tr>
                                <td><%= tur.getFecha_turno().getDate()%>/<%= tur.getFecha_turno().getMonth() + 1%>/<%= tur.getFecha_turno().getYear() + 1900%></td>
                                <td><%= tur.getHorario()%></td>
                                <td><%= control.traerPaciente(tur.getPacien().getId()).getApellido()%>, <%= control.traerPaciente(tur.getPacien().getId()).getNombre()%> </td>
                                <td><%= control.traerOdontologo(tur.getOdonto().getId()).getApellido()%>, <%= control.traerOdontologo(tur.getOdonto().getId()).getNombre()%></td>


                                <<td style="display: flex; width: 230px;">
                                    <form name="eliminar" action="SvEliminarTurno" method="POST">
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px">
                                            <i class="fas fa-trash-alt"></i> Eliminar
                                        </button>                                        
                                        <input type="hidden" name="id_eliminar" value="<%= tur.getId_turno()%>">
                                    </form>
                                    <form name="editar" action="SvEditarTurno" method="GET">
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px">
                                            <i class="fas fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id_editar" value="<%= tur.getId_turno()%>">
                                    </form>
                                </td>
                            </tr>

                            <% }%>
                        </tbody>
                        <% }%>
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