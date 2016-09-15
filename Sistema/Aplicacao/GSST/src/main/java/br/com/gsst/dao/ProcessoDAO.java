package br.com.gsst.dao;

import br.com.gsst.model.Processo;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.util.List;
import javax.naming.InitialContext;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.web.multipart.MultipartFile;

/*
    Autor: José Carlos de Freitas
    Data: 07/08/2016, 23:39:08
    Arquivo: ProcessoDAO
 */
public class ProcessoDAO extends GenericDAO<Processo, BigDecimal> {

    public List<Processo> getProcessos() {
        Session s = this.getSession();
        List<Processo> processos = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Processo");
            processos = findMany(q);
            for (Processo p : processos) {
                Hibernate.initialize(p.getFuncionarioByIdRelator());
                Hibernate.initialize(p.getFuncionarioByIdRespCorrecao());
                Hibernate.initialize(p.getMaquina());
            }
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return processos;
    }

    public boolean salvar(Processo processo, List<MultipartFile> imagens) {
        Session s = this.getSession();

        try {
            s.beginTransaction();
            this.save(processo);
            s.flush();

            /*---------------  VERIFICAÇÃO DE EXTENSÃO -------------------*/
            //Verifica se há imagens
            if (!imagens.get(0).isEmpty()) {
                //Verifica se são imagens válidas
                for (int j = 0; j < imagens.size(); j++) {
                    String testeExtensao = imagens.get(j).getOriginalFilename();
                    testeExtensao = (testeExtensao.substring(testeExtensao.lastIndexOf("."), testeExtensao.length())).toLowerCase();
                    if (!(testeExtensao.equals(".jpg") || testeExtensao.equals(".jpeg") || testeExtensao.equals(".png"))) {
                        return false;
                    }
                }

                //Inicia o salvamento das imagens
                InitialContext cxt = new InitialContext();
                // Cria o diretório em que o arquivo será salvo
                String rootPath = (String) cxt.lookup("java:/comp/env/imagens");
                File dir = new File(rootPath + File.separator + "processos" + File.separator + processo.getIdProcesso());
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                int i;
                for (i = 0; i < imagens.size(); i++) {
                    if (!imagens.get(i).isEmpty()) {

                        String nomeArquivo = "" + (i + 1);

                        if (!imagens.isEmpty()) {
                            byte[] bytes = imagens.get(i).getBytes();
                            String extensao = imagens.get(i).getOriginalFilename();
                            extensao = (extensao.substring(extensao.lastIndexOf("."), extensao.length())).toLowerCase();
                            // Cria o arquivo no servidor
                            File serverFile = new File(dir.getAbsolutePath() + File.separator + nomeArquivo + extensao);
                            BufferedOutputStream stream = new BufferedOutputStream(
                                    new FileOutputStream(serverFile));
                            stream.write(bytes);
                            stream.close();
                            //Caso arquivo 1, gera Thumbnail
                            if (i == 0) {
                                // Cria o arquivo no servidor
                                Thumbnails.of(serverFile)
                                        .size(480, 240)
                                        .crop(Positions.CENTER)
                                        .toFile(new File(dir.getAbsolutePath() + File.separator + "1t" + extensao.toLowerCase()));
                            }
                        }
                    }
                }

                processo.setNumFotos(i);
            }

            s.getTransaction().commit();

            return true;
        } catch (Exception e) {
            s.getTransaction().rollback();
            e.printStackTrace();

            return false;
        }
    }
    
    public boolean salvar(Processo processo) {
        Session s = this.getSession();

        try {
            s.beginTransaction();
            this.save(processo);

            s.getTransaction().commit();

            return true;
        } catch (Exception e) {
            s.getTransaction().rollback();
            e.printStackTrace();

            return false;
        }
    }

    public List<Processo> paginacaoProcessoByUnidade(int idUnidade, int porPagina, int pagina) {
        Session s = this.getSession();
        List<Processo> processos = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Processo where maquina.unidade.idUnidade = :idUnidade order by estado, idProcesso DESC")
                    .setInteger("idUnidade", idUnidade)
                    .setFirstResult(pagina * porPagina)
                    .setMaxResults(porPagina);
            processos = findMany(q);
            for (Processo p : processos) {
                Hibernate.initialize(p.getFuncionarioByIdRelator());
                Hibernate.initialize(p.getFuncionarioByIdRespCorrecao());
                Hibernate.initialize(p.getMaquina());
            }
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return processos;
    }

    public Processo getProcessoById(int id) {
        Processo p = null;
        Session s = this.getSession();

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Processo where idProcesso = :id")
                    .setInteger("id", id);
            p = findOne(q);
            Hibernate.initialize(p.getFuncionarioByIdRelator());
            Hibernate.initialize(p.getFuncionarioByIdRespCorrecao());
            Hibernate.initialize(p.getNrs());
            Hibernate.initialize(p.getMaquina());
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return p;
    }

    public int countByUnidade(int idUnidade) {
        Long p = null;
        Session s = this.getSession();

        try {
            s.beginTransaction();
            Query q = s.createQuery("select count(*) from Processo where maquina.unidade.idUnidade = :idUnidade")
                    .setInteger("idUnidade", idUnidade);
            p = (Long) q.uniqueResult();
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return p.intValue();
    }
}
