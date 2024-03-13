package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Paciente extends Persona implements Serializable{
    
    private Boolean tiene_OS;
    private String tipo_sangre;
    @OneToOne
    private Responsable responsable;
    @OneToMany(mappedBy="pacien")
    private List<Turno> turnos;

    public Paciente() {
    }

    public Paciente(Boolean tiene_OS, String tipo_sangre, Responsable responsable, List<Turno> turnos, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nac);
        this.tiene_OS = tiene_OS;
        this.tipo_sangre = tipo_sangre;
        this.responsable = responsable;
        this.turnos = turnos;
    }

    

    

    public List<Turno> getTurnos() {
        return turnos;
    }

    public void setTurnos(List<Turno> turnos) {
        this.turnos = turnos;
    }

    

    public Responsable getResponsable() {
        return responsable;
    }

    public void setResponsable(Responsable responsable) {
        this.responsable = responsable;
    }


    public Boolean getTiene_OS() {
        return tiene_OS;
    }

    public void setTiene_OS(Boolean tiene_OS) {
        this.tiene_OS = tiene_OS;
    }

    public String getTipo_sangre() {
        return tipo_sangre;
    }

    public void setTipo_sangre(String tipo_sangre) {
        this.tipo_sangre = tipo_sangre;
    }
    
    
    
}
