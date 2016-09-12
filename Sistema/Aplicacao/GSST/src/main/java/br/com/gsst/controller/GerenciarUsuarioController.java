package br.com.gsst.controller;

import br.com.gsst.dao.FuncionarioDAO;
import br.com.gsst.dao.UsuarioDAO;
import br.com.gsst.model.Funcionario;
import br.com.gsst.model.Usuario;
import br.com.gsst.outros.Mensagem;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/*
    Autor: José Carlos de Freitas
    Data: 07/09/2016, 15:19:18
    Arquivo: GerirUsuarioController
 */
@Controller
//Para retornar UTF-8
@RequestMapping(produces = {"application/json; charset=UTF-8", "*/*;charset=UTF-8"})
public class GerenciarUsuarioController {

    @ModelAttribute("usuario")
    public Usuario usuario() {
        return new Usuario();
    }

    @ModelAttribute("funcionarios")
    public List<Funcionario> funcionario(HttpSession session) {
        return new FuncionarioDAO().getFuncionariosByUnidade(((Usuario) session.getAttribute("usuarioLogado")).getFuncionario().getUnidade().getIdUnidade());
    }

    @RequestMapping("admin/gerenciar-usuarios/")
    public String gerenciarUsuario() {
        return "admin/usuario/gerenciarUsuarios";
    }

    @RequestMapping("admin/gerenciar-usuarios/usuarios")
    @ResponseBody
    public String usuarios(HttpSession session) {
        List<Usuario> usuarios = new UsuarioDAO().getUsuariosByUnidade(((Usuario) session.getAttribute("usuarioLogado")).getFuncionario().getUnidade().getIdUnidade());

        JSONObject json;
        JSONArray array = new JSONArray();
        for (Usuario u : usuarios) {
            json = new JSONObject();

            json.put("id", u.getIdFuncionario());
            json.put("cpf", u.getFuncionario().getCpf());
            json.put("nome", u.getFuncionario().getNome());
            json.put("funcao", u.getFuncionario().getFuncao());
            json.put("setor", u.getFuncionario().getSetor());
            if (u.getFuncionario().getFuncionario() == null) {
                json.put("chefe", "");
            } else {
                json.put("chefe", u.getFuncionario().getFuncionario().getNome());
            }
            json.put("email", u.getFuncionario().getEmail());
            json.put("contato", u.getFuncionario().getContato());

            array.put(json);
        }

        json = new JSONObject();
        json.put("data", array);
        System.out.println(json.toString());
        return json.toString();
    }

    @RequestMapping("admin/gerenciar-usuarios/novo")
    public String novoUsuario() {
        return "admin/usuario/frmUsuario";
    }

    @RequestMapping("admin/gerenciar-usuarios/salvar-usuario")
    public String salvarUsuario(@ModelAttribute("usuario") @Valid Usuario usuario, BindingResult result, HttpSession session, RedirectAttributes redirectAttributes) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario user = usuarioDAO.getUsuarioById(((Usuario) session.getAttribute("usuarioLogado")).getIdFuncionario());

        if (usuario.getIdFuncionario() > 0) {
            Usuario u = usuarioDAO.getUsuarioById(((Usuario) session.getAttribute("usuarioLogado")).getIdFuncionario());

            usuario.getFuncionario().setIdFuncionario(u.getFuncionario().getIdFuncionario());
            
            if (user.getFuncionario().getUnidade().getIdUnidade() == u.getFuncionario().getUnidade().getIdUnidade()) {
                redirectAttributes.addFlashAttribute("msgUsuario", new Mensagem(true, "danger", "Erro!", "Não é possível editar dados de usuários de outra unidade."));
                
                return "redirect:/admin/gerenciar-usuarios/novo";
            }
        } else {
            usuario.setSenha(this.geraSenha(8));
            usuario.getFuncionario().setUnidade(user.getFuncionario().getUnidade());
        }

        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("usuario", usuario);
            //Seta erros para redirect
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.usuario", result);

            return "redirect:/admin/gerenciar-usuarios/novo";
        }

        if (usuarioDAO.salvar(usuario)) {
            redirectAttributes.addFlashAttribute("msgUsuario", new Mensagem(true, "success", "Cadastro efetuado!", "O cadastro de " + usuario.getFuncionario().getNome() + " foi efetuado com sucesso!"));
        } else {
            redirectAttributes.addFlashAttribute("msgUsuario", new Mensagem(true, "danger", "Erro!", "Erro ao salvar o usuário"));
        }

        return "redirect:/admin/gerenciar-usuarios/";
    }
    
    //Recebe uma senha aleatória do tamanho estipulado
    public static String geraSenha(int len) {
        char[] chart = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

        char[] senha = new char[len];

        int chartLenght = chart.length;
        Random rdm = new Random();

        for (int i = 0; i < len; i++) {
            senha[i] = chart[rdm.nextInt(chartLenght)];
        }

        return new String(senha);
    }
}
