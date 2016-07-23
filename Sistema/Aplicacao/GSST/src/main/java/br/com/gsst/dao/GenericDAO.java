package br.com.gsst.dao;

import br.com.gsst.model.HibernateUtil;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class GenericDAO<T, ID extends Serializable> implements GenericDAOInter<T, ID> {

    protected Session getSession() {
        return HibernateUtil.getSession();
    }

    @Override
    public void save(T entity) {
        Session hibernateSession = this.getSession();
        hibernateSession.saveOrUpdate(entity);
    }

    public void merge(T entity) {
        Session hibernateSession = this.getSession();
        hibernateSession.merge(entity);

    }

    public void persist(T entity) {
        Session hibernateSession = this.getSession();
        hibernateSession.persist(entity);

    }

    public void delete(T entity) {
        Session hibernateSession = this.getSession();
        hibernateSession.delete(entity);
    }

    public List<T> findMany(Query query) {
        List<T> T;
        T = (List<T>) query.list();
        return T;
    }

    public T findOne(Query query) {
        T t;
        t = (T) query.uniqueResult();
        return t;
    }

    public T findByID(Class clazz, Integer id) {
        Session hibernateSession = this.getSession();
        T t = null;
        t = (T) hibernateSession.get(clazz, id);
        return t;
    }

    public List findAll(Class clazz) {
        Session hibernateSession = this.getSession();
        List T = null;
        Query query = hibernateSession.createQuery("from " + clazz.getSimpleName());
        T = query.list();
        return T;
    }

    public List findAllOrderBy(Class clazz, String order) {
        Session hibernateSession = this.getSession();
        List T = null;
        Query query = hibernateSession.createQuery("from " + clazz.getSimpleName() + " order by " + order);
        T = query.list();
        return T;
    }

    public List findByColumn(Class clazz, String column, String param) {
        Session hibernateSession = this.getSession();
        List T = null;
        Query query = hibernateSession.createQuery("from " + clazz.getSimpleName() + " where " + column + " = :variavel");
        query.setParameter("variavel", param);
        T = query.list();
        return T;
    }
}
