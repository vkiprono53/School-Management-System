package com.kiprono.models;
/**
 * @author Vincent Kiprono
 */

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbl_grade")
public class Grade implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String gradeName;
    private String gradeDesc;

    private boolean deleted;

    public Grade() {
    }

    public String getGradeName() {
        return gradeName;
    }


    public void setGradeName(String gradeName) {
        this.gradeName = gradeName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getGradeDesc() {
        return gradeDesc;
    }

    public void setGradeDesc(String gradeDesc) {
        this.gradeDesc = gradeDesc;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
