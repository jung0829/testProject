package bit.com.a.model;

import java.io.Serializable;

public class BbsSerParam implements Serializable {

	private String selectOpts;
	private String serchWord;
	
	public BbsSerParam() {
		// TODO Auto-generated constructor stub
	}

	public BbsSerParam(String selectOpts, String serchWord) {
		super();
		this.selectOpts = selectOpts;
		this.serchWord = serchWord;
	}

	public String getSelectOpts() {
		return selectOpts;
	}

	public void setSelectOpts(String selectOpts) {
		this.selectOpts = selectOpts;
	}

	public String getSerchWord() {
		return serchWord;
	}

	public void setSerchWord(String serchWord) {
		this.serchWord = serchWord;
	}

	@Override
	public String toString() {
		return "BbsSerParam [selectOpts=" + selectOpts + ", serchWord=" + serchWord + "]";
	}
	
	
}
