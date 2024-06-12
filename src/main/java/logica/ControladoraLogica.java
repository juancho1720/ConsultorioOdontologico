package logica;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import persistencia.ControladoraPersistencia;


public class ControladoraLogica {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void crearUsuario(String nombreUsuario, String contrasenia, String rol){
    
        Usuario usu = new Usuario();
        usu.setNombre_usuario(nombreUsuario);
        usu.setContrasenia(contrasenia);
        usu.setRol(rol);
        controlPersis.crearUsuario(usu);
        
    }

    public List<Usuario> getUsuarios() {
        
        return controlPersis.getUsuarios();
        
    }

    public void borrarUsuario(int id) {
        
        controlPersis.borrarUsuario(id);
        
    }

    public Usuario traerUsuario(int id) {
        
        return controlPersis.traerUsuario(id);
        
    }

    public void editarUsuario(Usuario usu) {
        
        controlPersis.editarUsuario(usu);
        
    }

    public boolean comprobarIngreso(String usuario, String contrasenia) {
        
        boolean ingreso = false;
        
        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        listaUsuarios = controlPersis.getUsuarios();
        
        for(Usuario usu : listaUsuarios){
            if(usu.getNombre_usuario().equals(usuario)){
                if(usu.getContrasenia().equals(contrasenia)){
                    ingreso = true;
                }
            }
        }
        
        return ingreso;
        
    }

    public void crearOdontologo(String nombre, String apellido, String dni, String telefono, String direccion, Date fecha_nac, String especialidad, int id_horario, int id_usuario) {
        
        Odontologo odonto = new Odontologo();
        odonto.setNombre(nombre);
        odonto.setApellido(apellido);
        odonto.setDni(dni);
        odonto.setTelefono(telefono);
        odonto.setDireccion(direccion);
        odonto.setFecha_nac(fecha_nac);
        odonto.setEspecialidad(especialidad);
        Horario hora = new Horario();
        hora.setId_horario(id_horario);
        odonto.setHorario(hora);
        Usuario usu = new Usuario();
        usu.setId_usuario(id_usuario);
        odonto.setUsuario(usu);
        
        controlPersis.CrearOdontologo(odonto);
        
    }

    public List<Odontologo> getOdontologos() {
        
        return controlPersis.getOdontologos();
        
    }

    public void borrarOdontologo(int id) {
        
        
        controlPersis.borrarOdontologo(id);
        
    }

    public Odontologo traerOdontologo(int id) {
        
        return controlPersis.traerOdonto(id);
        
    }

    public void editarOdontologo(Odontologo odonto) {
        
        controlPersis.editarOdontologo(odonto);
        
    }

    public void crearPaciente(String nombre, String apellido, String dni, String telefono, String direccion, java.sql.Date fecha_sql, String tipoSangre, int id_responsable) {
        
        Paciente paciente = new Paciente();
        paciente.setNombre(nombre);
        paciente.setApellido(apellido);
        paciente.setDni(dni);
        paciente.setTelefono(telefono);
        paciente.setDireccion(direccion);
        paciente.setFecha_nac(fecha_sql);
        paciente.setTipo_sangre(tipoSangre);
        paciente.setTiene_OS(true);
        Responsable res = new Responsable();
        if(id_responsable == 0){
            res = null;
        }
        else{
            res.setId(id_responsable);
        }
         
        
        paciente.setResponsable(res);
        
        controlPersis.crearPaciente(paciente);
        
    }

    public List<Paciente> getPacientes() {
        
        return controlPersis.getPacientes();
        
    }

    public void borrarPaciente(int id) {
        
        controlPersis.borrarPaciente(id);
        
    }

    public Paciente traerPaciente(int id) {
        
       return controlPersis.traerPaciente(id);
        
    }

    public void editarPaciente(Paciente paciente) {
        
        controlPersis.editarPaciente(paciente);
        
    }

    public void crearTurno(String observacion, String horario, int id_paciente, int id_odonto, java.sql.Date fecha_sql) {
        
        Turno turno = new Turno();
        Paciente pac = new Paciente();
        pac.setId(id_paciente);
        Odontologo odon = new Odontologo();
        odon.setId(id_odonto);
        
        turno.setAfeccion(observacion);
        turno.setHorario(horario);
        turno.setFecha_turno(fecha_sql);
        turno.setOdonto(odon);
        turno.setPacien(pac);
        
        controlPersis.crearTurno(turno);
        
    }

    public List<Turno> getTurnos() {
        
        return controlPersis.getTurnos();
        
    }

    public void borrarTurno(int id) {
        
        controlPersis.borrarTurno(id);
        
    }

    public Turno TraerTurno(int id) {
        
        return controlPersis.traerTurno(id);
        
    }


    public void editTurno(Turno turno) {
        
        controlPersis.editTurno(turno);
        
    }
    
    
    public List<Horario> getHorarios() {
        
        return controlPersis.getHorarios();
        
    }
    
    public List<Responsable> getResponsables() {
        
        return controlPersis.getResponsables();
    }
    
}
