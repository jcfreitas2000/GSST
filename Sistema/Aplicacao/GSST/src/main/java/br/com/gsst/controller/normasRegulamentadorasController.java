package br.com.gsst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
    Autor: José Carlos de Freitas
    Data: 19/07/2016, 16:24:30
    Arquivo: normasRegulamentadorasController
*/

@Controller
public class normasRegulamentadorasController {

    @RequestMapping("user/normas-regulamentadoras")
    public String normasRegulamentadoras(){
        return "normasRegulamentadoras";
    }
}
