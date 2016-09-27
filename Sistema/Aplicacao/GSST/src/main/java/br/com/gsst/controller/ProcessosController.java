package br.com.gsst.controller;

import br.com.gsst.dao.FuncionarioDAO;
import br.com.gsst.dao.MaquinaDAO;
import br.com.gsst.dao.NrDAO;
import br.com.gsst.dao.ProcessoDAO;
import br.com.gsst.dao.UsuarioDAO;
import br.com.gsst.model.FiltroProcesso;
import br.com.gsst.model.Funcionario;
import br.com.gsst.model.Maquina;
import br.com.gsst.model.Nr;
import br.com.gsst.model.Processo;
import br.com.gsst.model.Usuario;
import br.com.gsst.outros.Email;
import br.com.gsst.outros.Mensagem;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/*
    Autor: José Carlos de Freitas
    Data: 19/07/2016, 16:45:32
    Arquivo: ProcessosController
 */
@Controller
//Para retornar UTF-8
@RequestMapping(produces = {"application/json; charset=UTF-8", "*/*;charset=UTF-8"})
public class ProcessosController {
    
    int porPagina = 12;
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        dateFormat.setLenient(false);

        // true passed to CustomDateEditor constructor means convert empty String to null
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    
    @ModelAttribute("filtro")
    public FiltroProcesso filtro() {
        return new FiltroProcesso();
    }
    
    @ModelAttribute("maquina")
    public Maquina maquina() {
        return new Maquina();
    }
    
    @ModelAttribute("maquinas")
    public List<Maquina> maquinas(HttpSession session) {
        List<Maquina> maquinas = new MaquinaDAO().getMaquinasByUnidade(((Usuario) session.getAttribute("usuarioLogado")).getFuncionario().getUnidade().getIdUnidade());
        for (Maquina m : maquinas) {
            m.setNumPatrimonio(m.getDescricao() + " (" + m.getNumPatrimonio() + ")");
        }
        
        return maquinas;
    }
    
    @ModelAttribute("processo")
    public Processo processo() {
        return new Processo();
    }
    
    @ModelAttribute("nrs")
    public List<Nr> nrs() {
        return new NrDAO().getNrs();
    }
    
    @ModelAttribute("funcionarios")
    public List<Funcionario> funcionarios(HttpSession session) {
        return new FuncionarioDAO().getFuncionariosByUnidade(((Usuario) session.getAttribute("usuarioLogado")).getFuncionario().getUnidade().getIdUnidade());
    }
    
    @RequestMapping(value = {"user/", "user/processos"})
    public String redirect() {
        return "redirect:/user/processos/";
    }
    
    @RequestMapping("user/processos/")
    public String processos(HttpSession session, Model model) {
        paginacao(1, session, model, null);
        
        return "processo/processos";
    }
    
    @RequestMapping("user/processos/{num}")
    public String processos(@PathVariable("num") int num, HttpSession session, Model model) {
        if (num <= 0 || !paginacao(num, session, model, null)) {
            return "redirect:/user/processos/";
        }
        
        return "processo/processos";
    }
    
    @RequestMapping("user/processos/filtrar/")
    public String filtrar(@ModelAttribute("filtro") FiltroProcesso filtro, HttpSession session, Model model) {
        if (!filtro.isFiltro()) {
            session.removeAttribute("filtro");
            
            return "redirect:/user/processos/";
        } else {
            session.setAttribute("filtro", filtro);
        }
        
        return "redirect:/user/processos/filtrar/1";
    }
    
    @RequestMapping("user/processos/filtrar/{num}")
    public String filtrar(@PathVariable("num") int num, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        FiltroProcesso filtro = (FiltroProcesso) session.getAttribute("filtro");
        
        if (filtro == null) {
            return "redirect:/user/processos/";
        }
        
        if (num <= 0 || !paginacao(num, session, model, filtro)) {
            redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "warning", "Sem resultados", "Não há processos para o filtro utilizado"));
            redirectAttributes.addFlashAttribute("filtro", filtro);
            
            return "redirect:/user/processos/";
        }
        
        model.addAttribute("filtro", filtro);
        
        return "processo/processos";
    }
    
    public boolean paginacao(int num, HttpSession session, Model model, FiltroProcesso filtro) {
        ProcessoDAO processoDAO = new ProcessoDAO();
        Usuario user = (Usuario) session.getAttribute("usuarioLogado");
        int idUnidade = user.getFuncionario().getUnidade().getIdUnidade();
        int total;
        if (filtro == null) {
            total = processoDAO.countByUnidade(idUnidade);
            model.addAttribute("processos", processoDAO.paginacaoProcessoByUnidade(idUnidade, this.porPagina, num - 1));
        } else {
            total = processoDAO.countByUnidade(idUnidade, user.getIdFuncionario(), filtro);
            model.addAttribute("processos", processoDAO.paginacaoProcessoByUnidade(idUnidade, user.getIdFuncionario(), this.porPagina, num - 1, filtro));
        }
        int count = (int) Math.ceil(total / (double) this.porPagina);
        
        if (num > count) {
            return false;
        }
        
        model.addAttribute("num", num);
        model.addAttribute("count", count);
        
        model.addAttribute("porPagina", this.porPagina);
        model.addAttribute("total", total);
        
        return true;
    }
    
    @RequestMapping("user/processos/visualizar/{num}/resolver")
    public String resolver(@PathVariable("num") int num, @RequestParam("resolucao") String resolucao, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        resolucao = resolucao.trim();
        
        if (resolucao.isEmpty()) {
            redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "danger", "Erro!", "Descrição inválida."));
        } else {
            Usuario user = new UsuarioDAO().getUsuarioById(((Usuario) session.getAttribute("usuarioLogado")).getIdFuncionario());
            
            ProcessoDAO processoDAO = new ProcessoDAO();
            Processo p = processoDAO.getProcessoById(num);
            
            if(p.getEstado().equals("resolvido")){
                redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "danger", "Erro!", "Este processo já foi resolvido resolvido."));
                
                return "redirect:/user/processos/visualizar/" + num + "/";
            }
            
            if (user.getNivelAcesso().equals("admin")
                    || user.getIdFuncionario() == p.getFuncionarioByIdRelator().getIdFuncionario()
                    || (p.getFuncionarioByIdRespCorrecao() != null && user.getIdFuncionario() == p.getFuncionarioByIdRespCorrecao().getIdFuncionario())) {
                p.setResolucao(resolucao);
                p.setDataResolucao(new Date());
                p.setFuncionarioByIdResolucao(user.getFuncionario());
                p.setEstado("resolvido");
                
                if (processoDAO.salvar(p)) {
                    redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "success", "Processo resolvido!", "Processo resolvido com sucesso."));
                    String uri = request.getHeader("Referer").substring(1, request.getHeader("Referer").indexOf(request.getContextPath()));
                    String mensagem = "Prezado(a) " + p.getFuncionarioByIdRelator().getNome() + ","
                            + "<br><br>O processo " + p.getIdProcesso() + " foi solucionado por <b>" + p.getFuncionarioByIdResolucao().getNome() + "</b> hoje (" + new SimpleDateFormat("dd/MM/yyyy").format(p.getDataResolucao()) + ") às " + new SimpleDateFormat("HH:mm:ss").format(p.getDataResolucao()) + ".";
                    if (p.getFuncionarioByIdRespCorrecao() == null) {
                        mensagem += "<br>Não havia um responsável pela correção.";
                    } else {
                        mensagem += "<br>O responsável pela correção era <b>" + p.getFuncionarioByIdRespCorrecao().getNome() + "</b>.";
                    }
                    if (p.getPrazo() == null) {
                        mensagem += "<br>Não havia um prazo estabelecido para a resolução.";
                    } else {
                        mensagem += "<br>O prazo para a resolução era <b>" + new SimpleDateFormat("dd/MM/yyyy").format(p.getPrazo()) + "</b>.";
                    }
                    mensagem += "<br><br>Para mais informações acesse o sistema por meio do link &lt;<a href=\"" + uri + "\">" + uri + "</a>&gt;."
                            + "<br><br>Atenciosamente,"
                            + "<br>Sistema GSST";
                    new Email(p.getFuncionarioByIdRespCorrecao().getEmail(),
                            "GSST - Processo " + p.getIdProcesso(),
                            mensagem
                    ).submit();
                } else {
                    redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "danger", "Erro!", "Erro ao salvar processo."));
                }
            } else {
                redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "danger", "Erro!", "Você não tem permissão para resolver esse processo."));
            }
        }
        
        return "redirect:/user/processos/visualizar/" + num + "/";
    }
    
    @RequestMapping("user/processos/novo")
    public String frmProcesso(@ModelAttribute("Processo") Processo p, Model model) {
        return "processo/frmProcesso";
    }
    
    @RequestMapping("user/processos/nr/{num}")
    public String processos(@PathVariable(value = "num") String num, Model model) {
        Nr nr = new NrDAO().getNrByNumero(num);
        
        List<String> mapa = new ArrayList<>();
        Nr aux = nr.getNr();
        while (aux != null) {
            mapa.add(0, aux.getNumero());
            aux = aux.getNr();
        }
        
        model.addAttribute("nr", nr);
        model.addAttribute("mapa", mapa);
        
        return "nrAux";
    }
    
    @RequestMapping("user/processos/salvar-processo")
    public String salvarProcesso(@RequestParam("arrayNrs") String nrs, @RequestParam("imagens") List<MultipartFile> imagens, @ModelAttribute("processos") @Valid Processo processo, BindingResult result, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario user = usuarioDAO.getUsuarioById(((Usuario) session.getAttribute("usuarioLogado")).getIdFuncionario());
        processo.setFuncionarioByIdRelator(user.getFuncionario());
        processo.setData(new Date());
        processo.setEstado("pendente");
        processo.setMedidaCorretiva(processo.getMedidaCorretiva().trim());
        if (processo.getFuncionarioByIdRespCorrecao().getIdFuncionario() == 0) {
            processo.setFuncionarioByIdRespCorrecao(null);
        } else {
            processo.setFuncionarioByIdRespCorrecao(usuarioDAO.getUsuarioById(processo.getFuncionarioByIdRespCorrecao().getIdFuncionario()).getFuncionario());
        }
        
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("processo", processo);
            //Seta erros para redirect
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.processo", result);
            
            return "redirect:/user/processos/novo";
        }
        
        JSONArray arrayNrs = new JSONArray(nrs);
        
        NrDAO nrDAO = new NrDAO();
        for (int i = 0; i < arrayNrs.length(); i++) {
            Nr aux = nrDAO.getNrByNumero(arrayNrs.get(i).toString());
            
            processo.getNrs().add(aux);
        }
        
        if (processo.getIdProcesso() > 0) { // Atualiza
            atualizarProcesso(processo, imagens, redirectAttributes);
        } else { //Cadastra novo
            cadastrarProcesso(processo, imagens, request, redirectAttributes);
        }
        
        return "redirect:/user/processos/";
    }
    
    public void cadastrarProcesso(Processo processo, List<MultipartFile> imagens, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        ProcessoDAO processoDAO = new ProcessoDAO();
        
        if (processoDAO.salvar(processo, imagens)) {
            redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "success", "Cadastrado!", "Sucesso no cadastro do processo."));
            
            if (processo.getFuncionarioByIdRespCorrecao() != null) {
                String uri = request.getHeader("Referer").replace(request.getServletPath(), "").replace(request.getQueryString() == null ? "" : request.getQueryString(), "");
                String mensagem = "Prezado(a) " + processo.getFuncionarioByIdRespCorrecao().getNome() + ","
                        + "<br><br>O processo " + processo.getIdProcesso() + " foi relatado por " + processo.getFuncionarioByIdRelator().getNome() + " e atribuído ao senhor(a).";
                if (processo.getPrazo() == null) {
                    mensagem += "<br>O prazo não foi estipulado.";
                } else {
                    mensagem += "<br>O prazo para a resolução é <b>" + new SimpleDateFormat("dd/MM/yyyy").format(processo.getPrazo()) + "</b>.";
                }
                mensagem += "<br><br>Para mais informações acesse o sistema por meio do link &lt;<a href=\"" + uri + "\">" + uri + "</a>&gt;."
                        + "<br><br>Atenciosamente,"
                        + "<br>Sistema GSST";
                new Email(processo.getFuncionarioByIdRespCorrecao().getEmail(),
                        "GSST - Processo " + processo.getIdProcesso(),
                        mensagem
                ).submit();
            }
        } else {
            redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "danger", "Erro ao cadastrar!", "Erro ao cadastrar o processo."));
        }
    }
    
    public void atualizarProcesso(Processo processo, List<MultipartFile> imagens, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "danger", "Erro!", "Não é possível atualizar processos"));
    }
    
    @RequestMapping("/user/processos/getProcessos")
    @ResponseBody
    public String getProcessos() {
        ProcessoDAO processoDAO = new ProcessoDAO();
        List<Processo> processos = processoDAO.getProcessos();
        
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        
        JSONObject json;
        JSONArray array = new JSONArray();
        for (Processo p : processos) {
            String data = "";
            if (p.getData() != null) {
                data = sdf.format(p.getData());
            }
            String prazo = "";
            if (p.getPrazo() != null) {
                prazo = sdf.format(p.getPrazo());
            }
            DecimalFormat df = new DecimalFormat("0.00");
            String multa = "";
            if (p.getMulta() != null) {
                multa = df.format(p.getMulta());
            }
            
            json = new JSONObject();
            json.put("id", p.getIdProcesso());
            json.put("localizacao", p.getLocalizacao());
            json.put("setor", p.getSetor());
            json.put("medidaCorretiva", p.getMedidaCorretiva());
            json.put("data", data);
            json.put("prazo", prazo);
            json.put("multa", multa);
            if (p.getFuncionarioByIdRelator() != null) {
                json.put("relator", p.getFuncionarioByIdRelator().getNome());
            }
            if (p.getFuncionarioByIdRespCorrecao() != null) {
                json.put("responsavel", p.getFuncionarioByIdRespCorrecao().getNome());
            } else {
                json.put("responsavel", "");
            }
            json.put("maquina", p.getMaquina().getDescricao());
            
            array.put(json);
        }
        
        json = new JSONObject();
        json.put("data", array);
        
        System.out.println(json.toString());
        
        return json.toString();
    }
    
    @RequestMapping("user/processos/salvar-maquina")
    public String salvarMaquina(@ModelAttribute("maquina") @Valid Maquina maquina, BindingResult result, HttpSession session, RedirectAttributes redirectAttributes) {
        maquina.setUnidade(((Usuario) session.getAttribute("usuarioLogado")).getFuncionario().getUnidade());
        
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("maquina", maquina);
            //Seta erros para redirect
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.maquina", result);
            
            return "redirect:/user/processos/novo#adicionarMaquina";
        }
        
        MaquinaDAO maquinaDAO = new MaquinaDAO();
        
        if (maquina.getIdMaquina() > 0) { // Atualiza
            redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "danger", "Erro!", "Não é possível atualizar máquina"));
        } else //Cadastra novo
        {
            if (maquinaDAO.salvar(maquina)) {
                redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "success", "Cadastrado!", "Sucesso no cadastro da máquina " + maquina.getDescricao() + " (" + maquina.getNumPatrimonio() + ")."));
            } else {
                redirectAttributes.addFlashAttribute("msgProcesso", new Mensagem(true, "danger", "Erro ao cadastrar!", "Erro ao cadastrar a máquina."));
            }
        }
        
        return "redirect:/user/processos/novo";
    }
    
    @RequestMapping("user/processos/visualizar/{id}/")
    public String visualizar(@PathVariable("id") int id, Model model) {
        model.addAttribute("p", new ProcessoDAO().getProcessoById(id));
        
        return "processo/visualizar";
    }
}
