package br.com.gsst.controller;

import br.com.gsst.dao.UsuarioDAO;
import br.com.gsst.model.Usuario;
import br.com.gsst.outros.Mensagem;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/*
    Autor: José Carlos de Freitas
    Data: 04/09/2016, 11:46:29
    Arquivo: EditarDadosContoller
 */
@Controller
public class EditarDadosContoller {

    @RequestMapping("user/editar-dados/")
    public String editarDados() {
        return "editarDados";
    }

    @RequestMapping("user/editar-dados/salvar-usuario")
    public String salvarUsuario(@RequestParam("nova-senha") String novaSenha, @RequestParam("confirmar-nova-senha") String confirmarNovaSenha, @ModelAttribute("usuarioLogado") @Valid Usuario usuario, BindingResult result, HttpSession session, RedirectAttributes redirectAttributes) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario user = usuarioDAO.getUsuarioById(((Usuario) session.getAttribute("usuarioLogado")).getIdFuncionario());

        if (usuario.getIdFuncionario() != user.getIdFuncionario()) {
            redirectAttributes.addFlashAttribute("msgUsuario", new Mensagem(true, "danger", "Erro!", "Não é possível editar dados de outros usuário."));

            return "redirect:/user/editar-dados/";
        }

        if (!usuario.getSenha().equals(user.getSenha())) {
            redirectAttributes.addFlashAttribute("msgUsuario", new Mensagem(true, "danger", "Senha incorreta!", "A senha digitada está incorreta!"));
            usuario.setSenha("");
            redirectAttributes.addFlashAttribute("usuarioLogado", usuario);
            
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.usuarioLogado", result);
            
            return "redirect:/user/editar-dados/";
        }
        
        if (!novaSenha.equals(confirmarNovaSenha)) {
            redirectAttributes.addFlashAttribute("msgUsuario", new Mensagem(true, "danger", "Confirmação de senha incorreta!", "A nova senha deve ser igual à sua confirmação"));
            usuario.setSenha("");
            redirectAttributes.addFlashAttribute("usuarioLogado", usuario);
            
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.usuarioLogado", result);
            
            return "redirect:/user/editar-dados/";
        }

        if (result.hasErrors()) {
            usuario.setSenha("");
            redirectAttributes.addFlashAttribute("usuarioLogado", usuario);
            //Seta erros para redirect
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.usuarioLogado", result);

            return "redirect:/user/editar-dados/";
        }
        
        if (novaSenha.length() > 0) {
            usuario.setSenha(novaSenha);
        }

        usuario.setNivelAcesso(user.getNivelAcesso());
        usuario.setAtivo(user.isAtivo());
        
        usuario.getFuncionario().setIdFuncionario(user.getFuncionario().getIdFuncionario());
        usuario.getFuncionario().setFuncao(user.getFuncionario().getFuncao());
        usuario.getFuncionario().setCpf(user.getFuncionario().getCpf());
        usuario.getFuncionario().setSetor(user.getFuncionario().getSetor());
        usuario.getFuncionario().setFuncionario(user.getFuncionario().getFuncionario());
        usuario.getFuncionario().setUnidade(user.getFuncionario().getUnidade());
                
        if (usuarioDAO.salvar(usuario)) {
            redirectAttributes.addFlashAttribute("msgUsuario", new Mensagem(true, "success", "Dados atualizados!", "Seus dados foram atualizados com sucesso!"));
        } else {
            redirectAttributes.addFlashAttribute("msgUsuario", new Mensagem(true, "danger", "Erro!", "Erro ao salvar o usuário"));
        }

        return "redirect:/user/editar-dados/";
    }
}
