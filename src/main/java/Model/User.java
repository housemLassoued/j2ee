package Model;

public class User {
	private int id;
	private String Name;
	private String email;
	private String password;
	public User() {
		super();
	}
	public User(int id, String name, String email, String password) {
		super();
		this.id = id;
		Name = name;
		this.email = email;
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
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
	@Override
	public String toString() {
		return "User [id=" + id + ", Name=" + Name + ", email=" + email + ", password=" + password + "]";
	}
	

}
