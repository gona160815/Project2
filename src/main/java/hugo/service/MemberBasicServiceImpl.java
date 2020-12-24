package main.java.hugo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import main.java.hugo.dao.MemberBasicDAO;
import main.java.hugo.model.MemberAuth;
import main.java.hugo.model.MemberBasic;
@Service("memberBasicServiceImpl")
public class MemberBasicServiceImpl implements IMemberBasicService{
	@Autowired @Qualifier("memberBasicDAO")
	private MemberBasicDAO memberBasicDAO; 
	


	@Override
	public MemberBasic insert(MemberBasic memberBasic) {
		return memberBasicDAO.insert(memberBasic);
	}

	@Override
	public MemberBasic select(int id) {
		return memberBasicDAO.select(id);
	}

	@Override
	public MemberBasic queryone(String email) {
		return memberBasicDAO.queryone(email);
	}

	@Override
	public MemberBasic update(MemberBasic memberBasic) {
		return memberBasicDAO.update(memberBasic);
	}

	@Override
	public int countAll() {
		return memberBasicDAO.countAll();
	}

	@Override
	public int countArea(String area) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberBasic> selectArea(int areaId) {
		return memberBasicDAO.selectArea(areaId);
	}

	@Override
	public boolean deleteMemberBasice(int memberid) {
		// TODO Auto-generated method stub
		return false;
	}

//	@Override
//	public Set<MemberBasic> selectByArea(int areaId) {
//		return memberBasicDAO.selectByArea(areaId);
//	}
	
	public List<Object> selectAreaJoinAdvanced(int areaId){
		return memberBasicDAO.selectAreaJoinAdvanced(areaId);
	}

	@Override
	public void updateBasicInfo(MemberBasic memberBasic) {
		memberBasicDAO.updateBasicInfo(memberBasic);
		
	}

	@Override
	public List<MemberBasic> selectGender(String gender) {
		return memberBasicDAO.selectGender(gender);
	}

	@Override
	public List<MemberAuth> selectStatus(Integer statusId) {
		return memberBasicDAO.selectStatus(statusId);
	}

	@Override
	public List<MemberBasic> selectFavor(Integer favorId) {
		return memberBasicDAO.selectFavor(favorId);
	}

	@Override
	public List<MemberBasic> allRangeQuery(String query) {
		return memberBasicDAO.allRangeQuery(query);
	}

	@Override
	public List<MemberAuth> selectAuthority(Integer authorityId) {
		return memberBasicDAO.selectAuthority(authorityId);
	}

	@Override
	public List<MemberBasic> selectAll() {
		return memberBasicDAO.selectAll();
	}

	@Override
	public List<MemberBasic> getEveryAreaOfMember(Integer areaId) {
		return memberBasicDAO.getEveryAreaOfMember(areaId);
	}

	@Override
	public boolean deleteMGR(Integer memberId) {
		return memberBasicDAO.deleteMGR(memberId);
	}

	@Override
	public List<MemberBasic> getEveryDayOfMember(String dateStart, String dateEnd) {
		return memberBasicDAO.getEveryDayOfMember(dateStart, dateEnd);
	}

	@Override
	public void logOut() {
		// TODO Auto-generated method stub
		
	}
}
