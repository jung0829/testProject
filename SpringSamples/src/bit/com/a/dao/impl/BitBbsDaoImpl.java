package bit.com.a.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.BitBbsDao;
import bit.com.a.model.BbsDto;
import bit.com.a.model.BbsParam;
import bit.com.a.model.BbsSerParam;

@Repository
public class BitBbsDaoImpl implements BitBbsDao {

	@Autowired
	SqlSession sqlSession;
	
	String Namespace = "Bbs.";
	
	// 전체 bbslist
	@Override
	public List<BbsDto> getBbsList() {
		List<BbsDto> list = sqlSession.selectList(Namespace + "allBbsList");		
		return list;
	}	
	
	
	
}
