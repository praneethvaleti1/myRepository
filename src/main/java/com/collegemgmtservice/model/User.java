package com.collegemgmtservice.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class User implements Comparable<User> {

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

	@Id
	private String userId;

	private String password;
	private boolean isAdmin = false;
	private String name;
	private String gender;
	private int age;
	private String semester;
	private String petName;
	private String department;

	public User(String userId, String password) {
		super();
		this.userId = userId;
		this.password = password;

		if (userId.equals("admin01")) {
			isAdmin = true;
		}
	}
	
	

	@Override
	public int compareTo(User u) {
		if (getName() == null || u.getName() == null) {
			return 0;
		}
		return getName().toLowerCase().compareTo(u.getName().toLowerCase());
	}

	public User(String userId, String password, String name, String gender, int age, String petName) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.petName = petName;
	}

}
