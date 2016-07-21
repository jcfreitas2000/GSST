package br.com.gsst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
    Autor: José Carlos de Freitas
    Data: 19/07/2016, 16:45:32
    Arquivo: ProcessosController
*/

@Controller
public class ProcessosController {

    @RequestMapping("processos")
    public String processos(){
        return "index";
    }
}
