package br.com.gsst.controller;

import br.com.gsst.dao.MaquinaDAO;
import br.com.gsst.dao.NrDAO;
import br.com.gsst.model.Maquina;
import br.com.gsst.model.Nr;
import br.com.gsst.model.Processo;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public Maquina maquina() {
        return new Maquina();
    }

    @ModelAttribute("maquinas")
    public List<Maquina> maquinas() {
        return new MaquinaDAO().getMaquinas();
    }

    @ModelAttribute("Processo")
    public Processo processo() {
        return new Processo();
    }

    @ModelAttribute("nrs")
    public List<Nr> nrs() {
        return new NrDAO().getNrs();
    }

    @RequestMapping("user/processos/")
    public String processos(@ModelAttribute("Processo") Processo p, Model model) {
        return "index";
    }
    
    @RequestMapping(value = "user/processos/nr", method = RequestMethod.GET)
    public ModelAndView processos(@RequestParam(value = "nr") String num) {
        num = num.replace("-", ".");
        
        ModelAndView qq = new ModelAndView("nrAux");

        return qq;
    }
}
