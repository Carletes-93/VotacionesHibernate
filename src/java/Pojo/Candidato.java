package Pojo;
// Generated 17-abr-2017 13:20:06 by Hibernate Tools 4.3.1



/**
 * Candidato generated by hbm2java
 */
public class Candidato  implements java.io.Serializable {


     private Integer idCandidato;
     private Partido partido;
     private String nombre;
     private int orden;
     private String escano;

    public Candidato() {
    }

    public Candidato(Partido partido, String nombre, int orden, String escano) {
       this.partido = partido;
       this.nombre = nombre;
       this.orden = orden;
       this.escano = escano;
    }
   
    public Integer getIdCandidato() {
        return this.idCandidato;
    }
    
    public void setIdCandidato(Integer idCandidato) {
        this.idCandidato = idCandidato;
    }
    public Partido getPartido() {
        return this.partido;
    }
    
    public void setPartido(Partido partido) {
        this.partido = partido;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getOrden() {
        return this.orden;
    }
    
    public void setOrden(int orden) {
        this.orden = orden;
    }
    public String getEscano() {
        return this.escano;
    }
    
    public void setEscano(String escano) {
        this.escano = escano;
    }




}


