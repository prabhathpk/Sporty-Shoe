package in.co.fashion.store.service;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import in.co.fashion.store.entity.ProductEntity;
import in.co.fashion.store.exception.DuplicateRecordException;


public interface ProductServiceInt {

public long add(ProductEntity bean) throws DuplicateRecordException;
	
	public void update(ProductEntity bean) throws DuplicateRecordException;
	
	public void delete(ProductEntity bean);
	
	public ProductEntity findByName(String name);
	
	
	public ProductEntity findByPk(long id);
	
	public List<ProductEntity> search(ProductEntity bean, long pageNo, int pageSize);
	
	public List<ProductEntity> search(ProductEntity bean);
	
	public Blob getImageById(long id) throws SerialException, SQLException;
	
}
