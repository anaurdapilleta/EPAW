package models;
import java.sql.Timestamp;

public class Tweet implements java.io.Serializable {

	 private static final long serialVersionUID = 1L;

	 private int id;
	 private int uid;
	 private String uname;
	 private Timestamp postDateTime;
	 private String content;
	 private String hashtags;
	 private int nLikes;
	 private int nRetweets;
	 private int parentid;

	 public Tweet() {
	 }

	 public Integer getId() {
		 return this.id;
	 }
	 
	 public void setId(Integer id) {
		 this.id = id;
	 }

	 public int getUid() {
		 return this.uid;
	 }
	 
	 public void setUid(int uid) {
		 this.uid = uid;
	 }
	 
	 public String getUname() {
		 return this.uname;
	 }
	 
	 public void setUname(String uname) {
		 this.uname = uname;
	 }
	 
	 public Timestamp getPostDateTime() {
		 return this.postDateTime;
	 }
	 public void setPostDateTime(Timestamp postDateTime) {
		 this.postDateTime = postDateTime;
	 }
	 
	 public String getContent() {
		 return this.content;
	 }
	 public void setContent(String content) {
		 this.content = content;
	 }
	 public String getHashtags() {
		 return this.hashtags;
	 }
	 public void setHashtags(String hashtags) {
		 this.hashtags = hashtags;
	 }
	 public int getNlikes() {
		 return this.nLikes;
	 }
	 public void setNlikes(int nLikes) {
		 this.nLikes = nLikes;
	 }
	 public int getNretweets() {
		 return this.nRetweets;
	 }
	 public void setNretweets(int nRetweets) {
		 this.nRetweets = nRetweets;
	 }
	 public int getParentid() {
		 return this.parentid;
	 }
	 public void setParentid(int parentid) {
		 this.parentid = parentid;
	 }
	 

}