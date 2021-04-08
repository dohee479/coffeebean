package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ZzimsDao;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Zzim;

@Service
public class ZzimsService {
	
	@Autowired
	private ZzimsDao zzimsDao;
	
	public String saveZzim(Zzim zzim) {
		Zzim dbzzim=zzimsDao.alreadyProduct(zzim);
		if(dbzzim!=null) {
			return "alreadyProduct";
		}else {
			zzimsDao.insert(zzim);
			return "success";
		}
		
	}
	public Zzim getzzim(Zzim zzim) {
		Zzim dbzzim=zzimsDao.alreadyProduct(zzim);
		return dbzzim;
	}
	
	public List<Product> getzzimList(String user_id){
		List<Product> list=zzimsDao.selectAll(user_id);
		return list;
	}
	
	public void deleteZzim(Zzim zzim) {
		zzimsDao.delete(zzim);
	}
	

}
