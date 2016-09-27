package br.com.gsst.controller;

import br.com.gsst.dao.UsuarioDAO;
import br.com.gsst.model.Usuario;
import br.com.gsst.outros.Email;
import br.com.gsst.outros.Mensagem;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/*
    Autor: José Carlos de Freitas
    Data: 11/07/2016, 12:12:38
    Arquivo: LoginController
 */
@Controller
public class LoginController {

    @RequestMapping("entrar")
    public String login(HttpSession session) {
        if ((Usuario) session.getAttribute("usuarioLogado") != null) {
            return "redirect:user/index";
        }

        return "login";
    }

    @RequestMapping("login")
    public String login(@Valid Usuario usuario, BindingResult result, HttpSession session, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {

        if (result.hasFieldErrors("funcionario") || result.hasFieldErrors("senha")) { //VALIDAÇÃO DOS INPUTS NO LOGIN
            //Seta o email da última tentativa
            redirectAttributes.addFlashAttribute("email", usuario.getFuncionario().getEmail());
            //Seta erros para redirect
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.usuario", result);

            return "redirect:/entrar";
        }

        UsuarioDAO dao = new UsuarioDAO();
        Usuario user = dao.getUsuarioByEmailAndSenha(usuario);

        if (user != null) { //VERIFICA SE ENCONTROU USUÁRIO
            if (!user.isAtivo()) { //VERIFICA SE O USUÁRIO ESTÁ AUTORIZADO PELO ADMIN
                //Seta o erro de login
                redirectAttributes.addFlashAttribute("mensagem", new Mensagem(true, "danger", "Erro no login!", "Seu usuário está desativado. Contate um administrador."));
                //Seta o email da ultima tentativa
                redirectAttributes.addFlashAttribute("email", usuario.getFuncionario().getEmail());
                //Redireciona para a página anterior
                return "redirect:/entrar";
            } else { //LOGA O USUÁRIO
                //Remove caso haja na sessao
                session.removeAttribute("usuarioLogado");
                //Seta a sessao do usuário
                session.setAttribute("usuarioLogado", user);
                //Redireciona para a página inicial
                return "redirect:/";
            }
        } else { //ERRO! LOGIN COM DADOS INCORRETOS
            //Seta o erro de login
            redirectAttributes.addFlashAttribute("mensagem", new Mensagem(true, "danger", "Erro no login!", "Usuário ou senha incorretos."));
            //Seta o email da ultima tentativa
            redirectAttributes.addFlashAttribute("email", usuario.getFuncionario().getEmail());
            //Redireciona para a página anterior
            return "redirect:/entrar";
        }
    }

    @RequestMapping("logoff")
    public String logout(HttpSession session, HttpServletRequest request) {
        //Deleta a sessão
        session.invalidate();
        //Redireciona para a página anterior
        return "redirect:/entrar";
    }

    @RequestMapping("recuperar-senha")
    public String recuperarSenha(@RequestParam("recuperar-senha-email") String email, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        Usuario usuario = new UsuarioDAO().getUsuarioByEmail(email);
        String uri = request.getHeader("Referer").replace(request.getServletPath(), "").replace(request.getQueryString() == null ? "" : request.getQueryString(), "");
        if (usuario == null) {
            redirectAttributes.addFlashAttribute("mensagem", new Mensagem(true, "danger", "E-mail não cadastrado", "O email " + email + " não está cadastrado no sistema! Contate um administrador."));
        } else if (new Email(
                email,
                "GSST - Recuperar Senha",
                "Prezado(a) " + usuario.getFuncionario().getNome() + ","
                + "<br><br>Foi solicitado a recuperação de sua senha no dia "
                + new SimpleDateFormat("dd/MM/yyyy").format(new Date()) + " às " + new SimpleDateFormat("HH:mm:ss").format(new Date()) + ". "
                + "Se esta requisição não foi realizada pelo senhor(a), apenas ignore esta mensagem."
                + "<br><br>Os dados para acesso são:"
                + "<br>E-mail: <b>" + usuario.getFuncionario().getEmail() + "</b>"
                + "<br>Senha: <b>" + usuario.getSenha() + "</b>"
                + "<br><br>O sistema pode ser acessado por meio do link &lt;<a href=\"" + uri + "\">" + uri + "</a>&gt;."
                + "<br>Para alterar sua senha acesse o sistema e navegue para Dados Pessoais."
                + "<br><br>Atenciosamente,"
                + "<br>Equipe GSST")
                .submit()) {
            redirectAttributes.addFlashAttribute("mensagem", new Mensagem(true, "success", "Recuperar senha", "Sua senha foi enviada para o email: " + email));
        } else {
            redirectAttributes.addFlashAttribute("mensagem", new Mensagem(true, "danger", "E-mail inválido", "O email " + email + " não é um endereço de email válido."));
        }

        return "redirect:/entrar";
    }
}
