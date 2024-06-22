<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Turno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">


    <%@include file="components/head.jsp" %>
    <%@include file="components/sidebar.jsp" %>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/main.jsp" %>

    <%  List<Turno> listaTurnos = new ArrayList<Turno>();
        ControladoraLogica control = new ControladoraLogica();

        listaTurnos = control.getTurnos();
        int id_odonto = (int) request.getSession().getAttribute("id_odonto");
        Date todaydate = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String fechaActual = sdf.format(todaydate);
    %>

    <h2>Turnos para hoy</h2>
    <hr> 

    <div class="container-fluid">
        <div class="row row-cols-1 row-cols-md-4 g-4 ">


            <%
                if (rol.equals("Odontologo")) {
                    for (Turno tur : listaTurnos) {
                        if (tur.getOdonto().getId() == id_odonto && (fechaActual.equals(sdf.format(tur.getFecha_turno())))) {
            %>

            <div class="card text-white bg-success mb-3 col" style="max-width: 18rem;margin: 0px 50px;">
                <div class="card-header bg-success"><%= tur.getHorario()%> - <%= tur.getFecha_turno().getDate()%>/<%= tur.getFecha_turno().getMonth() + 1%>/<%= tur.getFecha_turno().getYear() + 1900%></div>
                <div class="card-body">
                    <h5 class="card-title"><%= control.traerPaciente(tur.getPacien().getId()).getApellido()%>, <%= control.traerPaciente(tur.getPacien().getId()).getNombre()%></h5>
                    <p class="card-text"><%= tur.getAfeccion()%></p>


                </div>

                <div>
                    <form name="editar" action="SvEditarTurno" method="GET">
                        <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-bottom: 10px">
                            Ver Turno
                        </button>
                        <input type="hidden" name="id_editar" value="<%= tur.getId_turno()%>">
                    </form>
                </div>

            </div>

            <% }
                }
            } else {
                for (Turno tur : listaTurnos) {
                    if (fechaActual.equals(sdf.format(tur.getFecha_turno()))) {
            %>

            <div class="card text-white bg-success mb-3 col" style="max-width: 18rem;margin: 0px 50px;">
                <div class="card-header bg-success"><%= tur.getHorario()%> - <%= tur.getFecha_turno().getDate()%>/<%= tur.getFecha_turno().getMonth() + 1%>/<%= tur.getFecha_turno().getYear() + 1900%></div>
                <div class="card-body">
                    <h5 class="card-title"><%= control.traerPaciente(tur.getPacien().getId()).getApellido()%>, <%= control.traerPaciente(tur.getPacien().getId()).getNombre()%></h5>
                    <h6 class="card-text">Doc: <%= control.traerOdontologo(tur.getOdonto().getId()).getApellido()%>, <%= control.traerOdontologo(tur.getOdonto().getId()).getNombre() %></h6>
                </div>
                <div>
                    <form name="editar" action="SvEditarTurno" method="GET">
                        <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-bottom: 10px">
                            Ver Turno
                        </button>
                        <input type="hidden" name="id_editar" value="<%= tur.getId_turno()%>">
                    </form>
                </div>

            </div>



            <% } } }%>
        </div>
    </div>


    <%@include file="components/footer.jsp" %>
    <%@include file="components/scripts.jsp" %>


</html>