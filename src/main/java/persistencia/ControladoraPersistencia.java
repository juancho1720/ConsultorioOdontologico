package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Responsable;
import logica.Turno;
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

    public void crearPaciente(Paciente paciente) {
        
        pacienteJPA.create(paciente);
        
    }

    public List<Paciente> getPacientes() {
        
        return pacienteJPA.findPacienteEntities();
        
    }

    public void borrarPaciente(int id) {
        
        try {
            pacienteJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public Paciente traerPaciente(int id) {
        
        return pacienteJPA.findPaciente(id);
        
    }

    public void editarPaciente(Paciente paciente) {
        
        try {
            pacienteJPA.edit(paciente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public void crearTurno(Turno turno) {
        
        turnoJPA.create(turno);
        
    }

    public List<Turno> getTurnos() {
        
        return turnoJPA.findTurnoEntities();
        
    }

    public void borrarTurno(int id) {
        
        try {
            turnoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public Turno traerTurno(int id) {
        
        return turnoJPA.findTurno(id);
        
    }


    public void editTurno(Turno turno) {
        
        try {
            turnoJPA.edit(turno);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public List<Horario> getHorarios() {
        
        return horaJPA.findHorarioEntities();
        
    }

    public List<Responsable> getResponsables() {
        
        return responsableJPA.findResponsableEntities();
        
    }

    
    
}
