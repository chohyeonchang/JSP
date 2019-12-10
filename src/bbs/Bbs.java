package bbs;

public class Bbs {
	private int number;
	private String Title;
	private String userID;      
	private String Date;
	private String Content;
	private int plag;
	
	private String post_id;    
	private String post_content;
	

	public String getPost_id() {
		return post_id;
	}

	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public int getnumber() {
		return number;
	}

	public void setnumber(int number) {

		this.number = number;

	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String Title) {
		this.Title = Title;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String Date) {
		this.Date = Date;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String Content) {
		this.Content = Content;
	}

	public int getplag() {
		return plag;
	}
	
	public void setplag(int plag) {
		this.plag = plag;

	}
}
