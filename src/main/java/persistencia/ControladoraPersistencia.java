package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Odontologo;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;


public class ControladoraPersistencia {
    
    HorarioJpaController horaJPA = new HorarioJpaController();
    OdontologoJpaController odontoJPA = new OdontologoJpaController();
    PacienteJpaController pacienteJPA = new PacienteJpaController();
    PersonaJpaController personaJPA = new PersonaJpaController();
    ResponsableJpaController responsableJPA = new ResponsableJpaController();
    SecretarioJpaController secretarioJPA = new SecretarioJpaController();
    TurnoJpaController turnoJPA = new TurnoJpaController();
    
    UsuarioJpaController usuarioJPA = new UsuarioJpaController();
    
    

    
    
    public void crearUsuario(Usuario usu) {
        
        usuarioJPA.create(usu);
    
    }

    public List<Usuario> getUsuarios() {
    
        return usuarioJPA.findUsuarioEntities();
        
    }

    public void borrarUsuario(int id) {
        
        
        try {
            usuarioJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public Usuario traerUsuario(int id) {
        
        return usuarioJPA.findUsuario(id);
        
    }

    public void editarUsuario(Usuario usu) {
        try {
            usuarioJPA.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void CrearOdontologo(Odontologo odonto) {
        
        odontoJPA.create(odonto);
        
    }

    public List<Odontologo> getOdontologos() {
        
        return odontoJPA.findOdontologoEntities();
        
    }

    public void borrarOdontologo(int id) {
        
        try {
            odontoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public Odontologo traerOdonto(int id) {
       
        return odontoJPA.findOdontologo(id);
        
    }

    public void editarOdontologo(Odontologo odonto) {
        
        try {
            odontoJPA.edit(odonto);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
