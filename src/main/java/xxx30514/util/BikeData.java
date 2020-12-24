package main.java.xxx30514.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import org.apache.commons.csv.CSVRecord;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class BikeData {
	@Autowired
	ServletContext ctx;
	
	@GetMapping(path = "/initBikeData")
	public String insertData()  {
		dropBikeTable();
		dropRestAreaTable();
		dropHotBikeTable();
		dropBikeErrorTable();
		createBikeTable();
		createBikeRestAreaTable();
		createHotBikeTable();
		createBikeErrorTable();
		insertfinalbike();
		insertrestarea();
		insertHotBikeRoad();
		return "bike/bike";
	}
	
	private DataSource dataSource;
	private CSVRecord CsvRecord;
	public DataSource getDataSource() {//連線
		// lazy init
		if (dataSource == null) {
			BasicDataSource ds = new BasicDataSource();
			ds.setDriverClassName("oracle.jdbc.OracleDriver");
			ds.setUrl("jdbc:oracle:thin:@//localhost:1521/xepdb1");
			ds.setUsername("pm");
			ds.setPassword("pm");
			ds.setMaxTotal(300); // 設定最多connection上線,超過使用量必須等待
			ds.setMaxIdle(300);

			dataSource = ds;// 把BasicDataSource放在屬性上
		}
		return dataSource;
	}
	
	public void dropBikeTable() {// 刪除表格
		try (Connection connection = getDataSource().getConnection();)
		{
			Statement stmt = connection.createStatement();
			String sql = "drop TABLE Bike";
			stmt.executeUpdate(sql);
			System.out.println("表格已刪除");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	public void dropRestAreaTable() {// 刪除表格
		try (Connection connection = getDataSource().getConnection();)
		{
			Statement stmt = connection.createStatement();
			String sql = "drop TABLE RestArea";
			stmt.executeUpdate(sql);
			System.out.println("表格已刪除");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	public void dropHotBikeTable() {// 刪除表格
		try (Connection connection = getDataSource().getConnection();)
		{
			Statement stmt = connection.createStatement();
			String sql = "drop TABLE HotBikeRoad";
			stmt.executeUpdate(sql);
			System.out.println("表格已刪除");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	public void dropBikeErrorTable() {// 刪除表格
		try (Connection connection = getDataSource().getConnection();)
		{
			Statement stmt = connection.createStatement();
			String sql = "drop TABLE BikeError";
			stmt.executeUpdate(sql);
			System.out.println("表格已刪除");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	public void createBikeTable() {// 建立表格(無資料)
		try (Connection connection = getDataSource().getConnection();) {
			Statement stmt = connection.createStatement();
			String sql = "create TABLE Bike \r\n"
					+ "(BK_id number GENERATED Always AS IDENTITY(start with 1 INCREMENT by 1) primary key not null,\r\n" + 
					"BK_name NVARCHAR2(500),BK_begin  NVARCHAR2(500),BK_goal NVARCHAR2(500),\r\n" + 
					"BK_city NVARCHAR2(500),BK_town NVARCHAR2(500),BK_maintain NVARCHAR2(500),BK_m  NVARCHAR2(500), BK_latitude NVARCHAR2(500),BK_longitude NVARCHAR2(500))";
			stmt.executeUpdate(sql);
			System.out.println("表格建立成功");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	public void createHotBikeTable() {// 建立表格(無資料)
		try (Connection connection = getDataSource().getConnection();) {
			Statement stmt = connection.createStatement();
			String sql = "create TABLE HotBikeRoad \r\n"
					+ "(HB_id number GENERATED Always AS IDENTITY(start with 1 INCREMENT by 1) primary key not null,\r\n" + 
					"HB_name NVARCHAR2(500),HB_city  NVARCHAR2(500),HB_town NVARCHAR2(500),\r\n" + 
					"HB_description  NVARCHAR2(2000))";
			stmt.executeUpdate(sql);
			System.out.println("表格建立成功");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	public void createBikeRestAreaTable() {// 建立表格(無資料)
		try (Connection connection = getDataSource().getConnection();) {
			Statement stmt = connection.createStatement();
			String sql = "create TABLE RestArea \r\n"
					+ "(RE_id number GENERATED Always AS IDENTITY(start with 1 INCREMENT by 1) primary key not null,\r\n" + 
					"RE_city NVARCHAR2(500),RE_town NVARCHAR2(500),RE_name NVARCHAR2(500),RE_address  NVARCHAR2(500),RE_tel NVARCHAR2(500))";
			stmt.executeUpdate(sql);
			System.out.println("表格建立成功");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	public void createBikeErrorTable() {// 建立表格(無資料)
		try (Connection connection = getDataSource().getConnection();) {
			Statement stmt = connection.createStatement();
			String sql = "create TABLE BikeError \r\n"
					+ "(BE_id number GENERATED Always AS IDENTITY(start with 1 INCREMENT by 1) primary key not null,\r\n" + 
					"    BE_title NVARCHAR2(500),member_id number ,BE_description NVARCHAR2(2000),BE_reply NVARCHAR2(2000),BE_tag NVARCHAR2(500),BE_status NVARCHAR2(2000),BE_picture BLOB ,BE_starttime timestamp,BE_endtime timestamp)";
			stmt.executeUpdate(sql);
			System.out.println("表格建立成功");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	public void read() {// 讀取CSV
		try (Connection connection = getDataSource().getConnection();) 
		{
			FileInputStream fis = new FileInputStream("src/main/java/xxx30514/table3.csv");
			InputStreamReader isr = new InputStreamReader(fis, "UTF8");
			BufferedReader br = new BufferedReader(isr);
			String line = null;
			while ((line = br.readLine()) != null) {
				String[] array = line.split(",");
				System.out.println(line);
			}
			System.out.println("\n");
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	public List split() { //分割資料 讓CSV能成功匯入資料庫
		List<String> myList = new ArrayList();
		try (Connection connection = getDataSource().getConnection();	
				) {
			FileInputStream fis = new FileInputStream("src/main/java/xxx30514/table3.csv");
			InputStreamReader isr = new InputStreamReader(fis, "UTF8");
			BufferedReader br = new BufferedReader(isr);
			int line;
			String a="";
	        while((line = br.read())!=-1){
	        	char c=(char)line;
	        	a=a.concat(String.valueOf(c));
	         }
	        String tempArray[]  = a.split("[,\n]");//分割逗號
	        for (int i = 0; i < tempArray.length; i++) {
	        	myList.add(tempArray[i]);//將資料加入arrayList
	        }
	
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return myList;
	}
	public List split2() { //分割資料 讓CSV能成功匯入資料庫
		List<String> myList = new ArrayList();
		try (Connection connection = getDataSource().getConnection();	
				) {
			FileInputStream fis = new FileInputStream(ctx.getRealPath("/WEB-INF/pages/bike/biketemp/restarea.csv"));
			InputStreamReader isr = new InputStreamReader(fis, "UTF8");
			BufferedReader br = new BufferedReader(isr);
			int line;
			String a="";
	        while((line = br.read())!=-1){
	        	char c=(char)line;
	        	a=a.concat(String.valueOf(c));
	         }
	        String tempArray[]  = a.split("[,\n]");//分割逗號
	        for (int i = 0; i < tempArray.length; i++) {
	        	myList.add(tempArray[i]);//將資料加入arrayList
	        }
	
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return myList;
	}
	public List split3() { //分割資料 讓CSV能成功匯入資料庫
		List<String> myList = new ArrayList();
		try (Connection connection = getDataSource().getConnection();	
				) {
			FileInputStream fis = new FileInputStream(ctx.getRealPath("/WEB-INF/pages/bike/biketemp/tablefm.csv"));
			InputStreamReader isr = new InputStreamReader(fis, "UTF8");
			BufferedReader br = new BufferedReader(isr);
			int line;
			String a="";
	        while((line = br.read())!=-1){
	        	char c=(char)line;
	        	a=a.concat(String.valueOf(c));
	         }
	        String tempArray[]  = a.split("[,\n]");//分割逗號
	        for (int i = 0; i < tempArray.length; i++) {
	        	myList.add(tempArray[i]);//將資料加入arrayList
	        }
	
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return myList;
	}
	public List splitHotBikeRoad() { //分割資料 讓CSV能成功匯入資料庫
		List<String> myList = new ArrayList();
		try (Connection connection = getDataSource().getConnection();	
				) {
			FileInputStream fis = new FileInputStream(ctx.getRealPath("/WEB-INF/pages/bike/biketemp/hotbike.csv"));
			InputStreamReader isr = new InputStreamReader(fis, "UTF8");
			BufferedReader br = new BufferedReader(isr);
			int line;
			String a="";
	        while((line = br.read())!=-1){
	        	char c=(char)line;
	        	a=a.concat(String.valueOf(c));
	         }
	        String tempArray[]  = a.split("[,\n]");//分割逗號
	        for (int i = 0; i < tempArray.length; i++) {
	        	myList.add(tempArray[i]);//將資料加入arrayList
	        }
	
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return myList;
	}
	
	public void insert() {// 將CSV匯入資料庫   迴圈需要注意資料內容有無,
		try (Connection connection = getDataSource().getConnection();	
				PreparedStatement pstmt = connection.prepareStatement(
						"insert into Bike (id,name,begin,goal,city,town,maintain,m,latitude,longitude) values(?,?,?,?,?,?,?,?,?,?)");) {
			List<String> list = split();
			for (int i = 10; i < list.size(); i+=10) {
				pstmt.setString(1, list.get(i));// 印出資料
				pstmt.setString(2, list.get(i + 1));// 印出資料
				pstmt.setString(3, list.get(i + 2));
				pstmt.setString(4, list.get(i + 3));
				pstmt.setString(5, list.get(i + 4));
				pstmt.setString(6, list.get(i + 5));
				pstmt.setString(7, list.get(i + 6));
				pstmt.setString(8, list.get(i + 7));
				pstmt.setString(9, list.get(i + 8));
				pstmt.setString(10, list.get(i + 9));
				pstmt.executeUpdate();
				pstmt.clearParameters();
			}
			System.out.println("已將資料匯入");
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
	public void readcsv2() {// 讀取CSV
		try (Connection connection = getDataSource().getConnection();) 
		{
			FileInputStream fis = new FileInputStream("src/main/java/xxx30514/restarea.csv");
			InputStreamReader isr = new InputStreamReader(fis, "UTF8");
			BufferedReader br = new BufferedReader(isr);
			String line = null;
			while ((line = br.readLine()) != null) {
				String[] array = line.split(",");
				System.out.println(line);
			}
			System.out.println("\n");
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	public void insertfinalbike() {// 將CSV匯入資料庫   迴圈需要注意資料內容有無,
		try (Connection connection = getDataSource().getConnection();	
				PreparedStatement pstmt = connection.prepareStatement(
						"insert into Bike (BK_name,BK_begin,BK_goal,BK_city,BK_town,BK_maintain,BK_m,BK_latitude,BK_longitude) values(?,?,?,?,?,?,?,?,?)");) {
			List<String> list = split3();
			for (int i = 0; i < list.size(); i+=9) {
				pstmt.setString(1, list.get(i));// 印出資料
				pstmt.setString(2, list.get(i+1));// 印出資料
				pstmt.setString(3, list.get(i+2));
				pstmt.setString(4, list.get(i+3));
				pstmt.setString(5, list.get(i+4));
				pstmt.setString(6, list.get(i+5));
				pstmt.setString(7, list.get(i+6));
				pstmt.setString(8, list.get(i+7));
				pstmt.setString(9, list.get(i+8));
				pstmt.executeUpdate();
				pstmt.clearParameters();
			}
			System.out.println("已將資料匯入");
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
	public void insertrestarea() {// 將CSV匯入資料庫   迴圈需要注意資料內容有無,
		try (Connection connection = getDataSource().getConnection();	
				PreparedStatement pstmt = connection.prepareStatement(
						"insert into Restarea (re_city,re_town,re_name,re_address,re_tel) values(?,?,?,?,?)");) {
			List<String> list = split2();
			for (int i = 0; i < list.size(); i+=5) {
				pstmt.setString(1, list.get(i));// 印出資料
				pstmt.setString(2, list.get(i+1));// 印出資料
				pstmt.setString(3, list.get(i+2));
				pstmt.setString(4, list.get(i+3));
				pstmt.setString(5, list.get(i+4));
				pstmt.executeUpdate();
				pstmt.clearParameters();
			}
			System.out.println("已將資料匯入");
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
	public void insertHotBikeRoad() {// 將CSV匯入資料庫   迴圈需要注意資料內容有無,
		try (Connection connection = getDataSource().getConnection();	
				PreparedStatement pstmt = connection.prepareStatement(
						"insert into HotBikeRoad (HB_name,HB_city,HB_town,HB_description) values(?,?,?,?)");) {
			List<String> list = splitHotBikeRoad();
			for (int i = 0; i < list.size(); i+=4) {
				pstmt.setString(1, list.get(i));// 印出資料
				pstmt.setString(2, list.get(i+1));// 印出資料
				pstmt.setString(3, list.get(i+2));
				pstmt.setString(4, list.get(i+3));
				pstmt.executeUpdate();
				pstmt.clearParameters();
			}
			System.out.println("已將資料匯入");
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
	public static void main(String[] args) {
//		new BikeData().createBikeTable();
		new BikeData().insertfinalbike();
//		new BikeData().createBikeRestAreaTable();
		new BikeData().insertrestarea();
//		new BikeData().createBikeErrorTable();
//		new BikeData().dropTable();
//		new BikeData().insert();
		
		

	}

}
