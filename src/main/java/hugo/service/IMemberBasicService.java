package main.java.hugo.service;

import java.util.List;
import java.util.Set;

import main.java.hugo.model.MemberAuth;
import main.java.hugo.model.MemberBasic;

public interface IMemberBasicService {
	public MemberBasic insert(MemberBasic memberBasic); 
	public MemberBasic select(int id);
	public MemberBasic queryone(String email);
	public MemberBasic update(MemberBasic memberBasic);
	public int countAll();
	public int countArea(String area);
	public List<MemberBasic> selectArea(int areaId);
//	public Set<MemberBasic> selectByArea(int areaId);
	public boolean deleteMemberBasice(int memberid);
	public void updateBasicInfo(MemberBasic memberBasic);
	public List<MemberBasic> selectGender(String gender);
	public List<MemberAuth> selectStatus(Integer statusId);
	public List<MemberBasic> selectFavor(Integer favorId);
	public List<MemberBasic> allRangeQuery(String query);
	public List<MemberAuth> selectAuthority(Integer authorityId);
	public List<MemberBasic> selectAll();
	public List<MemberBasic> getEveryAreaOfMember(Integer areaId);
	public boolean deleteMGR(Integer memberId);
	public List<MemberBasic> getEveryDayOfMember(String dateStart,String dateEnd);
	public void logOut();
}
