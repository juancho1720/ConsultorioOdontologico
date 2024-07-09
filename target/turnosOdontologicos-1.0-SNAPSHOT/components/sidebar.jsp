<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
   String roli = (String)request.getSession().getAttribute("rol");
%>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-solid fa-tooth"></i>
                </div>
                <div class="sidebar-brand-text mx-3">CONSULTORIO ODONTOLÓGICO</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#turnos"
                   aria-expanded="true" aria-controls="turnos">
                    <i class="fas fa-hospital-user"></i>
                    <span>Turnos</span>
                </a>
                <div id="turnos" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Acciones:</h6>
                        <a class="collapse-item" href="altaTurno.jsp">Alta Turnos</a>
                        <a class="collapse-item" href="SvTurno">Ver turnos por fecha</a>
                        <a class="collapse-item" href="SvTurnoFecha">Ver turnos por paciente</a>              
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                   aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-solid fa-user"></i>
                    <span>Pacientes</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Acciones:</h6>
                        <a class="collapse-item" href="SvPaciente">Ver Pacientes</a>
                        <a class="collapse-item" href="altaPaciente.jsp">Alta Pacientes</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Pages Collapse Menu -->
            <% 
                if (roli.equals("Secretario") || roli.equals("Admin")) {
            %>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                   aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-hospital-user"></i>
                    <span>Odontólogos</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Acciones:</h6>
                        <a class="collapse-item" href="SvOdontologo">Ver Odontólogos</a>
                        <a class="collapse-item" href="altaOdontologo.jsp">Alta Odontólogos</a>
                    </div>
                </div>
            </li>

            <% } %>


            <%
                if (roli.equals("Admin")) {
            %>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#usuarios"
                   aria-expanded="true" aria-controls="usuarios">
                    <i class="fas fa-solid fa-user"></i>
                    <span>Usuarios</span>
                </a>
                <div id="usuarios" class="collapse" aria-labelledby="headingUtilities"
                     data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Acciones:</h6>
                        <a class="collapse-item" href="SvUsuario">Ver Usuarios</a>
                        <a class="collapse-item" href="altaUsuario.jsp">Alta Usuarios</a>
                    </div>
                </div>
            </li>
            <% }%>
        </ul>
        <!-- End of Sidebar -->