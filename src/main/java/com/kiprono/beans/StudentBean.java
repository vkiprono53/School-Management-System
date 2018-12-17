package com.kiprono.beans;

import com.kiprono.models.Student;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;

@Stateless
public class StudentBean extends BaseCrudBean<Student> implements StudentI {
    @PostConstruct
    void setEntityClass(){
        this.entityClass = Student.class;
    }
}
