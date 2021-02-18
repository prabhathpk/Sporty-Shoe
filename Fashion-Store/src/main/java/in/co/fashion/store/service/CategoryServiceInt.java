package in.co.fashion.store.service;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import in.co.fashion.store.entity.CategoryEntity;
import in.co.fashion.store.exception.DuplicateRecordException;

public interface CategoryServiceInt {

	public long add(CategoryEntity bean) throws DuplicateRecordException;
	
	public void update(CategoryEntity bean) throws DuplicateRecordException;
	
	public void delete(CategoryEntity bean);
	
	public CategoryEntity findByName(String name);
	
	public CategoryEntity findByPk(long id);
	
	public List<CategoryEntity> search(CategoryEntity bean, long pageNo, int pageSize);
	
	public List<CategoryEntity> search(CategoryEntity bean);
	
	public Blob getImageById(long id) throws SerialException, SQLException;
	
}
