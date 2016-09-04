package br.com.gsst.controller;

import br.com.gsst.dao.UsuarioDAO;
import br.com.gsst.model.Usuario;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

/*
    Autor: José Carlos de Freitas
    Data: 04/09/2016, 12:08:10
    Arquivo: SuperController
 */
@ControllerAdvice
public class SuperController {

    @ModelAttribute("usuarioLogado")
    public Usuario usuario(HttpSession session) {
        Usuario user = ((Usuario) session.getAttribute("usuarioLogado"));
        if (user != null) {
            user = new UsuarioDAO().getUsuarioById(user.getIdFuncionario());
            user.setSenha("");
        }
        return user;
    }
}
