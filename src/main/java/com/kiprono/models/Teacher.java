package com.kiprono.models;

import com.kiprono.enums.Gender;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbl_teacher")
public class Teacher implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String teacherName;
    private int teacherAge;
    private String teacherContact;
    @Enumerated(EnumType.STRING)
    private Gender gender;
    private boolean deleted;
    @OneToOne
    private Role teacherRole;

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public Role getTeacherRole() {
        return teacherRole;
    }

    public void setTeacherRole(Role teacherRole) {
        this.teacherRole = teacherRole;
    }

    public Teacher() {
    }

    public int getTeacherAge() {
        return teacherAge;
    }

    public void setTeacherAge(int teacherAge) {
        this.teacherAge = teacherAge;
    }

    public String getTeacherContact() {
        return teacherContact;
    }

    public void setTeacherContact(String teacherContact) {
        this.teacherContact = teacherContact;
    }


    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }



}
