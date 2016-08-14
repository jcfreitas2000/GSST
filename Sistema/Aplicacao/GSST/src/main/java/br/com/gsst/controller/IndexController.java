package br.com.gsst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
    Autor: José Carlos de Freitas
    Data: 13/08/2016, 21:59:10
    Arquivo: IndexController
*/
@Controller
public class IndexController {

    @RequestMapping("user/index")
    public String index(){
        return "redirect:/user/processos/";
    }
}
