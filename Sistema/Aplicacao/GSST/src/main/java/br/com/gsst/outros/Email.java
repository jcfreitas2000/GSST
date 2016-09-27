package br.com.gsst.outros;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Email {

    private String destinatario;
    private String assunto;
    private String mensagem;

    public Email(String destinatario, String assunto, String mensagem) {
        this.destinatario = destinatario;
        this.assunto = assunto;
        this.mensagem = mensagem;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public boolean submit() {

        Properties props = new Properties();
        //True = Versão de Teste, False = Versão de Produção
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(
                        "gsstsv@gmail.com", "j.c.f.95");
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("gsstsv@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(this.destinatario));
            message.setSubject(this.assunto);
            //Conteúdo
            MimeMultipart content = new MimeMultipart();
            MimeBodyPart body_part = new MimeBodyPart();
            body_part.setText(this.mensagem, "utf-8"); //conteudo do e-mail
            body_part.setHeader("Content-Type", "text/html");
            content.addBodyPart(body_part);

            message.setContent(content);
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
