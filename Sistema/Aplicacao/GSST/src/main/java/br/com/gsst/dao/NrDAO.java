package br.com.gsst.dao;

import br.com.gsst.model.Nr;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/*
    Autor: José Carlos de Freitas
    Data: 23/07/2016, 23:09:29
    Arquivo: NrDAO
*/

public class NrDAO extends GenericDAO<Nr, BigDecimal>{

    public List<Nr> getNrs(){
        Session s = this.getSession();
        List<Nr> nrs = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Nr where nr is null order by numero asc");
            nrs = findMany(q);
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return nrs;
    }

    public Nr getNrByNumero(String num){
        Session s = this.getSession();
        Nr nr = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Nr where numero like :num");
            q.setString("num", num);
            nr = findOne(q);
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return nr;
    }
}
