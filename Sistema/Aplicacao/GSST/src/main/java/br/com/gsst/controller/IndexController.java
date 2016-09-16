package br.com.gsst.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/*
    Autor: José Carlos de Freitas
    Data: 13/08/2016, 21:59:10
    Arquivo: IndexController
*/
@Controller
public class IndexController {

    @RequestMapping(value = {"user/index", ""})
    public String index(){
        return "redirect:/user/processos/";
    }
    
    @RequestMapping(value = "processoFoto", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<byte[]> getPageImage(@RequestParam(value = "processo") int id, @RequestParam(value = "img") int img, @RequestParam(value = "mod", required = false) String mod, HttpServletRequest request) {
        InputStream is = null;
        try {
            if (mod == null) {
                mod = "";
            }
            String mimeType = null;

            //Pega a variável do context.xml que indica se o sistema está em teste
            InitialContext cxt = new InitialContext();
            // Cria o diretório em que o arquivo será salvo
            String rootPath = (String) cxt.lookup("java:/comp/env/imagens");

            String caminho = rootPath + File.separator + "processos" + File.separator + id + File.separator + img + mod;

            /*  Tratamento para os tipos de imagem: jpg, jpeg, png  */
            String extensao = null;
            File file = new File(caminho + ".jpg");
            if (file.canRead()) {
                extensao = "jpg";
            } else {
                file = new File(caminho + ".png");
                if (file.canRead()) {
                    extensao = "png";
                } else {
                    file = new File(caminho + ".jpeg");
                    if (file.canRead()) {
                        extensao = "jpg";
                    }
                }
            }
            is = new BufferedInputStream(new FileInputStream(file));

            mimeType = "image/" + extensao;

            final HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.valueOf(mimeType));

            return new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return null;
    }
    
    @RequestMapping("404")
    public String erro404(){
        return "404";
    }
}
