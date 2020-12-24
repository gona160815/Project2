package main.java.hugo.service;

import main.java.hugo.model.MemberAuth;

public interface IMemberAuthService {
	public MemberAuth insert(MemberAuth memberAuth);//新增
	public MemberAuth updateStatus(int id,int stausId);//siugai
	public MemberAuth select(int id);//chaxiun
	public boolean delete(int id);
}
