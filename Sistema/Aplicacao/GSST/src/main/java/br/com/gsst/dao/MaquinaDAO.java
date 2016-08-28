package br.com.gsst.dao;

import br.com.gsst.model.Maquina;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/*
    Autor: José Carlos de Freitas
    Data: 22/07/2016, 23:35:02
    Arquivo: MaquinaDAO
*/

public class MaquinaDAO extends GenericDAO<Maquina, BigDecimal>{

    public List<Maquina> getMaquinas(){
        Session s = this.getSession();
        List<Maquina> maquinas = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Maquina");
            maquinas = findMany(q);
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return maquinas;
    }

    public List<Maquina> getMaquinasByUnidade(int idUnidade){
        Session s = this.getSession();
        List<Maquina> maquinas = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Maquina where unidade.idUnidade = :idUnidade")
                    .setInteger("idUnidade", idUnidade);
            maquinas = findMany(q);
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return maquinas;
    }
    
    public boolean salvar(Maquina maquina) {
        Session s = this.getSession();

        try {
            s.beginTransaction();
            this.save(maquina);

            s.getTransaction().commit();

            return true;
        } catch (Exception e) {
            s.getTransaction().rollback();
            e.printStackTrace();

            return false;
        }
    }
}
