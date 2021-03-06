package br.com.gsst.dao;

import br.com.gsst.model.Usuario;
import java.math.BigDecimal;
import java.util.List;
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

    public List<Usuario> getUsuariosByUnidade(int idUnidade) {
        Session s = this.getSession();
        List<Usuario> users = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Usuario where funcionario.unidade.idUnidade = :idUnidade")
                    .setInteger("idUnidade", idUnidade);
            users = findMany(q);
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return users;
    }

    public Usuario getUsuarioById(int id) {
        Session s = this.getSession();
        Usuario user = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Usuario where idFuncionario = :id")
                    .setInteger("id", id);
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

    public Usuario getUsuarioByEmailAndSenha(Usuario usuario) {
        Session s = this.getSession();
        Usuario user = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Usuario where funcionario.email = :email and senha = :senha")
                    .setString("email", usuario.getFuncionario().getEmail())
                    .setString("senha", usuario.getSenha());
            user = findOne(q);
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return user;
    }

    public Usuario getUsuarioByEmail(String email) {
        Session s = this.getSession();
        Usuario user = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Usuario where funcionario.email = :email")
                    .setString("email", email);
            user = findOne(q);
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return user;
    }

    public boolean salvar(Usuario usuario) {
        Session s = this.getSession();

        try {
            s.beginTransaction();
            this.save(usuario);

            s.getTransaction().commit();

            return true;
        } catch (Exception e) {
            s.getTransaction().rollback();
            e.printStackTrace();

            return false;
        }
    }
}
