package br.com.gsst.controller;

import br.com.gsst.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/*
    Autor: José Carlos de Freitas
    Data: 07/09/2016, 15:19:18
    Arquivo: GerirUsuarioController
*/

@Controller
public class GerenciarUsuarioController {
    
    @ModelAttribute("usuario")
    public Usuario usuario(){
        return new Usuario();
    }

    @RequestMapping("admin/gerenciar-usuarios")
    public String gerenciarUsuario(){
        return "admin/gerenciarUsuarios";
    }
}
