package main.java.hugo.service;

import java.util.List;

import main.java.hugo.model.MemberAdvanced;

public interface IMemberAdvancedService {
	public MemberAdvanced select(int id);
	public MemberAdvanced insert(MemberAdvanced memberAdvanced);
	public void update(MemberAdvanced memberAdvanced);
	public List<MemberAdvanced> selectAll();
}
