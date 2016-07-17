package br.com.gsst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
    Autor: José Carlos de Freitas
    Data: 11/07/2016, 12:12:38
    Arquivo: LoginController
*/

@Controller
public class LoginController {
    
    @RequestMapping("login")
    public String login(){
        return "login";
    }
}
