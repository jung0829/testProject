package bit.com.a.model;

import java.io.Serializable;

public class BbsParam implements Serializable {

	private int seq;
	private String id;
	private String title;
	private String content;
	
	public BbsParam() {
		// TODO Auto-generated constructor stub
	}

	public BbsParam(int seq, String id, String title, String content) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "BbsParam [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + "]";
	}
	
}
