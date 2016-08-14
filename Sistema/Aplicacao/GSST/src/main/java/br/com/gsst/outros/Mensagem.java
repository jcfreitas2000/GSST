package br.com.gsst.outros;

public class Mensagem {

    private boolean mensagem;
    private String tipoAlert;
    private String titulo;
    private String texto;

    //Construtores
    public Mensagem() {
    }

    public Mensagem(boolean erro) {
        this.mensagem = erro;
    }

    public Mensagem(boolean erro, String tipoAlert, String tituloMensagem) {
        this.mensagem = erro;
        this.tipoAlert = tipoAlert;
        this.titulo = tituloMensagem;
    }

    public Mensagem(boolean erro, String tipoAlert, String tituloMensagem, String mensagem) {
        this.mensagem = erro;
        this.tipoAlert = tipoAlert;
        this.titulo = tituloMensagem;
        this.texto = mensagem;
    }

    //Settes e getters
    public boolean isMensagem() {
        return mensagem;
    }

    public void setMensagem(boolean mensagem) {
        this.mensagem = mensagem;
    }

    public String getTipoAlert() {
        return tipoAlert;
    }

    public void setTipoAlert(String tipoAlert) {
        this.tipoAlert = tipoAlert;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getAlert() {
        String div = "";
        if (this.tipoAlert != null && this.titulo != null) {
            div = "<div class=\"alert alert-" + this.tipoAlert + "\">"
                    + "<h4>" + this.titulo + "</h4>";
            if (this.texto != null) {
                div += this.texto;
            }
            div += "</div>";
        }

        return div;
    }

    public String getMensagem() {
        String div = "";
        if (this.tipoAlert != null && this.titulo != null) {
            div = "<span style='color:red;'>"
                    + this.titulo
                    + "</span>";
        }

        return div;
    }
}
