package main.java.sixsix.dao;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.json.JSONArray;
import org.json.JSONObject;




public class HomestayDAO {
	
	private DataSource dataSource;
	public DataSource getDataSource() {
		System.out.println("123");
		System.out.println(dataSource);
		if(dataSource == null) {
			BasicDataSource ds = new BasicDataSource();
			ds.setDriverClassName("oracle.jdbc.OracleDriver");
			ds.setUrl("jdbc:oracle:thin:@//localhost:1521/XEPDB1");
			ds.setUsername("pm");
			ds.setPassword("pm");
			ds.setMaxTotal(50); // 設定最多connection上線,超過使用量必須等待
			ds.setMaxIdle(50);

			dataSource = ds;// 把BasicDataSource放在屬性上
		}
        return dataSource;
	}
	
	public void CreateTable() {
		try{
			System.out.println("123");
			Connection conn = getDataSource().getConnection();
			System.out.println("123");
			Statement stmt = conn.createStatement();
			String sql = "CREATE TABLE Homestay"
					+"(ID1 VARCHAR2(1000),"
					+"NAME1 VARCHAR2(1000),"
					+"DESCRIPTION1 NVARCHAR2(2000),"
					+"ADD1 VARCHAR2(1000),"
					+"TELLPHONE VARCHAR2(1000),"
					+"REGION VARCHAR2(1000),"
					+"TOWN VARCHAR2(1000),"
					+"PICTUREL VARCHAR2(1000),"
					+"SERVICEINFO VARCHAR2(1000),"
					+"PARKINGINFO VARCHAR2(1000),"
					+"PX DECIMAL(30,20),"
					+"PY DECIMAL(30,20))";
			stmt.executeUpdate(sql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void insertData() {
		try(
		Connection conn = getDataSource().getConnection();
				Statement stmt = conn.createStatement();
		PreparedStatement pstmt=conn.prepareStatement("insert into REGIST (ID,NAME,GENDER,TEL,EMALL,BIRTHDAY,AREA,FAVOR,PASSWORD) values (?,?,?,?,?,?,?,?,?)");
				ResultSet rs1 = stmt.executeQuery("select count(*) from regist");
		){
			
//			rs1.next();
//			String nn = rs1.getString("count(*)");
//			System.out.println(nn);
//			int n1=Integer.parseInt(nn)+1;
//			System.out.println("ID����蔭"+n1);
			pstmt.setInt(1, 1);
			pstmt.setString(2, "123");
			pstmt.setString(3, "123");
			pstmt.setString(4, "123");
			pstmt.setString(5, "123");
			pstmt.setString(6, "123");
			pstmt.setString(7, "123");
			pstmt.setString(8, "123");
			pstmt.setString(9, "123");
			
			pstmt.executeUpdate();
			pstmt.clearParameters();
		
		
		
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}
	
	
	
public void Inputdata() {
		
//		String path = "https://gis.taiwan.net.tw/XMLReleaseALL_public/hotel_C_f.json";
//		URL url = new URL(path);
		String sql = "INSERT INTO Homestay(ID1, NAME1, DESCRIPTION1, ADD1, TELLPHONE, REGION, TOWN, PICTUREL, SERVICEINFO, PARKINGINFO, PX, PY) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String path = "C:\\Users\\user\\Desktop\\hotel.json";
		
		
		
		try (BufferedReader br = new BufferedReader(new FileReader(path));
				Connection conn = getDataSource().getConnection();) {
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			String s;
			StringBuffer sb = new StringBuffer();
			while ((s = br.readLine()) != null) {
				sb.append(s);
			}

			JSONObject jsonObject = new JSONObject(sb.toString());
			JSONObject xml = new JSONObject(jsonObject.getJSONObject("XML_Head").toString());
			JSONObject infos = new JSONObject(xml.getJSONObject("Infos").toString());
			JSONArray info = new JSONArray(infos.getJSONArray("Info").toString());
			JSONObject hotel = new JSONObject();
			
			int counter = 0;
			for (int i = 0; i < info.length(); i++) {
				hotel = (JSONObject) info.get(i);
				pstmt.setString(1, hotel.getString("Id"));
				pstmt.setString(2, hotel.getString("Name"));
				pstmt.setString(3, hotel.getString("Description"));
				pstmt.setString(4, hotel.getString("Add"));
				pstmt.setString(5, hotel.getString("Tel"));
				pstmt.setString(6, hotel.get("Region").toString());
				pstmt.setString(7, hotel.get("Town").toString());
				pstmt.setString(8, hotel.get("Picture1").toString());
				pstmt.setString(9, hotel.get("Serviceinfo").toString());
				pstmt.setString(10, hotel.get("Parkinginfo").toString());
				pstmt.setBigDecimal(11, hotel.getBigDecimal("Px"));
				pstmt.setBigDecimal(12, hotel.getBigDecimal("Py"));
				
				pstmt.addBatch();
				pstmt.clearParameters();
				counter++;
				if (counter % 50 == 0) {
					pstmt.executeBatch();
					pstmt.clearBatch();
				}
			}
			pstmt.executeBatch();
			pstmt.clearBatch();
			conn.commit();
			System.out.println("已匯入JSON資料至資料庫！");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
	
}
