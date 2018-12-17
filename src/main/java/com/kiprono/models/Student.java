package com.kiprono.models;

import com.kiprono.enums.Gender;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbl_student")
public class Student implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private  String studentName;
    private int studentAge;

    @Enumerated(EnumType.STRING)
    private Gender gender;
    @OneToOne
    private Grade studentGrade;

    private boolean deleted;

    public Student() {
    }

    public int getStudentAge() {
        return studentAge;
    }

    public void setStudentAge(int studentAge) {
        this.studentAge = studentAge;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Grade getStudentGrade() {
        return studentGrade;
    }

    public void setStudentGrade(Grade studentGrade) {
        this.studentGrade = studentGrade;
    }


}
