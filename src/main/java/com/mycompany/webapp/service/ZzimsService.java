package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.webapp.dao.ZzimsDao;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Zzim;

public class ZzimsService {
	
	@Autowired
	private ZzimsDao zzimsDao;
	
	public void saveZzim(Zzim zzim) {
		zzimsDao.insert(zzim);
	}
	
	public List<Product> getzzimList(){
		List<Product> list=zzimsDao.selectAll(null);
		return list;
	}
	
	public void deleteZzim(Zzim zzim) {
		zzimsDao.delete(zzim);
	}
	

}
