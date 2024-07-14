<%@page import="java.util.ArrayList"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="logica.Turno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>
    
    <% 
        ControladoraLogica control = new ControladoraLogica();
        List<Turno> turnosXFecha = new ArrayList<Turno>();
        turnosXFecha = (List) request.getSession().getAttribute("listaTurnoXFecha"); 
        List<Turno> listaTurnosFiltrados = new ArrayList<Turno>();
        int id_odonto = (int) request.getSession().getAttribute("id_odonto");
        for (Turno tur : turnosXFecha) {
            if (id_odonto == tur.getOdonto().getId()){
                listaTurnosFiltrados.add(tur);
            }
        }
    %>
    
    <% if(turnosXFecha.size() == 0) { %>
    <div class="ml-3 col-sm-6 mb-sm-0">
        <h2>No hay turnos en la fecha indicada</h2>
        <a class="btn btn-primary btn-user btn-block col-sm-6 mt-3" href="verPacientesXFecha.jsp">Volver</a>
    </div>
    
    <% } else { 
    %>
        
     <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">TURNOS</h6>
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
                            <% for (Turno tur : turnosXFecha) {%>

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
        
    <% } %>
    
    <% 
        turnosXFecha.clear();
    %>
    <%@include file="components/footer.jsp" %>
    <%@include file="components/scripts.jsp" %>
</html>
