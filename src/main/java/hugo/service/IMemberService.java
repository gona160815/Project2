package main.java.hugo.service;

import java.util.List;

import main.java.hugo.model.Member;


public interface IMemberService {
	public Member insert(Member member); 
	public Member select(int id);
	public Member queryone(String email);
	public Member update(Member member);
	public int countAll();
	public int countArea(String area);
	public List<Member> selectArea(String area);
	public boolean deleteMember(int memberid);
}
