package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class User implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String name = "";
	private String user = "";
	private String dbirth="";
	private int VRequest;
	private String mail = "";
	private String pwd1 = "";
	private String pwd2 = "";
	private String gender = "N";
	private String usrtype = "R";
	
	private boolean[] error = {false,false,false,false,false,false,false,false,false,false}; 
	
	public User() {
		
	}
	
	/* Getters */
	public int getId() {
		return this.id;
	}
	public String getName() {
		return this.name;
	}
	public String getUser() {
		return this.user;
	}
	public String getDbirth() {
		return this.dbirth;
	}
	public int getVRequest() {
		return this.VRequest;
	}
	public String getMail() {
		return this.mail;
	}
	public String getPwd1() {
		return this.pwd1;
	}
	public String getPwd2() {
		return this.pwd2;
	}
	public String getGender() {
		return this.gender;
	}
	public String getUsrtype() {
		return this.usrtype;
	}
	public boolean[] getError() {
		return error;
	}
	
	
	/*Setters*/
	public void setId(int id) {
		this.id = id; 
	}
	public void setName(String name) {
		this.name = name; 
	}
	public void setUser(String user) {
		
		this.user = user;
	}
		
	public void setDbirth(String dbirth) {
			
			System.out.println(dbirth);
			this.dbirth = dbirth; 
		}
	public void setVRequest(int vRequest) {
		if (vRequest == 0) {
			this.VRequest = 1;
		}else {
			this.VRequest =0;
		}
	}
	
	public void setMail(String mail) {
		String regex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(mail);
		if (matcher.matches()) {
			this.mail = mail;
		} else {
			error[4]=true;
		}
		
	}
	/*public void setMail(String mail) {
		String regex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(mail);
		if (matcher.matches()) {
			if (checkMail(mail)){
				error[4] = true;
			}else {
				this.mail = mail;
				System.out.println(mail);
				error[4] = false;
			}
	
		} else {
			error[4]=true;
			System.out.println(mail);
		}
		
	}*/
	public void setPwd1(String pwd1) {
		/* TODO check restriction with pattern */
		if (Pattern.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$", pwd1)){
			this.pwd1 = pwd1;
			System.out.println(pwd1);
		}
	}
	public void setPwd2(String pwd2) {
		/* TODO check restriction with pattern and check if pwd1=pwd2*/
		if(pwd2.equals(this.pwd1)) {
			this.pwd2 = pwd2;
			System.out.println(pwd2);
		}
	}
	public void setGender(String gender) {
		
		this.gender = gender;
	}
	public void setUsrtype(String usrtype) {
			
		this.usrtype = usrtype;
	}
	/*
	public void setUserlog(String userlog) {
		try {
			if(checkUser(userlog)) {
				error[8] = false;
				System.out.println("valid user");
				this.userlog = userlog; 
			}else {
				error[8] =true;
				System.out.println("user does not exist");
				System.out.println(error);
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		
	}*/
	
	public void setError(int i,boolean value) {
		error[i] = value;
	}
		
	/*check*/
	//check username is not already in db
	public boolean checkUser(String user) {
		String query = "SELECT * FROM users WHERE usr = '" + user + "'";
		try {
			String u = "mysql";
			String password="prac";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/lab2?serverTimezone=UTC&user="+u+"&password="+password);
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(query);
			return rs.next();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	//check mail is not already in db
	public boolean checkMail(String mail) {
		String query = "SELECT * FROM users WHERE mail = '" + mail + "'";
		try {
			String u = "mysql";
			String password="prac";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/lab2?serverTimezone=UTC&user="+u+"&password="+password);
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(query);
			return rs.next();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false; 
	}	
	
	/*Sign in Functions */
	public boolean isComplete() {
	    return(hasValue(getName()) &&
	    	   hasValue(getUser()) &&
	    	   hasValue(getDbirth()) &&
	    	   hasValue(getMail()) &&
	    	   hasValue(getPwd1()) &&
	           hasValue(getPwd2()) &&
	           hasValue(getGender())
	           );
	}

	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
	
}
