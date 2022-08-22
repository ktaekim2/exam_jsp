package com.example.test2.model;

public class MemberDTO {
    private String custno;
    private String custname;
    private String phone;
    private String address;
    private String joindate;
    private String grade;
    private String city;

    public String getCustno() {
        return custno;
    }

    public void setCustno(String custno) {
        this.custno = custno;
    }

    public String getCustname() {
        return custname;
    }

    public void setCustname(String custname) {
        this.custname = custname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getJoindate() {
        return joindate;
    }

    public void setJoindate(String joindate) {
        this.joindate = joindate;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "MemberDTO{" +
                "custno='" + custno + '\'' +
                ", custname='" + custname + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", joindate='" + joindate + '\'' +
                ", grade='" + grade + '\'' +
                ", city='" + city + '\'' +
                '}';
    }
}
