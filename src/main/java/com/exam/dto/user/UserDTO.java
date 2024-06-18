package com.exam.dto.user;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.apache.ibatis.type.Alias;

@Alias("User")
public class UserDTO {
	
	private  int id;
	
	@NotBlank(message = "적어도 한글이상")
	private String login_id;
	
	private String password;
	
	@NotBlank(message = "적어도 한글이상")
	private String name;
	
	private LocalDate  birth_date;
	
	private String email;
	
	private String phone;
	
	private int role;

	public UserDTO() {
	}

	public UserDTO(int id, String login_id, String password, String name, LocalDate birth_date, String email, String phone,
			int role) {
		this.id = id;
		this.login_id = login_id;
		this.password = password;
		this.name = name;
		this.birth_date = birth_date;
		this.email = email;
		this.phone = phone;
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

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", login_id=" + login_id + ", password=" + password + ", name=" + name
				+ ", birth_date=" + birth_date + ", email=" + email + ", phone=" + phone + ", role=" + role + "]";
	}

}
