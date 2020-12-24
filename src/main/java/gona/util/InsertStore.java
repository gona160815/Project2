package main.java.gona.util;

import java.util.Scanner;

import main.java.gona.dao.StoreDao;

public class InsertStore {
	public static void main(String[] args) {

		StoreDao dt = new StoreDao();
		dt.inputStore();
	}
}
