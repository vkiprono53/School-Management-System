package com.kiprono.beans;

import java.util.List;

public interface BaseCrudI<T> {
    T add(T t);

    T edit(T t);

    boolean delete(T t);

    List<T> selectAll();

    T findById(long id);


}
