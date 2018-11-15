package kr.co.gogreat.domain.admin;

import java.io.Serializable;

public class AdminMember implements Serializable{

	private String id;
	private String password;
	private String groupId;
	private String mail;
	private String userName;
	
	
	// constructor()
	public AdminMember(){}
	public AdminMember(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
	public AdminMember(String id, String password, String groupId, String mail,
			String userName) {
		super();
		this.id = id;
		this.password = password;
		this.groupId = groupId;
		this.mail = mail;
		this.userName = userName;
	}


	// getter() / setter()
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getGroupId() {
		return groupId;
	}


	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}


	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	// toString()
	@Override
	public String toString() {
		return "AdminMember [id=" + id + ", password=" + password
				+ ", groupId=" + groupId + ", mail=" + mail + ", userName="
				+ userName + "]";
	}


	// hashCode()
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((groupId == null) ? 0 : groupId.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((mail == null) ? 0 : mail.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result
				+ ((userName == null) ? 0 : userName.hashCode());
		System.out.println("111111111111111111" + result);
		
		return result;
		
		
		
	}


	// equals()
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AdminMember other = (AdminMember) obj;
		if (groupId == null) {
			if (other.groupId != null)
				return false;
		} else if (!groupId.equals(other.groupId))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (mail == null) {
			if (other.mail != null)
				return false;
		} else if (!mail.equals(other.mail))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		return true;
	}
	
	
	
}
