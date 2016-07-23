package br.com.gsst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
    Autor: José Carlos de Freitas
    Data: 19/07/2016, 20:30:51
    Arquivo: CA
*/

@Controller
public class CA {
    @RequestMapping("user/ca")
    public String ca(){
        return "ca";
    }
}
