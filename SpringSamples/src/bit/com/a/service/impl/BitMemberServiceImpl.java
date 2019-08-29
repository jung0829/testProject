package bit.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.BitMemberDao;
import bit.com.a.model.MemberDto;
import bit.com.a.service.BitMemberService;

@Service
public class BitMemberServiceImpl implements BitMemberService {

	@Autowired
	private BitMemberDao bitMemberDao;

	@Override
	public boolean addmember(MemberDto mem) throws Exception {
		return bitMemberDao.addmember(mem);
	}

	@Override
	public int getId(String mem) {
		return bitMemberDao.getId(mem);
	}

	@Override
	public MemberDto getMember(MemberDto mem) {
		return bitMemberDao.getMember(mem);
	}
	
	
	
	
}
