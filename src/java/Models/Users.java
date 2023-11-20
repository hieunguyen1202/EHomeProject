/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Hieu
 */
public class Users {
    private String username;
    private String password;
    private String email;
    private String phone;
    private String fullname;
    private Boolean gender;
    private String dob;
    private int role;
    private String image;
    private String citizenNumber;
    private String citizenNumberDate;

    public Users() {
    }

    public Users(String username, String password, String email, String phone, String fullname, Boolean gender, String dob, int role, String image, String citizenNumber, String citizenNumberDate) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.fullname = fullname;
        this.gender = gender;
        this.dob = dob;
        this.role = role;
        this.image = image;
        this.citizenNumber = citizenNumber;
        this.citizenNumberDate = citizenNumberDate;
    }

    public Users(String username, String fullname, boolean gender, String email, String phone, int role) {
        this.username = username;
        this.fullname = fullname;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.role = role;
    }
    public Users(String username, String password, int role, String image, String fullname) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.image = image;
        this.fullname = fullname;
    }

    public Users(String fullname, String email, String phone, boolean gender, String dob, String citizenNumber, String citizenNumberDate) {
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.dob = dob;
        this.citizenNumber = citizenNumber;
        this.citizenNumberDate = citizenNumberDate;
    }

    public Users(int role,String username) {
        this.role = role;
        this.username = username;
    }

    public Users(String username, String fullname, String email, String phone, boolean gender, String dob, String image, String citizenNumber, String citizenNumberDate) {
        this.username = username;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.dob = dob;
        this.image = image;
        this.citizenNumber = citizenNumber;
        this.citizenNumberDate = citizenNumberDate;
    }

    public Users(String username,String fullname, String image, String email, String phone) {
        this.username = username;
        this.fullname = fullname;
        this.image = image;
        this.email = email;
        this.phone = phone;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Boolean isGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCitizenNumber() {
        return citizenNumber;
    }

    public void setCitizenNumber(String citizenNumber) {
        this.citizenNumber = citizenNumber;
    }

    public String getCitizenNumberDate() {
        return citizenNumberDate;
    }

    public void setCitizenNumberDate(String citizenNumberDate) {
        this.citizenNumberDate = citizenNumberDate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
