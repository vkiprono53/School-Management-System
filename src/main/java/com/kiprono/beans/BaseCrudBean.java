package com.kiprono.beans;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import java.util.List;

public class BaseCrudBean<T> implements BaseCrudI<T> {

    @PersistenceContext
    EntityManager entityManager;
    protected Class<T> entityClass;

    @Override
    public T add(T t) {
        try {
            entityManager.persist(t);
        } catch (PersistenceException e) {
            e.printStackTrace();
        } finally {
        }
        return null;
    }

    @Override
    public T edit(T t) {
        try {
            entityManager.merge(t);
        } catch (PersistenceException e) {
            e.printStackTrace();
        } finally {
        }
        return null;
    }

    @Override
    public boolean delete(T t) {

        try {
            t = entityManager.merge(t);
            entityManager.remove(t);
            return true;
        } catch (PersistenceException e) {
            e.printStackTrace();
        } finally {
        }
        return false;
    }

    @Override
    public List<T> selectAll() {

        try {

            return entityManager.createQuery("SELECT t FROM " + entityClass.getSimpleName() + " t" + " WHERE deleted = 'false'").getResultList();

        } catch (PersistenceException e) {
            e.printStackTrace();
        } finally {
        }

        return null;
    }

    @Override
    public T findById(long id) {
        try {
            return entityManager.find(entityClass, id);

        } catch (PersistenceException e) {
            e.printStackTrace();
        } finally {
        }

        return null;
    }
}
