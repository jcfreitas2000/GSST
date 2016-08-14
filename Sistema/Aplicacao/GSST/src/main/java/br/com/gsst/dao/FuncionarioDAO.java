package br.com.gsst.dao;

import br.com.gsst.model.Funcionario;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;


/*
    Autor: José Carlos de Freitas
    Data: 11/08/2016, 22:04:01
    Arquivo: FuncionarioDAO
*/

public class FuncionarioDAO extends GenericDAO<Funcionario, BigDecimal>{

    public List<Funcionario> getFuncionariosByUnidade(int idUnidade){
        Session s = this.getSession();
        List<Funcionario> funcionarios = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery(" from Funcionario where unidade.idUnidade = :id")
                    .setInteger("id", idUnidade);
            funcionarios = findMany(q);
            s.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.getTransaction().rollback();
        }

        return funcionarios;
    }
}
