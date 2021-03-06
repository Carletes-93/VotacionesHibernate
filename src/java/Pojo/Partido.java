package Pojo;
// Generated 17-abr-2017 13:20:06 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Partido generated by hbm2java
 */
public class Partido  implements java.io.Serializable {


     private Integer idPartido;
     private String nombre;
     private String logo;
     private float numVotos;
     private List<Candidato> candidatos;

    public Partido() {
    }

    public Partido(String nombre, String logo, float numVotos) {
       this.nombre = nombre;
       this.logo = logo;
       this.numVotos = numVotos;
    }
   
    public Integer getIdPartido() {
        return this.idPartido;
    }
    
    public void setIdPartido(Integer idPartido) {
        this.idPartido = idPartido;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getLogo() {
        return this.logo;
    }
    
    public void setLogo(String logo) {
        this.logo = logo;
    }
    public float getNumVotos() {
        return this.numVotos;
    }
    
    public void setNumVotos(float numVotos) {
        this.numVotos = numVotos;
    }
    public List getCandidatos() {
        return this.candidatos;
    }
    
    public void setCandidatos(List candidatos) {
        this.candidatos = candidatos;
    }




}


