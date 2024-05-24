package logica;

import java.util.ArrayList;
import java.util.Date;
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
    
}
