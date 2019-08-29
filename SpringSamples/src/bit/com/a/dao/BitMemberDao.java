package bit.com.a.dao;

import bit.com.a.model.MemberDto;

public interface BitMemberDao {
	
	public boolean addmember(MemberDto mem)throws Exception;
	
	public int getId(String mem);
	
	public MemberDto getMember(MemberDto mem);
}
