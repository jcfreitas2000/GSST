package br.com.gsst.model;
// Generated 22/07/2016 15:45:22 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Empresa generated by hbm2java
 */
@Entity
@Table(name="empresa"
    ,schema="public"
)
public class Empresa  implements java.io.Serializable {


     private int idEmpresa;
     private String nome;
     private Set unidades = new HashSet(0);

    public Empresa() {
    }

	
    public Empresa(int idEmpresa, String nome) {
        this.idEmpresa = idEmpresa;
        this.nome = nome;
    }
    public Empresa(int idEmpresa, String nome, Set unidades) {
       this.idEmpresa = idEmpresa;
       this.nome = nome;
       this.unidades = unidades;
    }
   
     @Id 

    
    @Column(name="id_empresa", unique=true, nullable=false)
    public int getIdEmpresa() {
        return this.idEmpresa;
    }
    
    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    
    @Column(name="nome", nullable=false)
    public String getNome() {
        return this.nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="empresa")
    public Set getUnidades() {
        return this.unidades;
    }
    
    public void setUnidades(Set unidades) {
        this.unidades = unidades;
    }




}


