package com.kiprono.beans;

import com.kiprono.models.Student;

import javax.ejb.Local;

@Local
public interface StudentI extends BaseCrudI<Student> {
}
