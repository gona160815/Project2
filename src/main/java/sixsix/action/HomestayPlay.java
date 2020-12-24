package main.java.sixsix.action;

import java.awt.print.Printable;
import java.io.InputStreamReader;
import java.lang.reflect.GenericArrayType;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

import javax.swing.LayoutStyle;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar;

import main.java.sixsix.dao.HomestayDAO;

public class HomestayPlay {

	public static void main(String[] args) {
		HomestayDAO dt = new HomestayDAO();
		Scanner scann = new Scanner(System.in);
		System.out.println("新建表格 1.是 2.輸入資料");
		int yesorno=scann.nextInt();
		if(yesorno==1) {
			System.out.println("123");
			dt.CreateTable();
			System.out.println("新增成功");
		}else if(yesorno==2) {
			dt.Inputdata();
			System.out.println("插入成功");
		}
		
		

	}

}
