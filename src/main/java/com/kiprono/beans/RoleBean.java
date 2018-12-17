package com.kiprono.beans;

import com.kiprono.models.Role;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;

@Stateless
public class RoleBean extends BaseCrudBean<Role> implements RoleI {
    @PostConstruct
    void setEntityClass(){
        this.entityClass=Role.class;
    }
}
