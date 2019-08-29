package bit.com.a.service;

import bit.com.a.model.MemberDto;

public interface BitMemberService {

	public boolean addmember(MemberDto mem) throws Exception;
	
	public int getId(String mem);
	
	public MemberDto getMember(MemberDto mem);
	
	
}
