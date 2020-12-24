package main.java.hugo.service;

import main.java.hugo.model.MemberArea;

public interface IMemberAreaService {
	public MemberArea select(int id);
	public MemberArea insert(MemberArea memberArea);
}
