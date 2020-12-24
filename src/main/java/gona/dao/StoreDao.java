package main.java.gona.dao;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.gona.model.Area;
import main.java.gona.model.RbStock;
import main.java.gona.model.RbType;
import main.java.gona.model.RentalBike;
import main.java.gona.model.SimpleBike;
import main.java.gona.model.Store;
import main.java.jackey.util.GlobalService;

@Repository("storeDao")
public class StoreDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private int pageNo = 0;
	private int totalPages = -1;
	private int recordsPerPage = GlobalService.RECORDS_PER_PAGE;
	private String tagName;
	private String query;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	

	// 頁數----------------------

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public long getRecordCounts() {
		long count = 0;
		String sql;
		Session session = getSession();
		sql = "select count(*) from Store as store";
		Query<Long> sCount = session.createQuery(sql, Long.class);
		count = sCount.uniqueResult();
		System.out.println("總筆數" + count);
		return count;
	}

	// 總頁數----------------------
	public int getTotalPages() {
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}

	public int getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}

	// 取得店家資訊/頁數

	public List<Store> getPageStores() {
		int startPageNo = (pageNo - 1) * recordsPerPage;
		Session session = getSession();
		Query<Store> rs = session.createQuery("From Store order by store_id", Store.class);
		rs.setFirstResult(startPageNo);
		rs.setMaxResults(recordsPerPage);
		System.out.println("第一筆資料" + startPageNo);
		List<Store> pageStote = rs.list();
		return pageStote;
	}

	// 全部地區----
	public List<Area> getArea() {
		Session session = getSession();
		Query<Area> queryArea = session.createQuery("from Area", Area.class);
		List<Area> areaList = queryArea.list();
		return areaList;
	}

	// TagName-----

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public String getTagName() {
		return tagName;
	}

	// 建立Area的下拉式選單===

	public String getAreaSelect() {

		String option = "";
		List<Area> areaList = getArea();

		for (Area area : areaList) {
			int id = area.getArea_id();
			String name = area.getArea_name();
			option += "<option value=" + id + ">" + name + "</option>\n\t\t";
		}

		return option;
	}

	// 鎖定某筆店家資料-----
	public Store selectOne(String store_id) {
		Session session = getSession();
		Store store = session.get(Store.class, store_id);
		return store;
	}

	// 店家新增----
	public Store add(Store storeBean) {
		Session session = getSession();
		session.save(storeBean);
		return storeBean;
	}

	// 店家刪除----
	public boolean delete(String store_id) {
		Session session = getSession();
		Store rs = session.get(Store.class, store_id);
		if (rs != null) {
			session.delete(rs);
			System.out.println("Delete sucess");
			return true;
		}
		return false;
	}

	// 店家更改-----
	public Store update(String store_id, Store storeBean) {
		Session session = getSession();
		Store rs = session.get(Store.class, store_id);
		if (rs != null) {
			rs.setSt_name(storeBean.getSt_name());
			rs.setArea(storeBean.getArea());
			rs.setSt_address(storeBean.getSt_address());
			rs.setSt_tel(storeBean.getSt_tel());
			rs.setSt_mail(storeBean.getSt_mail());
			rs.setSt_holiday(storeBean.getSt_holiday());
			rs.setSt_bgtime(storeBean.getSt_bgtime());
			rs.setSt_edtime(storeBean.getSt_edtime());
			rs.setSt_imgFile1(storeBean.getSt_imgFile1());

			System.out.println("update sucess");

		} else {
			System.out.println("failure");
		}
		return rs;
	}

	// 地區查詢-------
	public List<Store> selectByArea(Integer st_area, String st_address) {
		Session session = getSession();
		if (st_area != 0 && st_address == null) {
			Query<Store> queryStore = session.createQuery("from Store where st_area = ?1", Store.class);
			queryStore.setParameter(1, st_area);
			List<Store> storeList = queryStore.getResultList();
			System.out.println("搜尋方法一");
			return storeList;
		} else if (st_area != 0 && st_address != null) {
			Query<Store> queryStore = session.createQuery("from Store where st_area = ?1 and  st_address like ?2",
					Store.class);
			queryStore.setParameter(1, st_area);
			queryStore.setParameter(2, "%" + st_address + "%");
			List<Store> storeList = queryStore.getResultList();
			System.out.println("搜尋方法二");
			return storeList;
		} else {
			System.out.println("查詢資料錯誤");
			return null;
		}

	}
	
	//篩選特定門市的庫存-----
	public List<RbStock> selectStockByStore(String store_id){
		Session session = getSession(); 
		Query<RbStock> query = session.createQuery("from RbStock where store_id =?1",RbStock.class);
		query.setParameter(1,store_id);
		List<RbStock> list = query.list();
		return list;		
	}
	
	//腳踏車庫存CRUD---------
	
	public RbStock selectRbStock(String rbStockId) {
		Session session = getSession(); 
		return (RbStock)session.get(RbStock.class,rbStockId);
	}
	
	public RbStock insertRbStock(RbStock rbStock) {
		Session session = getSession();
		session.save(rbStock);
		return rbStock;
	}
	
	public boolean deleteRbStock(String rbStockId) {
		Session session = getSession();
		RbStock rs = session.get(RbStock.class,rbStockId);
		if(rs != null) {
			session.delete(rs);
			return true;
		}
		return false;
	}
	
	public void updateRbStock(RbStock rbStock) {
		Session session = getSession();
		session.update(rbStock);
	}
	
	//得到所有店家---------------------------
	
	public List<Store> getAllStore(){
		Session session = getSession(); //與資料庫取得連線
		query = "from Store";
		List<Store> store = session.createQuery(query).list(); //撈出所有資料
		return store;		
	}
	
	//建立所有店家的下拉式選單---------------
	
	 public String getAllStoreSelect() { 
		 String option = "";
		 List<Store> storeList =  getAllStore();
				 
		 for(Store store:storeList) {
			 String id = store.getStore_id();
			 String name = store.getSt_name();
			 option += "<option value=" + id + ">" + name +"</option>\n\t\t";
		 }	 
		 	return option;
	 }
	 
	 //用areaId找到地區----------------------------------
	 	
	 public Area selectAreaById(int areaId) {
		 Session session = getSession(); //與資料庫取得連線
		 Query<Area> query = session.createQuery("from Area where area_id =?1",Area.class);
		 query.setParameter(1,areaId);
		 Area area = query.uniqueResult();
		 return area;
	 }
	 
	 //從店家搜尋腳踏車(含尺寸)-----------------------
	 public List<RentalBike> getBikeByStore(String storeId){
		 Session session = getSession(); //與資料庫取得連線
		 Query<RentalBike> query = session.createQuery("select r from RentalBike r left join fetch r.rbStock rs left join fetch rs.store s where s.store_id=?1",RentalBike.class);
		 query.setParameter(1,storeId);
		 List<RentalBike> list = query.list();
		 return list;		
	 } 
	 
	 //從店家搜尋腳踏車(不含尺寸，用TYPE分類)---------------
	 public List<RbType> getTypeByStore(String storeId){
		 Session session = getSession();
		 Query<RbType> query = session.createQuery("select distinct t from RbType t join fetch t.simpleBike s join fetch s.rentalbike rb join fetch rb.rbStock rs join fetch rs.store s where s.store_id=?1",RbType.class);
		 query.setParameter(1,storeId);
		 List<RbType> list = query.list();
		 return list;	 
	 }
	 
	//灌DB囉囉囉囉-------------------------------------------------------
		
		private DataSource dataSource;
		public DataSource getDataSource() {
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
		
		
		public void inputStore() {
			
			String sql = "INSERT INTO STORE(ST_NAME, ST_AREA, ST_ADDRESS,ST_TEL,ST_MAIL,ST_HOLIDAY,ST_BGTIME,ST_EDTIME,ST_IMGFILE1) VALUES(  ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			String path = "D:\\storejson";
			
			
			
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
				JSONArray results = new JSONArray(jsonObject.getJSONArray("results").toString());
				
				JSONObject jsonObject2 = new JSONObject(results.get(0).toString());
				JSONArray info = new JSONArray(jsonObject2.getJSONArray("items").toString());
				JSONObject hotel = null;
				int counter = 0;
				for (int i = 0; i < info.length(); i++) {
					hotel = (JSONObject) info.get(i);
					pstmt.setString(1, hotel.getString("st_name"));
					pstmt.setInt(2, hotel.getInt("st_area"));
					pstmt.setString(3, hotel.getString("st_address"));
					pstmt.setString(4, hotel.getString("st_tel"));
					pstmt.setString(5, hotel.get("st_mail").toString());
					pstmt.setString(6, hotel.get("st_holiday").toString());
					pstmt.setString(7, hotel.get("st_bgtime").toString());
					pstmt.setString(8, hotel.get("st_edtime").toString());
					pstmt.setString(9, hotel.get("st_imgfile1").toString());
					
//					pstmt.addBatch();
//					pstmt.clearParameters();
//					counter++;
//					if (counter % 50 == 0) {
//						pstmt.executeBatch();
//						pstmt.clearBatch();
//					}
					pstmt.executeUpdate();
					conn.commit();
				}
//				pstmt.executeBatch();
//				pstmt.clearBatch();
				System.out.println("已匯入JSON資料至資料庫！");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}

}
