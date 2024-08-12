package com.Class;

import java.sql.Timestamp;

public class TermCondition {

    private int id;
    private String termCondition;
    private Timestamp time;

    public TermCondition(int id, String termCondition, Timestamp time) {
        this.id = id;
        this.termCondition = termCondition;
        this.time = time;
    }

    public TermCondition(String termCondition, Timestamp time) {
        this.termCondition = termCondition;
        this.time = time;
    }

    public TermCondition() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTermCondition() {
        return termCondition;
    }

    public void setTermCondition(String termCondition) {
        this.termCondition = termCondition;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
    
    
}
