package com.kiprono.beans;

import com.kiprono.models.Teacher;

import javax.annotation.PostConstruct;
import javax.ejb.Stateful;
import javax.ejb.Stateless;

@Stateful
public class TeacherBean extends BaseCrudBean<Teacher> implements TeacherI {
    @PostConstruct
    void setEntityClass(){
        this.entityClass= Teacher.class;
    }

}
