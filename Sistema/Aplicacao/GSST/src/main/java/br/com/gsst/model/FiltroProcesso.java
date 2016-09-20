package br.com.gsst.model;

import java.text.Normalizer;
import java.util.Date;
import org.hibernate.Query;

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

    public boolean isFiltro() {
        if (this.idMaquina > 0) {
            return true;
        }
        if (this.localizacao.trim().length() > 0 || this.setor.trim().length() > 0) {
            return true;
        }
        if (this.minhaResponsabilidade || this.relatadoPorMim || this.resolvidoPorMim) {
            return true;
        }
        if (this.relatadoEmFinal != null || this.relatadoEmInicial != null
                || this.prazoInicial != null || this.prazoFinal != null
                || this.resolvidoEmInicial != null || this.resolvidoEmFinal != null) {
            return true;
        }

        return false;
    }

    public String getFiltros() {
        String filtros = "";

        if (this.idMaquina > 0) {
            filtros += " AND maquina.idMaquina = :idMaquina ";
        }
        if (this.localizacao.trim().length() > 0) {
            filtros += " AND lower(TRANSLATE(localizacao,'ÁáÂâÀàÃãÉéÊêÈèÍíÎîÌìÓóÔôÒòÕõÚúÛûÙùÇç','aaaaaaaaeeeeeeiiiiiioooooooouuuuuucc')) like :localizacao";
        }
        if (this.setor.trim().length() > 0) {
            filtros += " AND lower(TRANSLATE(setor,'ÁáÂâÀàÃãÉéÊêÈèÍíÎîÌìÓóÔôÒòÕõÚúÛûÙùÇç','aaaaaaaaeeeeeeiiiiiioooooooouuuuuucc')) like :setor";
        }
        
        if (this.minhaResponsabilidade) {
            filtros += " AND funcionarioByIdRespCorrecao.idFuncionario = :minhaResponsabilidade";
        }
        if (this.relatadoPorMim) {
            filtros += " AND funcionarioByIdRelator.idFuncionario = :relatadoPorMim";
        }
        if (this.resolvidoPorMim){
            filtros += " AND funcionarioByIdResolucao.idFuncionario = :resolvidoPorMim";
        }
        
        if (this.relatadoEmInicial != null){
            filtros += " AND data >= :relatadoEmInicial";
        }
        if (this.relatadoEmFinal != null){
            filtros += " AND data <= :relatadoEmFinal";
        }
        
        if (this.prazoInicial != null){
            filtros += " AND prazo >= :prazoInicial";
        }
        if (this.prazoFinal != null){
            filtros += " AND prazo <= :prazoFinal";
        }
        
        if (this.resolvidoEmInicial != null){
            filtros += " AND dataResolucao >= :resolvidoEmInicial";
        }
        if (this.resolvidoEmFinal != null){
            filtros += " AND dataResolucao <= :resolvidoEmFinal";
        }

        return filtros;
    }
    
    public Query getQuery(Query q, int idFuncionario) {
        if (this.idMaquina > 0) {
            q.setInteger("idMaquina", this.idMaquina);
        }
        if (this.localizacao.trim().length() > 0) {
            q.setString("localizacao", "%" + Normalizer.normalize(this.localizacao, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").toLowerCase() + "%");
        }
        if (this.setor.trim().length() > 0) {
            q.setString("setor", "%" + Normalizer.normalize(this.setor, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").toLowerCase() + "%");
        }
        
        if (this.minhaResponsabilidade) {
            q.setInteger("minhaResponsabilidade", idFuncionario);
        }
        if (this.relatadoPorMim) {
            q.setInteger("relatadoPorMim", idFuncionario);
        }
        if (this.resolvidoPorMim){
            q.setInteger("resolvidoPorMim", idFuncionario);
        }
        
        if (this.relatadoEmInicial != null){
            q.setDate("relatadoEmInicial", this.relatadoEmInicial);
        }
        if (this.relatadoEmFinal != null){
            q.setDate("relatadoEmFinal", this.relatadoEmFinal);
        }
        
        if (this.prazoInicial != null){
            q.setDate("prazoInicial", this.prazoInicial);
        }
        if (this.prazoFinal != null){
            q.setDate("prazoFinal", this.prazoFinal);
        }
        
        if (this.resolvidoEmInicial != null){
            q.setDate("resolvidoEmInicial", this.resolvidoEmInicial);
        }
        if (this.resolvidoEmFinal != null){
            q.setDate("resolvidoEmFinal", this.resolvidoEmFinal);
        }

        return q;
    }
}
