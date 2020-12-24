package main.java.gona.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.imageio.stream.ImageInputStream;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.jaxb.hbm.spi.SimpleValueTypeInfo;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Repository;

import main.java.gona.model.RbStock;
import main.java.gona.model.RbType;
import main.java.gona.model.RentalBike;
import main.java.gona.model.SimpleBike;
import main.java.gona.model.Store;
import oracle.net.aso.l;

@Repository("rentalBikeDao")
public class RentalBikeDao {
	
	@Autowired
	@Qualifier("sessionFactory") //指定
	private SessionFactory sessionFactory; 
	
	private String query;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

//========腳踏車清單=========
	
	public List<RentalBike> getAllBikes(){
		Session session = getSession(); //與資料庫取得連線
		query = "from RentalBike";
		List<RentalBike> bikes = session.createQuery(query).list(); //撈出所有資料
		return bikes;		
	}
	
	
//========腳踏車種類清單===========
	
	public List<RbType> getAllType(){
		Session session = getSession();
		query = "from RbType";
		List<RbType> rbTypes = session.createQuery(query).list();	
		return rbTypes;
	}
//========腳踏車CRUD===============
	
	public RentalBike selectBike(String rbId) {
		Session session = getSession(); 
		return (RentalBike)session.get(RentalBike.class, rbId);
	}
	
	public RentalBike insertBike(RentalBike bike) {
		Session session = getSession();
		session.save(bike);
		return bike;
	}

	public boolean deleteBike(String rbId) {
		Session session = getSession();
		RentalBike rs = session.get(RentalBike.class,rbId);
		if(rs != null) {
			session.delete(rs);
			return true;
		}
		return false;
	}
	
	public void updateBike(RentalBike bike) {
		Session session = getSession();
		session.update(bike);
	}

//========腳踏車種類CRUD============
	
	public RbType selectType(String typeId) {
		Session session = getSession(); 
		return (RbType)session.get(RbType.class,typeId);
	}
	
	public RbType insertType(RbType type) {
		Session session = getSession();
		session.save(type);
		return type;
	}
	
	public boolean deleteType(String typeId) {
		Session session = getSession();
		RbType rs = session.get(RbType.class,typeId);
		if(rs != null) {
			session.delete(rs);
			return true;
		}
		return false;
	}
	
	public void updateType(RbType type) {
		Session session = getSession();
		session.update(type);
	}
//======簡單腳踏車CRUD=========================
	
	public SimpleBike selectSimBike(String simRbId) {
		Session session = getSession(); 
		return (SimpleBike)session.get(SimpleBike.class,simRbId);
	}
	
	public SimpleBike insertSimBike(SimpleBike simpleBike) {
		Session session = getSession();
		session.save(simpleBike);
		return simpleBike;
	}
	
	public boolean deleteSimBike(String simRbId) {
		Session session = getSession();
		SimpleBike rs = session.get(SimpleBike.class,simRbId);
		if(rs != null) {
			session.delete(rs);
			return true;
		}
		return false;
	}
	
	public void updateSimBike(SimpleBike simpleBike) {
		Session session = getSession();
		session.update(simpleBike);
	}
	
//======查詢在某種類底下的所有腳踏車===========
	
	public List<RentalBike> getAllBikeByType(String typeId){
		Session session = getSession(); //與資料庫取得連線
		Query<RentalBike> query = session.createQuery("select r from RentalBike r left join fetch r.simBike s left join fetch s.rbType t where t.typeId=?1",RentalBike.class);				
		query.setParameter(1,typeId);
		List<RentalBike> list = query.list();
		return list;
	}
	
//======查詢在某種腳踏車下的所有尺寸==============
	
	public List<RentalBike> getAllBikeSize(String simRbId){
		Session session = getSession(); //與資料庫取得連線
		Query<RentalBike> query = session.createQuery("from RentalBike where simpleBike =?1",RentalBike.class);
		query.setParameter(1,simRbId);
		List<RentalBike> list = query.list();
		return list;
	}
	
//=====查詢在某種類底下的所有腳踏車(去除重複尺寸)===
	
	public List<RentalBike> getAllBikeByTypeDis(){
		Session session = getSession(); //與資料庫取得連線
		query = "select distinct rbName from RentalBike";
		List<RentalBike> bikes = session.createQuery(query).list(); //撈出所有資料
		return bikes;		
	}
	
//======把圖片撈出來(Blob to byte[])============================
	
	 public byte[] blobToBytes(Blob blob) {
 		InputStream is = null;
 		byte[] b = null;
 		try {
 			is = blob.getBinaryStream();
 			b = new byte[(int) blob.length()];
 			is.read(b);
 			return b;
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			try {
 				is.close();
 				is = null;
 			} catch (IOException e) {
 				e.printStackTrace();
 			}
 		}
 		return b;
 	}
//=====查詢簡單腳踏車清單(不包含SIZE)============================
	 
	 public List<SimpleBike> getSimpleBikeByType(String typeId){
			Session session = getSession(); //與資料庫取得連線
			Query<SimpleBike> query = session.createQuery("from SimpleBike where typeId =?1",SimpleBike.class);
			query.setParameter(1,typeId);
			List<SimpleBike> list = query.list();
			return list;
	}

//===建立所有腳踏車種類的下拉式選單=========================================
	 
	 public String getRbTypeSelect() {
			 
		 String option = "";
		 List<RbType> rbTypes = getAllType();
				 
		 for(RbType type:rbTypes) {
			 String id = type.getTypeId();
			 String name = type.getTypeName();	 
			 option += "<option value=" + id + ">" + name +"</option>\n\t\t";
		 }	 
		 	return option;
	 }
	 
//===判斷哪些店家擁有該腳踏車=================================================
	 
	 public List<Store> getStoreByBike(String simRbId){
		 Session session = getSession(); //與資料庫取得連線
//		 select distinct s.st_name,s1.rbname from simplebike s1, rentalbike r,rb_stock rs ,store s
//		 where   s1.simbikeid = r.simplebike and r.rbid = rs.rbid and rs.store_id = s.store_id and s1.simbikeid ='SIM_RB_305' and rs.rbstock > 0;
		 Query<Store> query = session.createQuery("select distinct s from Store s left join fetch s.rbStock rs left join fetch  rs.rentalBike r left join fetch  r.simBike s1  where s1.simRbId=?1",Store.class);
		 query.setParameter(1,simRbId);
		 List<Store> list = query.list();
		 return list;		 		 	 
	 }
	 
//======取得時間區段==============================================================
	 
	 public static List<Date> findDates(String bgDateStr, String edDateStr) throws ParseException {
		 SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd");
		 Date bgDate = sdf.parse(bgDateStr);
		 Date edDate = sdf.parse(edDateStr);
         List<Date> dateList = new ArrayList<Date>();
         dateList.add(bgDate);
         Calendar calBegin = Calendar.getInstance(); //獲得起始日的日曆
         calBegin.setTime(bgDate);
         Calendar calEnd = Calendar.getInstance(); // 獲得結束日的日曆
         calEnd.setTime(edDate);
         while (edDate.after(calBegin.getTime()))  { // 如果結束日晚於起始日
          
              calBegin.add(Calendar.DAY_OF_MONTH, 1); //加一天
              dateList.add(calBegin.getTime());
         }
         return dateList;
    }
	 
//===用RBID撈庫存========================================================
	 
	 public Integer rbStockInt(String rbId,String storeId,String bgDateStr, String edDateStr) {
		 Session session = getSession(); //與資料庫取得連線
		 Query<RbStock>  query = session.createQuery("from RbStock where rbId =?1 and store_Id=?2",RbStock.class);
		 query.setParameter(1,rbId);
		 query.setParameter(2,storeId);
		 RbStock stock = query.getSingleResult();
		 Integer rbStockInt = stock.getRbStock(); //找到該筆庫存數量
		 System.out.println("現在這台腳踏車"+rbId+"預約的門市"+storeId+"起始日"+bgDateStr+"還車日"+edDateStr+"目前的庫存量"+rbStockInt);
		 
//		 select  SUM(rc.count) from rborder ro , rbcart rc  where  ro.rborderid = rc.rborderid and
//				 ((ro.bgdate <'2020/12/16'  and ro.eddate > '2020/12/16' and ro.eddate < '2020/12/20') or 
//				 (ro.bgdate >= '2020/12/16' and ro.eddate <= '2020/12/20' ) or
//				 (ro.bgdate > '2020/12/16' and ro.bgdate < '2020/12/20' and ro.eddate > ' 2020/12/20'))
//				 and rc.rbid = 'RB396' and ro.bgstore='RS1006';
//		
		 
//		 select
//	        SUM(rc.count) 
//	    from
//	        rborder ro ,
//	        rbcart rc  
//	    where
//	        ro.rborderid = rc.rborderid 
//	        and(
//	            (
//	                ro.bgdate <'2021-04-02'
//	                and ro.eddate > '2021-04-02' 
//	                and ro.eddate < '2021-04-08'
//	            ) 
//	            or(
//	                ro.bgdate >= '2021-04-02' 
//	                and ro.eddate <= '2021-04-08'
//	            ) 
//	            or(
//	                ro.bgdate < '2021-04-02'
//	                and ro.eddate > '2021-04-08'
//	            )
//	            or(
//	                ro.bgdate > '2021-04-02' 
//	                and ro.bgdate < '2021-04-08' 
//	                and ro.eddate > '2021-04-08'
//	            )
//	        ) 
//	        and rc.rbid = 'RB396'
//	        and ro.bgstore='RS1006'
		 
		 Query q = session.createSQLQuery("select SUM(rc.count) from rborder ro , rbcart rc  where  ro.rborderid = rc.rborderid and"+
				 						  "((ro.bgdate <'"+bgDateStr+"'and ro.eddate >= '"+bgDateStr+"' and ro.eddate <= '"+edDateStr+"') or"+
				 						  "(ro.bgdate < '"+bgDateStr+"' and ro.eddate > '"+edDateStr+"') or"+
				 						  "(ro.bgdate >= '"+bgDateStr+"' and ro.eddate <= '"+edDateStr+"') or"+
				 						  "(ro.bgdate >= '"+bgDateStr+"' and ro.bgdate <= '"+edDateStr+"' and ro.eddate > '"+edDateStr+"')) and rc.rbid = '"+rbId+"'and ro.bgstore='"+storeId+"'");
		
				 try{
					 Object ob1 = q.uniqueResult();
					 Integer  sum = Integer.parseInt(ob1.toString()); 
					 rbStockInt -= sum;
					 System.out.println("這是try 他的sum是多少咧"+sum);			 
				 }catch(NullPointerException e){
					 Integer sum = 0;
					 rbStockInt -= 0;
					 System.out.println("這是catch 他的sum是多少咧"+sum);
				 } 
		
		if(rbStockInt<0) {
			rbStockInt = 0;
		}
		
		System.out.println("扣除後的總額"+rbStockInt);
  
		 return rbStockInt;		 
	 }
}
