package managers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import models.Tweet;
import utils.DB;


public class ManageTweets {
	
	private DB db = null ;
	
	public ManageTweets() {
		try {
			db = new DB();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void finalize() {
		try {
			db.disconnectBD();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
	
	/* Add a tweet */
	public void addTweet(Tweet tweet) {
		String query = "INSERT INTO tweets (uid,author,postDate,content) VALUES (?,?,?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setInt(1,tweet.getUid());
			statement.setString(2,tweet.getUname());
			statement.setTimestamp(3,tweet.getPostDateTime());
			statement.setString(4,tweet.getContent());
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/* Delete existing tweet */
	public void deleteTweet(Integer id,Integer uid) {
		String query = "DELETE FROM tweets WHERE id = ? AND uid=?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setInt(1,id);
			statement.setInt(2,uid);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/* Get tweets from a user given start and end*/
	public List<Tweet> getUserTweets(Integer uid,Integer start, Integer end) {
		 String query = "SELECT tweets.id,tweets.uid,tweets.postDate,tweets.content,users.usr FROM tweets INNER JOIN users ON tweets.uid = users.id where tweets.uid = ? ORDER BY tweets.postDate DESC LIMIT ?,? ;";
		 PreparedStatement statement = null;
		 List<Tweet> l = new ArrayList<Tweet>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setInt(1,uid);
			 statement.setInt(2,start);
			 statement.setInt(3,end);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 Tweet tweet = new Tweet();
       		     tweet.setId(rs.getInt("id"));
				 tweet.setUid(rs.getInt("uid"));
				 tweet.setPostDateTime(rs.getTimestamp("postDate"));
				 tweet.setContent(rs.getString("content"));
				 tweet.setUname(rs.getString("usr"));
				 l.add(tweet);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	/* Get followed tweets from a user given start and end*/
	public List<Tweet> getFollowedTweets(Integer uid,Integer start, Integer end) {
		 String query = "SELECT tweets.id,tweets.uid,tweets.postDate,tweets.content,tweets.author FROM tweets INNER JOIN follows ON tweets.uid = follows.followed where follows.follower = ? ORDER BY tweets.postDate DESC LIMIT ?,? ;";
		 PreparedStatement statement = null;
		 List<Tweet> l = new ArrayList<Tweet>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setInt(1,uid);
			 statement.setInt(2,start);
			 statement.setInt(3,end);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 Tweet tweet = new Tweet();
       		     tweet.setId(rs.getInt("id"));
				 tweet.setUid(rs.getInt("uid"));
				 tweet.setPostDateTime(rs.getTimestamp("postDate"));
				 tweet.setContent(rs.getString("content"));
				 tweet.setUname(rs.getString("author"));
				 l.add(tweet);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	/* Get global tweets */
	public List<Tweet> getGlobalTweets(Integer start, Integer end) {
		 String query = "SELECT tweets.id,tweets.uid,tweets.postDate,tweets.content,tweets.author FROM tweets ORDER BY tweets.postDate DESC LIMIT ?,? ;";
		 PreparedStatement statement = null;
		 List<Tweet> l = new ArrayList<Tweet>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setInt(1,start);
			 statement.setInt(2,end);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 Tweet tweet = new Tweet();
       		     tweet.setId(rs.getInt("id"));
				 tweet.setUid(rs.getInt("uid"));
				 tweet.setPostDateTime(rs.getTimestamp("postDate"));
				 tweet.setContent(rs.getString("content"));
				 tweet.setUname(rs.getString("author"));
				 l.add(tweet);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	
	/* Like tweet */
	public void likeTweet(Integer id,Integer uid) {
		String query = "INSERT INTO likes (usrId,tweetId) VALUES (?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setInt(1,uid);
			statement.setInt(2,id);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/* Retweet tweet */
	public void retweetTweet(Integer id,Integer uid) {
		String query = "INSERT INTO retweets (usrId,tweetId,date) VALUES (?,?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setInt(1,uid);
			statement.setInt(2,id);
			statement.setTimestamp(3,new Timestamp(System.currentTimeMillis()));
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}