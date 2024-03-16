package persistencia;

import logica.Usuario;


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
    
}
