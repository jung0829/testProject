package bit.com.a.dao;

import java.util.List;

import bit.com.a.model.BbsDto;
import bit.com.a.model.BbsParam;
import bit.com.a.model.BbsSerParam;

public interface BitBbsDao {

	// 전체bbslist
	public List<BbsDto> getBbsList();
	
}
