package br.com.gsst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
    Autor: José Carlos de Freitas
    Data: 19/07/2016, 16:44:50
    Arquivo: EPIsController
*/

@Controller
public class EPIsController {
    
    @RequestMapping("epis")
    public String epis(){
        return "index";
    }
}
