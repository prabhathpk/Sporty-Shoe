package in.co.fashion.store.service;

import java.util.List;

import in.co.fashion.store.entity.CartEntity;
import in.co.fashion.store.exception.DuplicateRecordException;

public interface CartServiceInt {

	public long add(CartEntity bean) throws DuplicateRecordException;
	
	public void update(CartEntity bean) throws DuplicateRecordException;
	
	public void delete(CartEntity bean);
	
	public CartEntity findByName(String name);
	
	public CartEntity findByPk(long id);
	
	public CartEntity findByProductAndUser(long prodId,long uId);
	
	public List<CartEntity> search(CartEntity bean, long pageNo, int pageSize);
	
	public List<CartEntity> search(CartEntity bean);
	
}
