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
}
