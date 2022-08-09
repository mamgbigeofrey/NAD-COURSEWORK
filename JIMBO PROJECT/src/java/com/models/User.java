package com.models;

public class User {
	private int id;
	private String firstName;
        private String lastName;
	private String email;
	private String password;
        private String address;
        private String gender;
        private int age;
        
        

	public User() {
	}

	public User(int id, String firstName,  String lastName,String email, String password,String address,String gender,int age) {
		this.id = id;
		this.firstName = firstName;
                this.lastName = lastName;
		this.email = email;
		this.password = password;
                this.gender = gender;
                this.password = address;
                this.age = age;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
        public String getName(){
            String name = this.firstName +" "+ this.lastName;
            return name;
        }
 
	 public void setLastName(String name) {
		this.lastName = name;
	}

	public void setFirstName(String name) {
		this.firstName = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
        public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
         public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
            public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + firstName+" "+lastName + ", email=" + email + ",address=" + address + ",gender=" + gender + ", password=" + password + "]";
	}
	
}
