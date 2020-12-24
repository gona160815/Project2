package main.java.xxx30514.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("bikeService")
public class BikeService {
	@Autowired
	private BikeDAO bDao;

	public BikeService(BikeDAO bDao) {
		this.bDao = bDao;
	}

	public int getPageNo() {
		return bDao.getPageNo();
	}

	public void setPageNo(int pageNo) {
		bDao.setPageNo(pageNo);
	}

	public long getRecordCounts() {
		return bDao.getRecordCounts();
	}

	public long getSearchRecordCounts(String s, String s1) {
		return bDao.getSearchRecordCounts(s, s1);
	}

	public int getTotalPages() {
		return bDao.getTotalPages();
	}

	public int getSearchTotalPages(String s, String s1) {
		return bDao.getSearchTotalPages(s, s1);
	}

	public int getRecordsPerPage() {
		return bDao.getRecordsPerPage();
	}

	public void setRecordsPerPage(int recordsPerPage) {
		bDao.setRecordsPerPage(recordsPerPage);
	}

	public List<Bike> selectRoad(String s, String s1) {
		return bDao.selectRoad(s, s1);
	}

	public boolean deleteRoad(Integer bkID) {
		return bDao.deleteRoad(bkID);
	}

	public Bike insertRoad(Bike bean) {
		return bDao.insertRoad(bean);
	}

	public Bike updateRoad(Integer id, String name, String begin, String goal, String city, String town,
			String maintain, String m, String latitude, String longitude) {
		return bDao.updateRoad(id, name, begin, goal, city, town, maintain, m, latitude, longitude);
	}

	public List<Bike> selectAll() {
		return bDao.selectAllBikes();
	}

	public List<Bike> detailBikes(String bkID) {
		return bDao.detailBikes(bkID);
	}

	public List<Bike> selectAllBikeNoPages() {
		return bDao.selectAllBikeNoPages();
	}

	public List<Bike> selectAllBikeNotNull() {
		List<Bike> notNulllist = new ArrayList<Bike>();
		List<Bike> list = bDao.selectAllBikeNoPages();
		for (Bike itemBike : list) {
			System.out.println(itemBike.getLatitude());
			if (itemBike.getLatitude() != null) {
				notNulllist.add(itemBike);
			}
		}

		return notNulllist;
	}

	public Bike select(Integer id) {

		return bDao.select(id);
	}
}
