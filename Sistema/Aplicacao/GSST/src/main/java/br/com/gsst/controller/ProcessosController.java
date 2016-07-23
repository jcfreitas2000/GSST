package br.com.gsst.controller;

import br.com.gsst.dao.MaquinaDAO;
import br.com.gsst.model.Maquina;
import br.com.gsst.model.Nr;
import br.com.gsst.model.Processo;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/*
    Autor: José Carlos de Freitas
    Data: 19/07/2016, 16:45:32
    Arquivo: ProcessosController
*/

@Controller
public class ProcessosController {
    
    @ModelAttribute("maquina")
    public Maquina maquina(){
        return new Maquina();
    }
    
    @ModelAttribute("maquinas")
    public List<Maquina> maquinas(){
        return new MaquinaDAO().getMaquinas();
    }
    
    @ModelAttribute("processo")
    public Processo processo(){
        return new Processo();
    }
    
    @ModelAttribute("nrs")
    public List<Nr> nrs(){
        return new ArrayList<>();
    }

    @RequestMapping("user/processos")
    public String processos(){
        return "index";
    }
}
