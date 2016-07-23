package br.com.gsst.dao;

import br.com.gsst.model.Usuario;
import java.math.BigDecimal;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/*
    Autor: José Carlos de Freitas
    Data: 22/07/2016, 18:36:36
    Arquivo: UsuarioDAO
 */
public class UsuarioDAO extends GenericDAO<Usuario, BigDecimal> {

    public Usuario getUsuarioByEmail(Usuario usuario) {
        Session s = this.getSession();
        Usuario user = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Usuario where funcionario.email = :email and senha = :senha");
            q.setString("email", usuario.getFuncionario().getEmail());
            q.setString("senha", usuario.getSenha());
            user = findOne(q);
            if (user != null) {
                Hibernate.initialize(user.getFuncionario().getUnidade());
            }
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return user;
    }
}
