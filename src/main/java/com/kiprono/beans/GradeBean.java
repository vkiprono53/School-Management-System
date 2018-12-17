package com.kiprono.beans;

import com.kiprono.models.Grade;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;

@Stateless
public class GradeBean extends BaseCrudBean<Grade> implements GradeI {
    @PostConstruct
    void setEntityClass(){
        this.entityClass = Grade.class;
    }
}
