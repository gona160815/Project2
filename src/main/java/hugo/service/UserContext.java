package main.java.hugo.service;

import main.java.hugo.model.MemberBasic;

public interface UserContext {
	MemberBasic getCurrentUser();
	void setCurrentUser(MemberBasic user);
}
