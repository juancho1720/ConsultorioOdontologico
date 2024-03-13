package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Odontologo extends Persona implements Serializable{
    
    private String especialidad;
    @OneToOne
    private Usuario usuario;
    @OneToMany(mappedBy="odonto")
    private List<Turno> listaTurnos;
    @OneToOne
    private Horario horario;

    public Odontologo() {
    }

    public Odontologo(String especialidad, Usuario usuario, List<Turno> listaTurnos, Horario horario, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nac);
        this.especialidad = especialidad;
        this.usuario = usuario;
        this.listaTurnos = listaTurnos;
        this.horario = horario;
    }

    

    

    public Horario getHorario() {
        return horario;
    }

    public void setHorario(Horario horario) {
        this.horario = horario;
    }

    

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public List<Turno> getListaTurnos() {
        return listaTurnos;
    }

    public void setListaTurnos(List<Turno> listaTurnos) {
        this.listaTurnos = listaTurnos;
    }


    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    
    
}
