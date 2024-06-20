package com.exam.dto.user;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.apache.ibatis.type.Alias;

@Alias("User")
public class UserDTO {

    private int id;

    @NotBlank(message = "필수 입력 필드입니다")
    private String login_id;

    private String password;

    @NotBlank(message = "필수 입력 필드입니다")
    private String name;

    private LocalDate birth_date;

    private String email;

    private String phone;

    private String address1;
    private String address2;

    private int role; // 사용자 역할을 나타내는 int 값

    public UserDTO() {
    }

    public UserDTO(int id, @NotBlank(message = "필수 입력 필드입니다") String login_id, String password,
            @NotBlank(message = "필수 입력 필드입니다") String name, LocalDate birth_date, String email, String phone,
            String address1, String address2, int role) {
        this.id = id;
        this.login_id = login_id;
        this.password = password;
        this.name = name;
        this.birth_date = birth_date;
        this.email = email;
        this.phone = phone;
        this.address1 = address1;
        this.address2 = address2;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin_id() {
        return login_id;
    }

    public void setLogin_id(String login_id) {
        this.login_id = login_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(LocalDate birth_date) {
        this.birth_date = birth_date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "UserDTO [id=" + id + ", login_id=" + login_id + ", password=" + password + ", name=" + name
                + ", birth_date=" + birth_date + ", email=" + email + ", phone=" + phone + ", address1=" + address1
                + ", address2=" + address2 + ", role=" + role + "]";
    }
}
