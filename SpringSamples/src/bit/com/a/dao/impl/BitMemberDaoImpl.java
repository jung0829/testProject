package bit.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.BitMemberDao;
import bit.com.a.model.MemberDto;

@Repository
public class BitMemberDaoImpl implements BitMemberDao {
	
	@Autowired
	SqlSession sqlSession;	// applicationContext.xml 의 SqlSession 인터페이스에 접근할 수 있도록 오토와이어
	
	String Namespace = "Member."; //Member -> BitMember.xml의 <mapper namespace="Member"> 에 맵핑되는것. 뒤에 .을 반드시 붙여야 맵핑되어 사용가능
	
	@Override
	public boolean addmember(MemberDto mem) throws Exception {

		int n = sqlSession.insert(Namespace + "addmember", mem);	//(Member.addmember, mem(dto))
		return n>0?true:false;
	}

	@Override
	public int getId(String mem) {
		
		int n = sqlSession.selectOne(Namespace + "getId", mem);	// String 말고 dto로 받아서 제약 어떻게?
		
		return n;
	}

	@Override
	public MemberDto getMember(MemberDto mem) {
		
		MemberDto dto = sqlSession.selectOne(Namespace + "getMember", mem);	// String 말고 dto로 받아서 제약 어떻게?
		System.out.println( "daoimple getId login reslt = " + dto.toString() );
		
		return dto;
		
	}
	
	
	
	
}
