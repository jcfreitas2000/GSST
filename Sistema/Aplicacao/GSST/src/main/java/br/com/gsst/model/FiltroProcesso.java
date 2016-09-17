package br.com.gsst.model;

import java.util.Date;

/*
    Autor: José Carlos de Freitas
    Data: 16/09/2016, 08:36:27
    Arquivo: Filtro
*/

public class FiltroProcesso {

    private int idMaquina;
    private String localizacao;
    private String setor;
    
    private boolean relatadoPorMim;
    private boolean minhaResponsabilidade;
    private boolean resolvidoPorMim;
    
    private Date relatadoEmInicial;
    private Date relatadoEmFinal;
    private Date prazoInicial;
    private Date prazoFinal;
    private Date resolvidoEmInicial;
    private Date resolvidoEmFinal;

    public FiltroProcesso() {
    }

    public FiltroProcesso(int idMaquina, String localizacao, String setor, boolean relatadoPorMim, boolean minhaResponsabilidade, boolean resolvidoPorMim, Date relatadoEmInicial, Date relatadoEmFinal, Date prazoInicial, Date prazoFinal, Date resolvidoEmInicial, Date resolvidoEmFinal) {
        this.idMaquina = idMaquina;
        this.localizacao = localizacao;
        this.setor = setor;
        this.relatadoPorMim = relatadoPorMim;
        this.minhaResponsabilidade = minhaResponsabilidade;
        this.resolvidoPorMim = resolvidoPorMim;
        this.relatadoEmInicial = relatadoEmInicial;
        this.relatadoEmFinal = relatadoEmFinal;
        this.prazoInicial = prazoInicial;
        this.prazoFinal = prazoFinal;
        this.resolvidoEmInicial = resolvidoEmInicial;
        this.resolvidoEmFinal = resolvidoEmFinal;
    }

    public int getIdMaquina() {
        return idMaquina;
    }

    public void setIdMaquina(int idMaquina) {
        this.idMaquina = idMaquina;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public String getSetor() {
        return setor;
    }

    public void setSetor(String setor) {
        this.setor = setor;
    }

    public boolean isRelatadoPorMim() {
        return relatadoPorMim;
    }

    public void setRelatadoPorMim(boolean relatadoPorMim) {
        this.relatadoPorMim = relatadoPorMim;
    }

    public boolean isMinhaResponsabilidade() {
        return minhaResponsabilidade;
    }

    public void setMinhaResponsabilidade(boolean minhaResponsabilidade) {
        this.minhaResponsabilidade = minhaResponsabilidade;
    }

    public boolean isResolvidoPorMim() {
        return resolvidoPorMim;
    }

    public void setResolvidoPorMim(boolean resolvidoPorMim) {
        this.resolvidoPorMim = resolvidoPorMim;
    }

    public Date getRelatadoEmInicial() {
        return relatadoEmInicial;
    }

    public void setRelatadoEmInicial(Date relatadoEmInicial) {
        this.relatadoEmInicial = relatadoEmInicial;
    }

    public Date getRelatadoEmFinal() {
        return relatadoEmFinal;
    }

    public void setRelatadoEmFinal(Date relatadoEmFinal) {
        this.relatadoEmFinal = relatadoEmFinal;
    }

    public Date getPrazoInicial() {
        return prazoInicial;
    }

    public void setPrazoInicial(Date prazoInicial) {
        this.prazoInicial = prazoInicial;
    }

    public Date getPrazoFinal() {
        return prazoFinal;
    }

    public void setPrazoFinal(Date prazoFinal) {
        this.prazoFinal = prazoFinal;
    }

    public Date getResolvidoEmInicial() {
        return resolvidoEmInicial;
    }

    public void setResolvidoEmInicial(Date resolvidoEmInicial) {
        this.resolvidoEmInicial = resolvidoEmInicial;
    }

    public Date getResolvidoEmFinal() {
        return resolvidoEmFinal;
    }

    public void setResolvidoEmFinal(Date resolvidoEmFinal) {
        this.resolvidoEmFinal = resolvidoEmFinal;
    }
    
    
}
