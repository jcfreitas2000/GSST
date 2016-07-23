package br.com.gsst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
    Autor: José Carlos de Freitas
    Data: 10/07/2016, 23:39:43
    Arquivo: IndexController
*/

@Controller
public class IndexController {
    
    @RequestMapping(value = {"user/index", "user/"})
    public String index(){
        return "redirect:processos";
    }
}