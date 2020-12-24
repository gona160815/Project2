package main.java.gona.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.catalina.tribes.transport.nio.ParallelNioSender;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

import main.java.gona.model.Area;
import main.java.gona.model.RbOrder;
import main.java.gona.model.RentalBike;
import main.java.gona.model.Store;

@Repository("rentalBikeDataDao")
public class RentalBikeDataDao {
	
	@Autowired
	@Qualifier("sessionFactory") //指定
	private SessionFactory sessionFactory; 
	
	private String query;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
//=======依照地區年度銷售額==========================

	public Map<String, ArrayList<Integer>> getAnnualSaleByArea(){
		Map<String, ArrayList<Integer>> map = new HashMap<>();
		
		ArrayList<Integer> northOrder = new ArrayList<Integer>();  //北部
		ArrayList<Integer> centerOrder = new ArrayList<Integer>(); //中部
		ArrayList<Integer> southOrder = new ArrayList<Integer>();  //南部
		ArrayList<Integer> eastOrder = new ArrayList<Integer>();   //東部

		for(int i=1;i<=12;i++) {
				if(i>=1 && i<=9) {
					
					Query<Integer> nquery = getSession().createSQLQuery("select sum(totalMoney) from rborder r,area a ,store s where r.bgstore = s.store_id and s.st_area = a.area_id and ordertime LIKE '%2020-0" + i + "%' and a.area_id < 5 ");
					Query<Integer> cquery = getSession().createSQLQuery("select sum(totalMoney) from rborder r,area a ,store s where r.bgstore = s.store_id and s.st_area = a.area_id and ordertime LIKE '%2020-0" + i + "%' and a.area_id > 6 and  a.area_id < 12 ");
					Query<Integer> squery = getSession().createSQLQuery("select sum(totalMoney) from rborder r,area a ,store s where r.bgstore = s.store_id and s.st_area = a.area_id and ordertime LIKE '%2020-0" + i + "%' and a.area_id >11 and a.area_id < 17");
					Query<Integer> equery = getSession().createSQLQuery("select sum(totalMoney) from rborder r,area a ,store s where r.bgstore = s.store_id and s.st_area = a.area_id and ordertime LIKE '%2020-0" + i + "%' and  a.area_id > 16 and a.area_id < 20 ");
					
					Object ob1 = nquery.uniqueResult();
					Integer  nsum = Integer.parseInt(ob1.toString()); 
					northOrder.add(nsum);
					
					Object ob2 = cquery.uniqueResult();
					Integer  csum = Integer.parseInt(ob2.toString()); 
					centerOrder.add(csum);
					
					
					Object ob3 = squery.uniqueResult();
					Integer  ssum = Integer.parseInt(ob3.toString()); 
					southOrder.add(ssum);
					
					Object ob4 = equery.uniqueResult();
					Integer  esum = Integer.parseInt(ob4.toString()); 
					eastOrder.add(esum);
					
				}else if(i>=10 && i<=12){
					
					Query<Integer> nquery = getSession().createSQLQuery("select sum(totalMoney) from rborder r,area a ,store s where r.bgstore = s.store_id and s.st_area = a.area_id and ordertime LIKE '%2020-" + i + "%' and a.area_id < 5 ");
					Query<Integer> cquery = getSession().createSQLQuery("select sum(totalMoney) from rborder r,area a ,store s where r.bgstore = s.store_id and s.st_area = a.area_id and ordertime LIKE '%2020-" + i + "%' and a.area_id > 6 and  a.area_id < 12 ");
					Query<Integer> squery = getSession().createSQLQuery("select sum(totalMoney) from rborder r,area a ,store s where r.bgstore = s.store_id and s.st_area = a.area_id and ordertime LIKE '%2020-" + i + "%' and a.area_id >11 and a.area_id < 17");
					Query<Integer> equery = getSession().createSQLQuery("select sum(totalMoney) from rborder r,area a ,store s where r.bgstore = s.store_id and s.st_area = a.area_id and ordertime LIKE '%2020-" + i + "%' and  a.area_id > 16 and a.area_id < 20 ");
					
					Object ob1 = nquery.uniqueResult();
					Integer  nsum = Integer.parseInt(ob1.toString()); 
					northOrder.add(nsum);
					
					Object ob2 = cquery.uniqueResult();
					Integer  csum = Integer.parseInt(ob2.toString()); 
					centerOrder.add(csum);
					
					
					Object ob3 = squery.uniqueResult();
					Integer  ssum = Integer.parseInt(ob3.toString()); 
					southOrder.add(ssum);
					
					Object ob4 = equery.uniqueResult();
					Integer  esum = Integer.parseInt(ob4.toString()); 
					eastOrder.add(esum);						
				}				
			}	
		
				map.put("north", northOrder);
				map.put("center", centerOrder);
				map.put("south", southOrder);
				map.put("east", eastOrder);
				
				return map;
	}

//===============各家分店年度營業額===================================================

	//	select s.st_name ,sum(totalMoney) from store s , rborder r where r.bgStore = s.store_id  and ordertime like '%2020/%'group by s.st_name order by sum(totalMoney)
	public Map<String,ArrayList> getAnnualSaleByStore(){
		Map<String,ArrayList> map = new HashMap<>();
		Query query = getSession().createSQLQuery("select s.st_name ,sum(totalMoney) as totalMoney from store s , rborder r where r.bgStore = s.store_id  and ordertime like '%2020-%'group by s.st_name");			
		List result = query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
		ArrayList<String> nameList = new ArrayList<String>();
		ArrayList<Integer> saleList = new ArrayList<Integer>();
		
		for(Object object : result) {
			Map obj = (Map) object;
			String stname = obj.get("ST_NAME").toString();
			nameList.add(stname);
			String totalMoneyStr = obj.get("TOTALMONEY").toString();
			Integer totalMoney = Integer.parseInt(totalMoneyStr);
			saleList.add(totalMoney);
		}
		
		map.put("stname",nameList);
		map.put("totalMoney",saleList);
	
		return map;
	}

//==============各車種年度銷售額=========================================================
//	select t.typename ,sum(c.money*c.count) as bikesale from rborder r ,rbcart c ,rentalbike rb ,simplebike s, rb_type t
//	where  r.rborderid = c.rborderid and c.rbid= rb.rbid and rb.simplebike = s.simbikeid and s.typeid = t.typeid
//	and r.ordertime like '%2020-%'group by t.typename
	public Map<String,ArrayList> getAnnualSaleByBike(){
		Map<String,ArrayList> map = new HashMap<>();
		Query query = getSession().createSQLQuery(
			"select t.typename ,sum(c.money*c.count) as bikesale from rborder r ,rbcart c ,rentalbike rb ,simplebike s, rb_type t where  r.rborderid = c.rborderid and c.rbid= rb.rbid and rb.simplebike = s.simbikeid and s.typeid = t.typeid and r.ordertime like '%2020-%'group by t.typename");			
		List result = query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
		ArrayList<String> typeList = new ArrayList<String>();
		ArrayList<Integer> saleList = new ArrayList<Integer>();
		
		for(Object object : result) {
			Map obj = (Map) object;
			String stname = obj.get("TYPENAME").toString();
			typeList.add(stname);
			String totalMoneyStr = obj.get("BIKESALE").toString();
			Integer totalMoney = Integer.parseInt(totalMoneyStr);
			saleList.add(totalMoney);
		}
		
		map.put("typeName",typeList);
		map.put("totalMoney",saleList);
	
		return map;
	}
	
}
