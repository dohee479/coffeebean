package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Zzim;

public interface ZzimsDao {
	public int insert(Zzim zzim);
	public List<Product> selectAll(String user_id);
	public int delete(Zzim zzim);
}
