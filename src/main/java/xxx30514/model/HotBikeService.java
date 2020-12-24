package main.java.xxx30514.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("hotBikeService")
public class HotBikeService {
	@Autowired
	private HotBikeDAO hbDao;
	
	public HotBikeService(HotBikeDAO hbDao) {
		this.hbDao=hbDao;
	}
	public List<HotBike> selectAllHotBikeNoPages() {
		return hbDao.selectAllHotBikeNoPages();
	}
	public HotBike select(Integer id) {

		return hbDao.select(id);
	}
}

