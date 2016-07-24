package br.com.gsst.controller;

import br.com.gsst.dao.NrDAO;
import br.com.gsst.model.Nr;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/*
    Autor: José Carlos de Freitas
    Data: 19/07/2016, 16:24:30
    Arquivo: normasRegulamentadorasController
 */
@Controller
public class normasRegulamentadorasController {

    @ModelAttribute("nrs")
    public List<Nr> nrs() {
        return new NrDAO().getNrs();
    }

    @RequestMapping("user/normas-regulamentadoras")
    public String normasRegulamentadoras() {
        return "normasRegulamentadoras";
    }

    @RequestMapping("user/normas-regulamentadoras/{nr}")
    public String normasRegulamentadoras(@PathVariable("nr") String num, Model model) {
        num = num.replace("-", ".");

        Nr nr = new NrDAO().getNrByNumero(num);

        List<String> mapa = new ArrayList<>();
        Nr aux = nr.getNr();
        while (aux != null) {
            mapa.add(0, aux.getNumero());
            aux = aux.getNr();
        }
        
        model.addAttribute("nr", nr);
        model.addAttribute("mapa", mapa);

        return "nr";
    }
}
