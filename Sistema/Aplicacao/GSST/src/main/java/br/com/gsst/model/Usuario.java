package br.com.gsst.model;
// Generated 22/07/2016 15:45:22 by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.validation.Valid;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.validator.constraints.NotBlank;

/**
 * Usuario generated by hbm2java
 */
@Entity
@Table(name = "usuario", schema = "public"
)
public class Usuario implements java.io.Serializable {

    private int idFuncionario;
    @Valid
    private Funcionario funcionario;
    @NotBlank(message = "{usuario.senha.blank}")
    private String senha;
    private boolean ativo;
    private String nivelAcesso;

    public Usuario() {
    }

    public Usuario(Funcionario funcionario, String senha, boolean ativo) {
        this.funcionario = funcionario;
        this.senha = senha;
        this.ativo = ativo;
    }

    public Usuario(Funcionario funcionario, String senha, boolean ativo, String nivelAcesso) {
        this.funcionario = funcionario;
        this.senha = senha;
        this.ativo = ativo;
        this.nivelAcesso = nivelAcesso;
    }

    @GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "funcionario"))
    @Id
    @GeneratedValue(generator = "generator")

    @Column(name = "id_funcionario", unique = true, nullable = false)
    public int getIdFuncionario() {
        return this.idFuncionario;
    }

    public void setIdFuncionario(int idFuncionario) {
        this.idFuncionario = idFuncionario;
    }

    @OneToOne(fetch = FetchType.LAZY)
    @PrimaryKeyJoinColumn
    public Funcionario getFuncionario() {
        return this.funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    @Column(name = "senha", nullable = false)
    public String getSenha() {
        return this.senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    @Column(name = "ativo", nullable = false)
    public boolean isAtivo() {
        return this.ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }

    @Column(name = "nivel_acesso")
    public String getNivelAcesso() {
        return this.nivelAcesso;
    }

    public void setNivelAcesso(String nivelAcesso) {
        this.nivelAcesso = nivelAcesso;
    }

}